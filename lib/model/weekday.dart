import 'dart:convert';

class Weekday {
  final String en;
  final String ar;
  Weekday({
    required this.en,
    required this.ar,
  });

  Weekday copyWith({
    String? en,
    String? ar,
  }) {
    return Weekday(
      en: en ?? this.en,
      ar: ar ?? this.ar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'en': en,
      'ar': ar,
    };
  }

  factory Weekday.fromMap(Map<String, dynamic> map) {
    return Weekday(
      en: map['en'] ?? '',
      ar: map['ar'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Weekday.fromJson(String source) => Weekday.fromMap(json.decode(source));

  @override
  String toString() => 'Weekday(en: $en, ar: $ar)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Weekday &&
      other.en == en &&
      other.ar == ar;
  }

  @override
  int get hashCode => en.hashCode ^ ar.hashCode;
}