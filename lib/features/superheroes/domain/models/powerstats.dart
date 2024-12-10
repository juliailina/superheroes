import 'dart:convert';

class Powerstats {
  int? intelligence;
  int? strength;
  int? speed;
  int? durability;
  int? power;
  int? combat;

  Powerstats({
    this.intelligence,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat,
  });

  @override
  String toString() {
    return 'Powerstats(intelligence: $intelligence, strength: $strength, speed: $speed, durability: $durability, power: $power, combat: $combat)';
  }

  factory Powerstats.fromMap(Map<String, dynamic> data) => Powerstats(
        intelligence: data['intelligence'] as int?,
        strength: data['strength'] as int?,
        speed: data['speed'] as int?,
        durability: data['durability'] as int?,
        power: data['power'] as int?,
        combat: data['combat'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'intelligence': intelligence,
        'strength': strength,
        'speed': speed,
        'durability': durability,
        'power': power,
        'combat': combat,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Powerstats].
  factory Powerstats.fromJson(String data) {
    return Powerstats.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Powerstats] to a JSON string.
  String toJson() => json.encode(toMap());

  Powerstats copyWith({
    int? intelligence,
    int? strength,
    int? speed,
    int? durability,
    int? power,
    int? combat,
  }) {
    return Powerstats(
      intelligence: intelligence ?? this.intelligence,
      strength: strength ?? this.strength,
      speed: speed ?? this.speed,
      durability: durability ?? this.durability,
      power: power ?? this.power,
      combat: combat ?? this.combat,
    );
  }
}
