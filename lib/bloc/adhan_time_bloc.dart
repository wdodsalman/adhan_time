import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../model/adhan_model.dart';
import '../model/azkar_model/azkar_after_salah/azkar_after_salah.dart';
import '../model/azkar_model/azkar_night/azkar_night.dart';
import '../model/azkar_model/azkar_sabah/azkar_sabah.dart';
import '../network/adhan_api_log.dart';

part 'adhan_time_event.dart';
part 'adhan_time_state.dart';

class AdhanTimeBloc extends Bloc<AdhanTimeEvent, AdhanTimeState> {
  Azkar_model_night? azkar = null;
  Azkar_model_sabah? azkar_sabah = null;
  Azkar_model_salah? azkar_salah = null;

  AdhanTimeBloc() : super(AdhanTimeInitial()) {
    on<GetTimeAdhan>(getAdhanApi);
    on<GetAzkarnight>(getAzkarNight);
    on<GetAzkarsabah>(getAzkarSabah);
    on<GetAzkarsalah>(getAzkarsalah);
  }

  void getAzkarNight(GetAzkarnight event, emit) async {
    final res = await rootBundle.loadString('lib/assets/azkar_night.json');
    final data = Azkar_model_night.fromJson(res);
    azkar = data;
    emit(AdhanTimeSucces(azkarnight: data));
  }

  void getAzkarSabah(GetAzkarsabah event, emit) async {
    final res = await rootBundle.loadString('lib/assets/azkar_sabah.json');
    final data = Azkar_model_sabah.fromJson(res);
    azkar_sabah = data;

    emit(AdhanTimeSucces(azkarsabah: data));
  }

  void getAzkarsalah(GetAzkarsalah event, emit) async {
    final res =
        await rootBundle.loadString('lib/assets/azkar_after_salah.json');
    final data = Azkar_model_salah.fromJson(res);
    azkar_salah = data;

    emit(AdhanTimeSucces(azkarsalah: data));
  }

  Future getAdhanApi(GetTimeAdhan event, emit) async {
    emit(AdhanTimeLoading());
    try {
      final adhantime = await AdhanNetwork()
          .getadhandata('${event.city}&method=3&iso8601=true');
      emit(AdhanTimeSucces(
          adhantime: adhantime,
          azkarnight: azkar ?? Azkar_model_night(content: [], title: ''),
          azkarsabah: azkar_sabah ?? Azkar_model_sabah(content: [], title: ''),
          azkarsalah:
              azkar_salah ?? Azkar_model_salah(content: [], title: '')));
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(AdhanTimeError(error: e.toString()));
    }
  }
}
