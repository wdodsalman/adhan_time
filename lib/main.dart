import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cash/cash_shared.dart';
import 'time_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  var fajr = await Timeshared.getfajrtime() ?? '2024-01-12T05:39:00+03:00';
  var duhur = await Timeshared.getduhurtime() ?? '2024-01-12T05:39:00+03:00';
  var asr = await Timeshared.getasrtime() ?? '2024-01-12T05:39:00+03:00';
  var megraib =
      await Timeshared.getmegraibtime() ?? '2024-01-12T05:39:00+03:00';
  var isha = await Timeshared.getishatime() ?? '2024-01-12T05:39:00+03:00';
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          Exception('Location permissions are permanently denied.'));
    }

    if (permission == LocationPermission.denied) {
      return Future.error(Exception('Location permissions are denied.'));
    }
  }
  await Geolocator.isLocationServiceEnabled();
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  await Geolocator.getLocationAccuracy();
  if (kDebugMode) {
    print(position);
  }

  List<Placemark> address =
      await placemarkFromCoordinates(position.latitude, position.longitude);
  if (kDebugMode) {
    print(address[0].locality);
  }
  runApp( MyApp(
      asr: asr,
      fajr: fajr,
      duhur: duhur,
      isha: isha,
      megrhib: megraib,
      city: address[0].locality,
    ),
  );
}
