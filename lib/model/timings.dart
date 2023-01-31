import 'dart:convert';

class Timings {
  final String Fajr;
  final String Sunrise;
  final String Dhuhr;
  final String Asr;
  final String Sunset;
  final String Maghrib;
  final String Isha;
  final String Imsak;
  final String Midnight;
  final String Firstthird;
  final String Lastthird;
  Timings({
    required this.Fajr,
    required this.Sunrise,
    required this.Dhuhr,
    required this.Asr,
    required this.Sunset,
    required this.Maghrib,
    required this.Isha,
    required this.Imsak,
    required this.Midnight,
    required this.Firstthird,
    required this.Lastthird,
  });

  Timings copyWith({
    String? Fajr,
    String? Sunrise,
    String? Dhuhr,
    String? Asr,
    String? Sunset,
    String? Maghrib,
    String? Isha,
    String? Imsak,
    String? Midnight,
    String? Firstthird,
    String? Lastthird,
  }) {
    return Timings(
      Fajr: Fajr ?? this.Fajr,
      Sunrise: Sunrise ?? this.Sunrise,
      Dhuhr: Dhuhr ?? this.Dhuhr,
      Asr: Asr ?? this.Asr,
      Sunset: Sunset ?? this.Sunset,
      Maghrib: Maghrib ?? this.Maghrib,
      Isha: Isha ?? this.Isha,
      Imsak: Imsak ?? this.Imsak,
      Midnight: Midnight ?? this.Midnight,
      Firstthird: Firstthird ?? this.Firstthird,
      Lastthird: Lastthird ?? this.Lastthird,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Fajr': Fajr,
      'Sunrise': Sunrise,
      'Dhuhr': Dhuhr,
      'Asr': Asr,
      'Sunset': Sunset,
      'Maghrib': Maghrib,
      'Isha': Isha,
      'Imsak': Imsak,
      'Midnight': Midnight,
      'Firstthird': Firstthird,
      'Lastthird': Lastthird,
    };
  }

  factory Timings.fromMap(Map<String, dynamic> map) {
    return Timings(
      Fajr: map['Fajr'] ?? '',
      Sunrise: map['Sunrise'] ?? '',
      Dhuhr: map['Dhuhr'] ?? '',
      Asr: map['Asr'] ?? '',
      Sunset: map['Sunset'] ?? '',
      Maghrib: map['Maghrib'] ?? '',
      Isha: map['Isha'] ?? '',
      Imsak: map['Imsak'] ?? '',
      Midnight: map['Midnight'] ?? '',
      Firstthird: map['Firstthird'] ?? '',
      Lastthird: map['Lastthird'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Timings.fromJson(String source) => Timings.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Timings(Fajr: $Fajr, Sunrise: $Sunrise, Dhuhr: $Dhuhr, Asr: $Asr, Sunset: $Sunset, Maghrib: $Maghrib, Isha: $Isha, Imsak: $Imsak, Midnight: $Midnight, Firstthird: $Firstthird, Lastthird: $Lastthird)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Timings &&
      other.Fajr == Fajr &&
      other.Sunrise == Sunrise &&
      other.Dhuhr == Dhuhr &&
      other.Asr == Asr &&
      other.Sunset == Sunset &&
      other.Maghrib == Maghrib &&
      other.Isha == Isha &&
      other.Imsak == Imsak &&
      other.Midnight == Midnight &&
      other.Firstthird == Firstthird &&
      other.Lastthird == Lastthird;
  }

  @override
  int get hashCode {
    return Fajr.hashCode ^
      Sunrise.hashCode ^
      Dhuhr.hashCode ^
      Asr.hashCode ^
      Sunset.hashCode ^
      Maghrib.hashCode ^
      Isha.hashCode ^
      Imsak.hashCode ^
      Midnight.hashCode ^
      Firstthird.hashCode ^
      Lastthird.hashCode;
  }
}