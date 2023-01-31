import 'dart:convert';

class Content {
  final String zekr;
  final int repeat;
  final String bless;
  Content({
    required this.zekr,
    required this.repeat,
    required this.bless,
  });

  Content copyWith({
    String? zekr,
    int? repeat,
    String? bless,
  }) {
    return Content(
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

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      zekr: map['zekr'] ?? '',
      repeat: map['repeat']?.toInt() ?? 0,
      bless: map['bless'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Content.fromJson(String source) => Content.fromMap(json.decode(source));

  @override
  String toString() => 'Content(zekr: $zekr, repeat: $repeat, bless: $bless)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Content &&
      other.zekr == zekr &&
      other.repeat == repeat &&
      other.bless == bless;
  }

  @override
  int get hashCode => zekr.hashCode ^ repeat.hashCode ^ bless.hashCode;
}