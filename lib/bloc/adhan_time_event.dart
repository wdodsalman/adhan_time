part of 'adhan_time_bloc.dart';

@immutable
abstract class AdhanTimeEvent {}

class GetTimeAdhan extends AdhanTimeEvent {
  String city;
  GetTimeAdhan({
    required this.city,
  });
}

class GetAzkarnight extends AdhanTimeEvent {}
class GetAzkarsabah extends AdhanTimeEvent {}
class GetAzkarsalah extends AdhanTimeEvent {}
