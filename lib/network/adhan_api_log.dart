import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../cash/cash_shared.dart';
import '../model/adhan_model.dart';

class AdhanNetwork {
  Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.aladhan.com/v1/timingsByAddress/now?address='));

  Future getadhandata(String url) async {
    try {
      final res = await dio.get(url);
      if (res.statusCode == 200) {
        if (kDebugMode) {
          print(res.data);
        }
        var jsonresponse = res.data;
        var timedata = Adhan_model.fromMap(jsonresponse);
        await Timeshared.setfajrtime(timedata.data.timings.Fajr);
        await Timeshared.setduhrtime(timedata.data.timings.Dhuhr);
        await Timeshared.setasrtime(timedata.data.timings.Asr);
        await Timeshared.setmegraibtime(timedata.data.timings.Maghrib);
        await Timeshared.setishatime(timedata.data.timings.Isha);
        return Adhan_model.fromMap(jsonresponse);
      }

      if (res.statusCode == 400) {
        if (kDebugMode) {
          print(res.data);
        }
      }
    } on DioError catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print(e.response!.statusMessage);
        }
      } else {
        if (kDebugMode) {
          print(e.response!.requestOptions);
        }
        if (kDebugMode) {
          print(e.response!.statusCode);
        }
      }
    }
  }
}
