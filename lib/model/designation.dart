import 'dart:convert';

class Designation {
  final String abbreviated;
  final String expanded;
  Designation({
    required this.abbreviated,
    required this.expanded,
  });

  Designation copyWith({
    String? abbreviated,
    String? expanded,
  }) {
    return Designation(
      abbreviated: abbreviated ?? this.abbreviated,
      expanded: expanded ?? this.expanded,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'abbreviated': abbreviated,
      'expanded': expanded,
    };
  }

  factory Designation.fromMap(Map<String, dynamic> map) {
    return Designation(
      abbreviated: map['abbreviated'] ?? '',
      expanded: map['expanded'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Designation.fromJson(String source) => Designation.fromMap(json.decode(source));

  @override
  String toString() => 'Designation(abbreviated: $abbreviated, expanded: $expanded)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Designation &&
      other.abbreviated == abbreviated &&
      other.expanded == expanded;
  }

  @override
  int get hashCode => abbreviated.hashCode ^ expanded.hashCode;
}