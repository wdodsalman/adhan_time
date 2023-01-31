import 'dart:convert';

class Offset {
  final int Imsak;
  final int Fajr;
  final int Sunrise;
  final int Dhuhr;
  final int Asr;
  final int Maghrib;
  final int Sunset;
  final int Isha;
  final int Midnight;
  Offset({
    required this.Imsak,
    required this.Fajr,
    required this.Sunrise,
    required this.Dhuhr,
    required this.Asr,
    required this.Maghrib,
    required this.Sunset,
    required this.Isha,
    required this.Midnight,
  });

  Offset copyWith({
    int? Imsak,
    int? Fajr,
    int? Sunrise,
    int? Dhuhr,
    int? Asr,
    int? Maghrib,
    int? Sunset,
    int? Isha,
    int? Midnight,
  }) {
    return Offset(
      Imsak: Imsak ?? this.Imsak,
      Fajr: Fajr ?? this.Fajr,
      Sunrise: Sunrise ?? this.Sunrise,
      Dhuhr: Dhuhr ?? this.Dhuhr,
      Asr: Asr ?? this.Asr,
      Maghrib: Maghrib ?? this.Maghrib,
      Sunset: Sunset ?? this.Sunset,
      Isha: Isha ?? this.Isha,
      Midnight: Midnight ?? this.Midnight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Imsak': Imsak,
      'Fajr': Fajr,
      'Sunrise': Sunrise,
      'Dhuhr': Dhuhr,
      'Asr': Asr,
      'Maghrib': Maghrib,
      'Sunset': Sunset,
      'Isha': Isha,
      'Midnight': Midnight,
    };
  }

  factory Offset.fromMap(Map<String, dynamic> map) {
    return Offset(
      Imsak: map['Imsak']?.toInt() ?? 0,
      Fajr: map['Fajr']?.toInt() ?? 0,
      Sunrise: map['Sunrise']?.toInt() ?? 0,
      Dhuhr: map['Dhuhr']?.toInt() ?? 0,
      Asr: map['Asr']?.toInt() ?? 0,
      Maghrib: map['Maghrib']?.toInt() ?? 0,
      Sunset: map['Sunset']?.toInt() ?? 0,
      Isha: map['Isha']?.toInt() ?? 0,
      Midnight: map['Midnight']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Offset.fromJson(String source) => Offset.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Offset(Imsak: $Imsak, Fajr: $Fajr, Sunrise: $Sunrise, Dhuhr: $Dhuhr, Asr: $Asr, Maghrib: $Maghrib, Sunset: $Sunset, Isha: $Isha, Midnight: $Midnight)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Offset &&
      other.Imsak == Imsak &&
      other.Fajr == Fajr &&
      other.Sunrise == Sunrise &&
      other.Dhuhr == Dhuhr &&
      other.Asr == Asr &&
      other.Maghrib == Maghrib &&
      other.Sunset == Sunset &&
      other.Isha == Isha &&
      other.Midnight == Midnight;
  }

  @override
  int get hashCode {
    return Imsak.hashCode ^
      Fajr.hashCode ^
      Sunrise.hashCode ^
      Dhuhr.hashCode ^
      Asr.hashCode ^
      Maghrib.hashCode ^
      Sunset.hashCode ^
      Isha.hashCode ^
      Midnight.hashCode;
  }
}