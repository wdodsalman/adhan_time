import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'azkar_ui/azkar_night_ui.dart';
import 'azkar_ui/azkar_salah.dart';
import 'azkar_ui/azkar_ui_sabah.dart';
import 'bloc/adhan_time_bloc.dart';
import 'count_dwon.dart';

class UiTimes extends StatelessWidget {
  UiTimes(
      {super.key, this.fajr, this.duhur, this.asr, this.meghreb, this.isha});

  final String? asr;
  final String? duhur;
  final String? fajr;
  final String? isha;
  final String? meghreb;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 62, 53, 75),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45)),
                  image: DecorationImage(
                      image: AssetImage('lib/assets/mousqe.jpg'),
                      fit: BoxFit.cover)),
              height: 300,
              width: 500,
              child: BlocBuilder<AdhanTimeBloc, AdhanTimeState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      timingsUi(state, context, _formKey),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 235,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 18.0,
                right: 18.0,
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              height: 120,
              width: 250,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '   الوقت المتبقي   ',
                          style: TextStyle(color: Colors.black),
                        ),
                        CountDwon(
                          fajr: fajr,
                          duhur: duhur,
                          asr: asr,
                          meghrib: meghreb,
                          isha: isha,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 34.0),
                      child: Column(
                        children: [
                          Text(DateTime.now()
                                  .isBefore(DateTime.parse(fajr ?? ''))
                              ? 'الفجر'
                              : DateTime.now()
                                      .isBefore(DateTime.parse(duhur ?? ''))
                                  ? 'الظهر'
                                  : DateTime.now()
                                          .isBefore(DateTime.parse(asr ?? ''))
                                      ? 'العصر'
                                      : DateTime.now().isBefore(
                                              DateTime.parse(meghreb ?? ''))
                                          ? "المغرب "
                                          : DateTime.now().isBefore(
                                                  DateTime.parse(isha ?? ''))
                                              ? "العشاء "
                                              : "الفجر "),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(DateTime.now()
                                  .isBefore(DateTime.parse(fajr ?? ''))
                              ? intl.DateFormat.jm()
                                  .format(DateTime.parse(fajr ?? '').toLocal())
                                  .toString()
                              : DateTime.now()
                                      .isBefore(DateTime.parse(duhur ?? ''))
                                  ? intl.DateFormat.jm()
                                      .format(
                                          DateTime.parse(duhur ?? '').toLocal())
                                      .toString()
                                  : DateTime.now()
                                          .isBefore(DateTime.parse(asr ?? ''))
                                      ? intl.DateFormat.jm()
                                          .format(DateTime.parse(asr ?? '')
                                              .toLocal())
                                          .toString()
                                      : DateTime.now().isBefore(
                                              DateTime.parse(meghreb ?? ''))
                                          ? intl.DateFormat.jm()
                                              .format(
                                                  DateTime.parse(meghreb ?? '')
                                                      .toLocal())
                                              .toString()
                                          : DateTime.now().isBefore(
                                                  DateTime.parse(isha ?? ''))
                                              ? intl.DateFormat.jm()
                                                  .format(
                                                      DateTime.parse(isha ?? '')
                                                          .toLocal())
                                                  .toString()
                                              : intl.DateFormat.jm()
                                                  .format(
                                                      DateTime.parse(fajr ?? '')
                                                          .toLocal())
                                                  .toString()),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  height: 85,
                  width: 75,
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AzkarsabahUi(),
                                ));
                          },
                          icon: Image.asset('lib/assets/praying.png'),
                          iconSize: 20),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('اذكار الصباح '),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  height: 85,
                  width: 75,
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AzkarnightUi(),
                                ));
                          },
                          icon: Image.asset('lib/assets/pray.png'),
                          iconSize: 35),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('اذكار المساء '),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  height: 85,
                  width: 75,
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AzkarsalahUi(),
                                ));
                          },
                          icon: Image.asset('lib/assets/prayer.png'),
                          iconSize: 35),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('اذكارالصلاة'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

timingsUi(AdhanTimeState state, BuildContext context,
        GlobalKey<FormState> controll) =>
    Form(
        key: controll,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 10,
                right: 10,
              ),
              child: Container(
                height: Adaptive.h(6.0),
                width: Adaptive.w(350),
                
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                ),
                child: TextFormField(
                  
                  style: const TextStyle(color: Colors.white),
                  decoration:const  InputDecoration(
                   contentPadding: EdgeInsets.all(5),
                    suffixIcon:  Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintStyle:  TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                  onFieldSubmitted: (value) async {
                    BlocProvider.of<AdhanTimeBloc>(context)
                        .add(GetTimeAdhan(city: value));
                    controll.currentState!.reset();
                  },
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 110),
                child: state is AdhanTimeLoading
                    ? Center(
                        child: LoadingAnimationWidget.discreteCircle(
                            color: Colors.black, size: 50.0),
                      )
                    : state is AdhanTimeSucces
                        ? Column(
                            children: [
                              Text(
                                state.adhantime?.data.date.hijri.date ?? '',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                state.adhantime?.data.date.hijri.month?.ar ??
                                    '',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                state.adhantime?.data.date.readable ?? '',
                                style: const TextStyle(color: Colors.white),
                              ),
                              Text(
                                state.adhantime?.data.meta.timezone ?? '',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          )
                        : Container(
                            color: Colors.transparent,
                          )),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Align(
                alignment: const Alignment(0.0, 450.0),
                child: Container(
                    height: 299,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: state is AdhanTimeSucces
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('الفجر :'),
                                    Text(
                                      intl.DateFormat.jm()
                                          .format(DateTime.parse(
                                        state.adhantime?.data.timings.Fajr ??
                                            '2023-01-08T18:34:00+03:00',
                                      ).toLocal()),
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            'lib/assets/sun.png'))
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('الظهر :'),
                                    Text(
                                      intl.DateFormat.jm()
                                          .format(DateTime.parse(
                                        state.adhantime?.data.timings.Dhuhr ??
                                            '2023-01-08T18:34:00+03:00',
                                      ).toLocal()),
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            'lib/assets/sunset.png'))
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('العصر :'),
                                    Text(
                                      intl.DateFormat.jm()
                                          .format(DateTime.parse(
                                        state.adhantime?.data.timings.Asr ??
                                            '2023-01-08T18:34:00+03:00',
                                      ).toLocal()),
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            'lib/assets/sunset.png'))
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('المغرب :'),
                                    Text(
                                      intl.DateFormat.jm()
                                          .format(DateTime.parse(
                                        state.adhantime?.data.timings.Maghrib ??
                                            '2023-01-08T18:34:00+03:00',
                                      ).toLocal()),
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            'lib/assets/moonlight.png'))
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('العشاء :'),
                                    Text(
                                      intl.DateFormat.jm()
                                          .format(DateTime.parse(
                                        state.adhantime?.data.timings.Isha ??
                                            '2023-01-08T18:34:00+03:00',
                                      ).toLocal()),
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            'lib/assets/sunsrise.png'))
                                  ],
                                ),
                              ],
                            )
                          : LoadingAnimationWidget.beat(
                              color: Colors.black, size: 55.0),
                    )),
              ),
            ),
          ],
        ));
