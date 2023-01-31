import 'package:shared_preferences/shared_preferences.dart';

class Timeshared {
  static Future<Future<bool>> setfajrtime(time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('fajr', time);
  }

  static Future getfajrtime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getString('fajr');
  }

  static Future<Future<bool>> setduhrtime(String time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('duhur', time);
  }

  static Future getduhurtime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('duhur');
  }

  static Future<Future<bool>> setasrtime(String time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('asr', time);
  }

  static Future getasrtime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('asr');
  }

  static Future<Future<bool>> setmegraibtime(String time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('mgriab', time);
  }

  static Future getmegraibtime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('mgriab');
  }

  static Future<Future<bool>> setishatime(String time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('isha', time);
  }

  static Future getishatime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('isha');
  }
}
