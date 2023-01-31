import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'bloc/adhan_time_bloc.dart';
import 'timing_ui.dart';

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key,
      this.city,
      this.fajr,
      this.duhur,
      this.asr,
      this.megrhib,
      this.isha});
  final String? city;
  final String? fajr;
  final String? duhur;
  final String? asr;
  final String? megrhib;
  final String? isha;

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'arabic'),
        home: BlocProvider(
          create: (context) => AdhanTimeBloc()
            ..add(GetTimeAdhan(city: city ?? 'baghdad'))
            ..add(GetAzkarnight())
            ..add(GetAzkarsabah())
            ..add(GetAzkarsalah()),
          child: UiTimes(
            asr: asr,
            duhur: duhur,
            fajr: fajr,
            meghreb: megrhib,
            isha: isha,
          ),
        ),
      ),
    );
  }
}
