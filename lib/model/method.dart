import 'dart:convert';

import 'location.dart';
import 'params.dart';

class Method {
  final int id;
  final String name;
  final Params params;
  final Location location;
  Method({
    required this.id,
    required this.name,
    required this.params,
    required this.location,
  });

  Method copyWith({
    int? id,
    String? name,
    Params? params,
    Location? location,
  }) {
    return Method(
      id: id ?? this.id,
      name: name ?? this.name,
      params: params ?? this.params,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'params': params.toMap(),
      'location': location.toMap(),
    };
  }

  factory Method.fromMap(Map<String, dynamic> map) {
    return Method(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      params: Params.fromMap(map['params']),
      location: Location.fromMap(map['location']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Method.fromJson(String source) => Method.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Method(id: $id, name: $name, params: $params, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Method &&
      other.id == id &&
      other.name == name &&
      other.params == params &&
      other.location == location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      params.hashCode ^
      location.hashCode;
  }
}