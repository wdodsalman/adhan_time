import 'dart:convert';

class Month {
  final int number;
  final String en;
  Month({
    required this.number,
    required this.en,
  });

  Month copyWith({
    int? number,
    String? en,
  }) {
    return Month(
      number: number ?? this.number,
      en: en ?? this.en,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'en': en,
    };
  }

  factory Month.fromMap(Map<String, dynamic> map) {
    return Month(
      number: map['number']?.toInt() ?? 0,
      en: map['en'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Month.fromJson(String source) => Month.fromMap(json.decode(source));

  @override
  String toString() => 'Month(number: $number, en: $en)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Month &&
      other.number == number &&
      other.en == en;
  }

  @override
  int get hashCode => number.hashCode ^ en.hashCode;
}