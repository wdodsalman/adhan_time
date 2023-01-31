import 'dart:convert';

class Params {
  final int Fajr;
  final int Isha;
  Params({
    required this.Fajr,
    required this.Isha,
  });

  Params copyWith({
    int? Fajr,
    int? Isha,
  }) {
    return Params(
      Fajr: Fajr ?? this.Fajr,
      Isha: Isha ?? this.Isha,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Fajr': Fajr,
      'Isha': Isha,
    };
  }

  factory Params.fromMap(Map<String, dynamic> map) {
    return Params(
      Fajr: map['Fajr']?.toInt() ?? 0,
      Isha: map['Isha']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Params.fromJson(String source) => Params.fromMap(json.decode(source));

  @override
  String toString() => 'Params(Fajr: $Fajr, Isha: $Isha)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Params &&
      other.Fajr == Fajr &&
      other.Isha == Isha;
  }

  @override
  int get hashCode => Fajr.hashCode ^ Isha.hashCode;
}