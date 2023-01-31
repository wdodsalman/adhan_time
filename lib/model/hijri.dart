import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'designation.dart';
import 'month.dart';
import 'weekday.dart';

class Hijri {
  final String date;
  final String format;
  final String day;
  final Weekday weekday;
  final Month ?month;
  final String year;
  final Designation designation;
  final List<dynamic> holidays;
  Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
     this.month,
    required this.year,
    required this.designation,
    required this.holidays,
  });

  Hijri copyWith({
    String? date,
    String? format,
    String? day,
    Weekday? weekday,
    Month? month,
    String? year,
    Designation? designation,
    List<dynamic>? holidays,
  }) {
    return Hijri(
      date: date ?? this.date,
      format: format ?? this.format,
      day: day ?? this.day,
      weekday: weekday ?? this.weekday,
      month: month ?? this.month,
      year: year ?? this.year,
      designation: designation ?? this.designation,
      holidays: holidays ?? this.holidays,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'format': format,
      'day': day,
      'weekday': weekday.toMap(),
      'month': month?.toMap(),
      'year': year,
      'designation': designation.toMap(),
      'holidays': holidays,
    };
  }

  factory Hijri.fromMap(Map<String, dynamic> map) {
    return Hijri(
      date: map['date'] ?? '',
      format: map['format'] ?? '',
      day: map['day'] ?? '',
      weekday: Weekday.fromMap(map['weekday']),
      month: Month.fromMap(map['month']),
      year: map['year'] ?? '',
      designation: Designation.fromMap(map['designation']),
      holidays: List<dynamic>.from(map['holidays']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Hijri.fromJson(String source) => Hijri.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Hijri(date: $date, format: $format, day: $day, weekday: $weekday, month: $month, year: $year, designation: $designation, holidays: $holidays)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Hijri &&
      other.date == date &&
      other.format == format &&
      other.day == day &&
      other.weekday == weekday &&
      other.month == month &&
      other.year == year &&
      other.designation == designation &&
      listEquals(other.holidays, holidays);
  }

  @override
  int get hashCode {
    return date.hashCode ^
      format.hashCode ^
      day.hashCode ^
      weekday.hashCode ^
      month.hashCode ^
      year.hashCode ^
      designation.hashCode ^
      holidays.hashCode;
  }
}