import 'dart:convert';

import 'designation.dart';
import 'month.dart';
import 'weekday_1.dart';

class Gregorian {
  final String date;
  final String format;
  final String day;
  final Weekday weekday;
  final Month month;
  final String year;
  final Designation designation;
  Gregorian({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
  });

  Gregorian copyWith({
    String? date,
    String? format,
    String? day,
    Weekday? weekday,
    Month? month,
    String? year,
    Designation? designation,
  }) {
    return Gregorian(
      date: date ?? this.date,
      format: format ?? this.format,
      day: day ?? this.day,
      weekday: weekday ?? this.weekday,
      month: month ?? this.month,
      year: year ?? this.year,
      designation: designation ?? this.designation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'format': format,
      'day': day,
      'weekday': weekday.toMap(),
      'month': month.toMap(),
      'year': year,
      'designation': designation.toMap(),
    };
  }

  factory Gregorian.fromMap(Map<String, dynamic> map) {
    return Gregorian(
      date: map['date'] ?? '',
      format: map['format'] ?? '',
      day: map['day'] ?? '',
      weekday: Weekday.fromMap(map['weekday']),
      month: Month.fromMap(map['month']),
      year: map['year'] ?? '',
      designation: Designation.fromMap(map['designation']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Gregorian.fromJson(String source) => Gregorian.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Gregorian(date: $date, format: $format, day: $day, weekday: $weekday, month: $month, year: $year, designation: $designation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Gregorian &&
      other.date == date &&
      other.format == format &&
      other.day == day &&
      other.weekday == weekday &&
      other.month == month &&
      other.year == year &&
      other.designation == designation;
  }

  @override
  int get hashCode {
    return date.hashCode ^
      format.hashCode ^
      day.hashCode ^
      weekday.hashCode ^
      month.hashCode ^
      year.hashCode ^
      designation.hashCode;
  }
}