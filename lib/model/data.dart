import 'dart:convert';

import 'date.dart';
import 'meta.dart';
import 'timings.dart';

class Data {
  final Timings timings;
  final Date date;
  final Meta meta;
  Data({
    required this.timings,
    required this.date,
    required this.meta,
  });

  Data copyWith({
    Timings? timings,
    Date? date,
    Meta? meta,
  }) {
    return Data(
      timings: timings ?? this.timings,
      date: date ?? this.date,
      meta: meta ?? this.meta,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'timings': timings.toMap(),
      'date': date.toMap(),
      'meta': meta.toMap(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      timings: Timings.fromMap(map['timings']),
      date: Date.fromMap(map['date']),
      meta: Meta.fromMap(map['meta']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() => 'Data(timings: $timings, date: $date, meta: $meta)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Data &&
      other.timings == timings &&
      other.date == date &&
      other.meta == meta;
  }

  @override
  int get hashCode => timings.hashCode ^ date.hashCode ^ meta.hashCode;
}