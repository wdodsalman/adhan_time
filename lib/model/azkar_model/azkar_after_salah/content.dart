import 'dart:convert';

class Contentsalah {
  final String zekr;
  final int repeat;
  final String bless;
  Contentsalah({
    required this.zekr,
    required this.repeat,
    required this.bless,
  });

  Contentsalah copyWith({
    String? zekr,
    int? repeat,
    String? bless,
  }) {
    return Contentsalah(
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

  factory Contentsalah.fromMap(Map<String, dynamic> map) {
    return Contentsalah(
      zekr: map['zekr'] ?? '',
      repeat: map['repeat']?.toInt() ?? 0,
      bless: map['bless'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Contentsalah.fromJson(String source) => Contentsalah.fromMap(json.decode(source));

  @override
  String toString() => 'Content(zekr: $zekr, repeat: $repeat, bless: $bless)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Contentsalah &&
      other.zekr == zekr &&
      other.repeat == repeat &&
      other.bless == bless;
  }

  @override
  int get hashCode => zekr.hashCode ^ repeat.hashCode ^ bless.hashCode;
}