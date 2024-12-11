import 'dart:convert';

class AIPowerstats {
  int? intelligence;
  int? strength;
  int? speed;
  int? durability;
  int? power;
  int? combat;

  AIPowerstats({
    this.intelligence,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat,
  });

  @override
  String toString() {
    return 'AIPowerstats(intelligence: $intelligence, strength: $strength, speed: $speed, durability: $durability, power: $power, combat: $combat)';
  }

  factory AIPowerstats.fromMap(Map<String, dynamic> data) => AIPowerstats(
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
  /// Parses the string and returns the resulting Json object as [AIPowerstats].
  factory AIPowerstats.fromJson(String data) {
    return AIPowerstats.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AIPowerstats] to a JSON string.
  String toJson() => json.encode(toMap());

  AIPowerstats copyWith({
    int? intelligence,
    int? strength,
    int? speed,
    int? durability,
    int? power,
    int? combat,
  }) {
    return AIPowerstats(
      intelligence: intelligence ?? this.intelligence,
      strength: strength ?? this.strength,
      speed: speed ?? this.speed,
      durability: durability ?? this.durability,
      power: power ?? this.power,
      combat: combat ?? this.combat,
    );
  }
}
