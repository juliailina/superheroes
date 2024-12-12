import 'dart:convert';

class Appearance {
  String? gender;
  String? race;
  List<String>? height;
  List<String>? weight;
  String? eyeColor;
  String? hairColor;

  Appearance({
    this.gender,
    this.race,
    this.height,
    this.weight,
    this.eyeColor,
    this.hairColor,
  });

  @override
  String toString() {
    return 'Appearance(gender: $gender, race: $race, height: $height, weight: $weight, eyeColor: $eyeColor, hairColor: $hairColor)';
  }

  factory Appearance.fromMap(Map<String, dynamic> data) => Appearance(
        gender: data['gender'] as String?,
        race: data['race'] as String?,
        height: (data['height'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        weight: (data['weight'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        eyeColor: data['eyeColor'] as String?,
        hairColor: data['hairColor'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'gender': gender,
        'race': race,
        'height': height,
        'weight': weight,
        'eyeColor': eyeColor,
        'hairColor': hairColor,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Appearance].
  factory Appearance.fromJson(String data) {
    return Appearance.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Appearance] to a JSON string.
  String toJson() => json.encode(toMap());

  Appearance copyWith({
    String? gender,
    String? race,
    List<String>? height,
    List<String>? weight,
    String? eyeColor,
    String? hairColor,
  }) {
    return Appearance(
      gender: gender ?? this.gender,
      race: race ?? this.race,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      eyeColor: eyeColor ?? this.eyeColor,
      hairColor: hairColor ?? this.hairColor,
    );
  }
}
