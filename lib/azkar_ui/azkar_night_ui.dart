import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../bloc/adhan_time_bloc.dart';
import '../model/azkar_model/azkar_night/content.dart';


class AzkarnightUi extends StatelessWidget {
  const AzkarnightUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdhanTimeBloc()..add(GetAzkarnight()),
      child: BlocBuilder<AdhanTimeBloc, AdhanTimeState>(
        builder: (context, state) {
          if (state is AdhanTimeInitial) {
            return Container(
              color: Colors.amber,
            );
          }
          if (state is AdhanTimeLoading) {
            return LoadingAnimationWidget.beat(color: Colors.black, size: 25);
          }
          if (state is AdhanTimeSucces) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 62, 53, 75),
                elevation: 0.0,
              ),
              backgroundColor: const Color.fromARGB(255, 62, 53, 75),
              body: SingleChildScrollView(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    height: 900,
                    child: ListView.separated(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 16,
                          bottom: 12,
                        ),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => Azkarnightcard(
                            contect: state.azkarnight?.content?[index] ??
                                ContentNight(
                                    zekr: 'zekr', repeat: 0, bless: 'bless')),
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: state.azkarnight?.content?.length ?? 10),
                  ),
                ),
              ),
            );
          } else {}
          return Container();
        },
      ),
    );
  }
}

class Azkarnightcard extends StatelessWidget {
  Azkarnightcard({Key? key, this.contect}) : super(key: key);
  ContentNight? contect;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 150,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(contect?.zekr ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 9,
              )),
          const SizedBox(
            height: 15,
          ),
          Text(
            contect?.bless ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 8, color: Colors.red.withAlpha(200)),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            (contect?.repeat ?? 0).toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.purple.withAlpha(200)),
          ),
        ],
      ),
    );
  }
}
