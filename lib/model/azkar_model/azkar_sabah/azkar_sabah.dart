import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'content.dart';

class Azkar_model_sabah {
  final String? title;
  final List<Content>? content;
  Azkar_model_sabah({
     this.title,
     this.content,
  });

  Azkar_model_sabah copyWith({
    String? title,
    List<Content>? content,
  }) {
    return Azkar_model_sabah(
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

  factory Azkar_model_sabah.fromMap(Map<String, dynamic> map) {
    return Azkar_model_sabah(
      title: map['title'] ?? '',
      content: List<Content>.from(map['content']?.map((x) => Content.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Azkar_model_sabah.fromJson(String source) => Azkar_model_sabah.fromMap(json.decode(source));

  @override
  String toString() => 'Azkar_model_sabah(title: $title, content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Azkar_model_sabah &&
      other.title == title &&
      listEquals(other.content, content);
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode;
}