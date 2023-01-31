import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'content.dart';

class Azkar_model_night {
  final String? title;
  final List<ContentNight>? content;
  Azkar_model_night({
     this.title,
     this.content,
  });

  Azkar_model_night copyWith({
    String? title,
    List<ContentNight>? content,
  }) {
    return Azkar_model_night(
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

  factory Azkar_model_night.fromMap(Map<String, dynamic> map) {
    return Azkar_model_night(
      title: map['title'] ?? '',
      content: List<ContentNight>.from(map['content']?.map((x) => ContentNight.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Azkar_model_night.fromJson(String source) => Azkar_model_night.fromMap(json.decode(source));

  @override
  String toString() => 'Azkar_model_night(title: $title, content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Azkar_model_night &&
      other.title == title &&
      listEquals(other.content, content);
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode;
}