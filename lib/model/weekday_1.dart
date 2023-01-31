import 'dart:convert';

class Weekday {
  final String en;
  Weekday({
    required this.en,
  });

  Weekday copyWith({
    String? en,
  }) {
    return Weekday(
      en: en ?? this.en,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'en': en,
    };
  }

  factory Weekday.fromMap(Map<String, dynamic> map) {
    return Weekday(
      en: map['en'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Weekday.fromJson(String source) => Weekday.fromMap(json.decode(source));

  @override
  String toString() => 'Weekday(en: $en)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Weekday &&
      other.en == en;
  }

  @override
  int get hashCode => en.hashCode;
}