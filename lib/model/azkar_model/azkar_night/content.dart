import 'dart:convert';

class ContentNight {
  final String zekr;
  final int repeat;
  final String bless;
  ContentNight({
    required this.zekr,
    required this.repeat,
    required this.bless,
  });

  ContentNight copyWith({
    String? zekr,
    int? repeat,
    String? bless,
  }) {
    return ContentNight(
      zekr: zekr ?? this.zekr,
      repeat: repeat ?? this.repeat,
      bless: bless ?? this.bless,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'zekr': zekr,
      'repeat': repeat,
      'bless': bless,
    };
  }

  factory ContentNight.fromMap(Map<String, dynamic> map) {
    return ContentNight(
      zekr: map['zekr'] ?? '',
      repeat: map['repeat']?.toInt() ?? 0,
      bless: map['bless'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentNight.fromJson(String source) => ContentNight.fromMap(json.decode(source));

  @override
  String toString() => 'Content(zekr: $zekr, repeat: $repeat, bless: $bless)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ContentNight &&
      other.zekr == zekr &&
      other.repeat == repeat &&
      other.bless == bless;
  }

  @override
  int get hashCode => zekr.hashCode ^ repeat.hashCode ^ bless.hashCode;
}