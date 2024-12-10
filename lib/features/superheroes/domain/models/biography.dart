import 'dart:convert';

class Biography {
  String? fullName;
  String? alterEgos;
  List<String>? aliases;
  String? placeOfBirth;
  String? firstAppearance;
  String? publisher;
  String? alignment;

  Biography({
    this.fullName,
    this.alterEgos,
    this.aliases,
    this.placeOfBirth,
    this.firstAppearance,
    this.publisher,
    this.alignment,
  });

  @override
  String toString() {
    return 'Biography(fullName: $fullName, alterEgos: $alterEgos, aliases: $aliases, placeOfBirth: $placeOfBirth, firstAppearance: $firstAppearance, publisher: $publisher, alignment: $alignment)';
  }

  factory Biography.fromMap(Map<String, dynamic> data) => Biography(
        fullName: data['fullName'] as String?,
        alterEgos: data['alterEgos'] as String?,
        aliases: (data['aliases'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        placeOfBirth: data['placeOfBirth'] as String?,
        firstAppearance: data['firstAppearance'] as String?,
        publisher: data['publisher'] as String?,
        alignment: data['alignment'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'fullName': fullName,
        'alterEgos': alterEgos,
        'aliases': aliases,
        'placeOfBirth': placeOfBirth,
        'firstAppearance': firstAppearance,
        'publisher': publisher,
        'alignment': alignment,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Biography].
  factory Biography.fromJson(String data) {
    return Biography.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Biography] to a JSON string.
  String toJson() => json.encode(toMap());

  Biography copyWith({
    String? fullName,
    String? alterEgos,
    List<String>? aliases,
    String? placeOfBirth,
    String? firstAppearance,
    String? publisher,
    String? alignment,
  }) {
    return Biography(
      fullName: fullName ?? this.fullName,
      alterEgos: alterEgos ?? this.alterEgos,
      aliases: aliases ?? this.aliases,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      firstAppearance: firstAppearance ?? this.firstAppearance,
      publisher: publisher ?? this.publisher,
      alignment: alignment ?? this.alignment,
    );
  }
}
