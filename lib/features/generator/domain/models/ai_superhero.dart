import 'dart:convert';
import 'package:superheroes/features/generator/domain/models/ai_appearance.dart';
import 'package:superheroes/features/generator/domain/models/ai_powerstats.dart';

class AISuperhero {
  String? name;
  AIPowerstats? powerstats;
  AIAppearance? appearance;
  String? biography;
  String? work;

  AISuperhero({
    this.name,
    this.powerstats,
    this.appearance,
    this.biography,
    this.work,
  });

  @override
  String toString() {
    return 'AISuperhero(name: $name, powerstats: $powerstats, appearance: $appearance, biography: $biography, work: $work)';
  }

  factory AISuperhero.fromMap(Map<String, dynamic> data) => AISuperhero(
        name: data['name'] as String?,
        powerstats: data['powerstats'] == null
            ? null
            : AIPowerstats.fromMap(data['powerstats'] as Map<String, dynamic>),
        appearance: data['appearance'] == null
            ? null
            : AIAppearance.fromMap(data['appearance'] as Map<String, dynamic>),
        biography: data['biography'] as String?,
        work: data['work'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'powerstats': powerstats?.toMap(),
        'appearance': appearance?.toMap(),
        'biography': biography,
        'work': work,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AISuperhero].
  factory AISuperhero.fromJson(String data) {
    return AISuperhero.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AISuperhero] to a JSON string.
  String toJson() => json.encode(toMap());

  AISuperhero copyWith({
    String? name,
    AIPowerstats? powerstats,
    AIAppearance? appearance,
    String? biography,
    String? work,
  }) {
    return AISuperhero(
      name: name ?? this.name,
      powerstats: powerstats ?? this.powerstats,
      appearance: appearance ?? this.appearance,
      biography: biography ?? this.biography,
      work: work ?? this.work,
    );
  }
}
