import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

import 'local_notifications.dart';

class CountDwon extends StatelessWidget {
  CountDwon(
      {Key? key, this.fajr, this.duhur, this.asr, this.meghrib, this.isha})
      : super(key: key);
  final String? fajr;
  final String? duhur;
  final String? asr;
  final String? meghrib;
  final String? isha;
  @override
  Widget build(BuildContext context) {
    return TimerCountdown(
      format: CountDownTimerFormat.hoursMinutesSeconds,
      spacerWidth: 0,
      timeTextStyle: const TextStyle(color: Colors.black, fontSize: 12),
      colonsTextStyle: const TextStyle(color: Colors.black),
      minutesDescription: 'دقائق ',
      hoursDescription: "ساعات",
      secondsDescription: 'ثواني',
      descriptionTextStyle: const TextStyle(fontSize: 12),
      endTime: DateTime.now().isAfter(DateTime.parse(isha ?? ''))
          ? DateTime.parse(fajr ?? '').add(const Duration(days: 1))
          : DateTime.now().isBefore(DateTime.parse(duhur ?? ''))
              ? DateTime.parse(duhur ?? '')
              : DateTime.now().isBefore(DateTime.parse(asr ?? ''))
                  ? DateTime.parse(asr ?? '')
                  : DateTime.now().isBefore(DateTime.parse(meghrib ?? ''))
                      ? DateTime.parse(meghrib ?? '')
                      : DateTime.now().isBefore(DateTime.parse(isha ?? ''))
                          ? DateTime.parse(isha ?? "")
                          : DateTime.parse(fajr??'').add(const Duration(days: 1)),
      onEnd: () {
        if (DateTime.now().compareTo(DateTime.parse(fajr ?? '')) == 0) {
          LocalnotificationsFlutter().shownotification(
              id: 0,
              body: 'حان الان موعد اذان الفجر',
              title: 'حان الان موعد الاذان');
        }
        if (DateTime.now().compareTo(DateTime.parse(duhur ?? '')) == 0) {
          LocalnotificationsFlutter().shownotification(
              id: 0,
              body: 'حان الان موعد اذان الظهر',
              title: 'حان الان موعد الاذان');
        }
        if (DateTime.now().compareTo(DateTime.parse(asr ?? '')) == 0) {
          LocalnotificationsFlutter().shownotification(
              id: 0,
              body: 'حان الان موعد اذان العصر',
              title: 'حان الان موعد الاذان');
        }
        if (DateTime.now().compareTo(DateTime.parse(meghrib ?? '')) == 0) {
          LocalnotificationsFlutter().shownotification(
              id: 0,
              body: 'حان الان موعد اذان المغرب',
              title: 'حان الان موعد الاذان');
        }
        if (DateTime.now().compareTo(DateTime.parse(isha ?? '')) == 0) {
          LocalnotificationsFlutter().shownotification(
              id: 0,
              body: 'حان الان موعد اذان العشاء',
              title: 'حان الان موعد الاذان');
        }
      },
    );
  }
}
