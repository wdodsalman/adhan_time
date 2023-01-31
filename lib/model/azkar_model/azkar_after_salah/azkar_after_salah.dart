// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'content.dart';

class Azkar_model_salah {
  final String? title;
  final List<Contentsalah>? content;
  Azkar_model_salah({
     this.title,
     this.content,
  });

  Azkar_model_salah copyWith({
    String? title,
    List<Contentsalah>? content,
  }) {
    return Azkar_model_salah(
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content?.map((x) => x.toMap()).toList(),
    };
  }

  factory Azkar_model_salah.fromMap(Map<String, dynamic> map) {
    return Azkar_model_salah(
      title: map['title'] ?? '',
      content: List<Contentsalah>.from(map['content']?.map((x) => Contentsalah.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Azkar_model_salah.fromJson(String source) => Azkar_model_salah.fromMap(json.decode(source));

  @override
  String toString() => 'Azkar_model_salah(title: $title, content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Azkar_model_salah &&
      other.title == title &&
      listEquals(other.content, content);
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode;
}