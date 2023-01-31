import 'dart:convert';

import 'gregorian.dart';
import 'hijri.dart';

class Date {
  final String readable;
  final String timestamp;
  final Hijri hijri;
  final Gregorian gregorian;
  Date({
    required this.readable,
    required this.timestamp,
    required this.hijri,
    required this.gregorian,
  });

  Date copyWith({
    String? readable,
    String? timestamp,
    Hijri? hijri,
    Gregorian? gregorian,
  }) {
    return Date(
      readable: readable ?? this.readable,
      timestamp: timestamp ?? this.timestamp,
      hijri: hijri ?? this.hijri,
      gregorian: gregorian ?? this.gregorian,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'readable': readable,
      'timestamp': timestamp,
      'hijri': hijri.toMap(),
      'gregorian': gregorian.toMap(),
    };
  }

  factory Date.fromMap(Map<String, dynamic> map) {
    return Date(
      readable: map['readable'] ?? '',
      timestamp: map['timestamp'] ?? '',
      hijri: Hijri.fromMap(map['hijri']),
      gregorian: Gregorian.fromMap(map['gregorian']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Date.fromJson(String source) => Date.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Date(readable: $readable, timestamp: $timestamp, hijri: $hijri, gregorian: $gregorian)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Date &&
      other.readable == readable &&
      other.timestamp == timestamp &&
      other.hijri == hijri &&
      other.gregorian == gregorian;
  }

  @override
  int get hashCode {
    return readable.hashCode ^
      timestamp.hashCode ^
      hijri.hashCode ^
      gregorian.hashCode;
  }
}