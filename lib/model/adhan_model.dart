import 'dart:convert';

import 'data.dart';

class Adhan_model {
  final int code;
  final String status;
  final Data data;
  Adhan_model({
    required this.code,
    required this.status,
    required this.data,
  });

  Adhan_model copyWith({
    int? code,
    String? status,
    Data? data,
  }) {
    return Adhan_model(
      code: code ?? this.code,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'status': status,
      'data': data.toMap(),
    };
  }

  factory Adhan_model.fromMap(Map<String, dynamic> map) {
    return Adhan_model(
      code: map['code']?.toInt() ?? 0,
      status: map['status'] ?? '',
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Adhan_model.fromJson(String source) => Adhan_model.fromMap(json.decode(source));

  @override
  String toString() => 'Adhan_model(code: $code, status: $status, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Adhan_model &&
      other.code == code &&
      other.status == status &&
      other.data == data;
  }

  @override
  int get hashCode => code.hashCode ^ status.hashCode ^ data.hashCode;
}