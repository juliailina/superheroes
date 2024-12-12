import 'dart:convert';

class AIAppearance {
  String? race;
  String? height;
  String? weight;

  AIAppearance({
    this.race,
    this.height,
    this.weight,
  });

  @override
  String toString() {
    return 'AIAppearance(race: $race, height: $height, weight: $weight)';
  }

  factory AIAppearance.fromMap(Map<String, dynamic> data) => AIAppearance(
        race: data['race'] as String?,
        height: data['height'] as String?,
        weight: data['weight'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'race': race,
        'height': height,
        'weight': weight,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AIAppearance].
  factory AIAppearance.fromJson(String data) {
    return AIAppearance.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AIAppearance] to a JSON string.
  String toJson() => json.encode(toMap());

  AIAppearance copyWith({
    String? race,
    String? height,
    String? weight,
  }) {
    return AIAppearance(
      race: race ?? this.race,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }
}
