import 'dart:convert';

class Work {
  String? occupation;
  String? base;

  Work({this.occupation, this.base});

  @override
  String toString() => 'Work(occupation: $occupation, base: $base)';

  factory Work.fromMap(Map<String, dynamic> data) => Work(
        occupation: data['occupation'] as String?,
        base: data['base'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'occupation': occupation,
        'base': base,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Work].
  factory Work.fromJson(String data) {
    return Work.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Work] to a JSON string.
  String toJson() => json.encode(toMap());

  Work copyWith({
    String? occupation,
    String? base,
  }) {
    return Work(
      occupation: occupation ?? this.occupation,
      base: base ?? this.base,
    );
  }
}
