import 'dart:convert';

import 'method.dart';
import 'offset.dart';

class Meta {
  final double latitude;
  final double longitude;
  final String timezone;
  final Method method;
  final String latitudeAdjustmentMethod;
  final String midnightMode;
  final String school;
  final Offset offset;
  Meta({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.method,
    required this.latitudeAdjustmentMethod,
    required this.midnightMode,
    required this.school,
    required this.offset,
  });

  Meta copyWith({
    double? latitude,
    double? longitude,
    String? timezone,
    Method? method,
    String? latitudeAdjustmentMethod,
    String? midnightMode,
    String? school,
    Offset? offset,
  }) {
    return Meta(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      timezone: timezone ?? this.timezone,
      method: method ?? this.method,
      latitudeAdjustmentMethod: latitudeAdjustmentMethod ?? this.latitudeAdjustmentMethod,
      midnightMode: midnightMode ?? this.midnightMode,
      school: school ?? this.school,
      offset: offset ?? this.offset,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'timezone': timezone,
      'method': method.toMap(),
      'latitudeAdjustmentMethod': latitudeAdjustmentMethod,
      'midnightMode': midnightMode,
      'school': school,
      'offset': offset.toMap(),
    };
  }

  factory Meta.fromMap(Map<String, dynamic> map) {
    return Meta(
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      timezone: map['timezone'] ?? '',
      method: Method.fromMap(map['method']),
      latitudeAdjustmentMethod: map['latitudeAdjustmentMethod'] ?? '',
      midnightMode: map['midnightMode'] ?? '',
      school: map['school'] ?? '',
      offset: Offset.fromMap(map['offset']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Meta.fromJson(String source) => Meta.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Meta(latitude: $latitude, longitude: $longitude, timezone: $timezone, method: $method, latitudeAdjustmentMethod: $latitudeAdjustmentMethod, midnightMode: $midnightMode, school: $school, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Meta &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.timezone == timezone &&
      other.method == method &&
      other.latitudeAdjustmentMethod == latitudeAdjustmentMethod &&
      other.midnightMode == midnightMode &&
      other.school == school &&
      other.offset == offset;
  }

  @override
  int get hashCode {
    return latitude.hashCode ^
      longitude.hashCode ^
      timezone.hashCode ^
      method.hashCode ^
      latitudeAdjustmentMethod.hashCode ^
      midnightMode.hashCode ^
      school.hashCode ^
      offset.hashCode;
  }
}