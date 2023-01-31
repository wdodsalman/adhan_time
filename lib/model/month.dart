import 'dart:convert';

class Month {
  final int number;
  final String en;
  final String ar;
  Month({
    required this.number,
    required this.en,
    required this.ar,
  });

  Month copyWith({
    int? number,
    String? en,
    String? ar,
  }) {
    return Month(
      number: number ?? this.number,
      en: en ?? this.en,
      ar: ar ?? this.ar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'en': en,
      'ar': ar,
    };
  }

  factory Month.fromMap(Map<String, dynamic> map) {
    return Month(
      number: map['number']?.toInt() ?? 0,
      en: map['en'] ?? '',
      ar: map['ar'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Month.fromJson(String source) => Month.fromMap(json.decode(source));

  @override
  String toString() => 'Month(number: $number, en: $en, ar: $ar)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Month &&
      other.number == number &&
      other.en == en &&
      other.ar == ar;
  }

  @override
  int get hashCode => number.hashCode ^ en.hashCode ^ ar.hashCode;
}