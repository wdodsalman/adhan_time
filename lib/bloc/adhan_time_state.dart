part of 'adhan_time_bloc.dart';

@immutable
abstract class AdhanTimeState {}

class AdhanTimeInitial extends AdhanTimeState {}

class AdhanTimeLoading extends AdhanTimeState {}

class AdhanTimeSucces extends AdhanTimeState {
  final Adhan_model? adhantime;
  final Azkar_model_night? azkarnight;
  final Azkar_model_sabah? azkarsabah;
  final Azkar_model_salah? azkarsalah;
  AdhanTimeSucces({
    this.adhantime,
    this.azkarnight,
    this.azkarsabah,
    this.azkarsalah
  });
}

class AdhanTimeError extends AdhanTimeState {
  String error;
  AdhanTimeError({
    required this.error,
  });
}

class AzkarLoading extends AdhanTimeState {}

class AzkarSucces extends AdhanTimeState {
  final Azkar_model_night azkar;
  AzkarSucces({
    required this.azkar,
  });
}

class AzkarError extends AdhanTimeState {
  String error;
  AzkarError({
    required this.error,
  });
}
