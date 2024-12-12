import 'dart:convert';

import 'package:superheroes/features/superheroes/domain/models/appearance.dart';
import 'package:superheroes/features/superheroes/domain/models/biography.dart';
import 'package:superheroes/features/superheroes/domain/models/connections.dart';
import 'package:superheroes/features/superheroes/domain/models/images.dart';
import 'package:superheroes/features/superheroes/domain/models/powerstats.dart';
import 'package:superheroes/features/superheroes/domain/models/work.dart';

class Superhero {
  int? id;
  String? name;
  String? slug;
  Powerstats? powerstats;
  Appearance? appearance;
  Biography? biography;
  Work? work;
  Connections? connections;
  Images? images;

  Superhero({
    this.id,
    this.name,
    this.slug,
    this.powerstats,
    this.appearance,
    this.biography,
    this.work,
    this.connections,
    this.images,
  });

  @override
  String toString() {
    return 'Superheroes(id: $id, name: $name, slug: $slug, powerstats: $powerstats, appearance: $appearance, biography: $biography, work: $work, connections: $connections, images: $images)';
  }

  factory Superhero.fromMap(Map<String, dynamic> data) => Superhero(
        id: data['id'] as int?,
        name: data['name'] as String?,
        slug: data['slug'] as String?,
        powerstats: data['powerstats'] == null
            ? null
            : Powerstats.fromMap(data['powerstats'] as Map<String, dynamic>),
        appearance: data['appearance'] == null
            ? null
            : Appearance.fromMap(data['appearance'] as Map<String, dynamic>),
        biography: data['biography'] == null
            ? null
            : Biography.fromMap(data['biography'] as Map<String, dynamic>),
        work: data['work'] == null
            ? null
            : Work.fromMap(data['work'] as Map<String, dynamic>),
        connections: data['connections'] == null
            ? null
            : Connections.fromMap(data['connections'] as Map<String, dynamic>),
        images: data['images'] == null
            ? null
            : Images.fromMap(data['images'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'slug': slug,
        'powerstats': powerstats?.toMap(),
        'appearance': appearance?.toMap(),
        'biography': biography?.toMap(),
        'work': work?.toMap(),
        'connections': connections?.toMap(),
        'images': images?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Superhero].
  factory Superhero.fromJson(String data) {
    return Superhero.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Superhero] to a JSON string.
  String toJson() => json.encode(toMap());

  Superhero copyWith({
    int? id,
    String? name,
    String? slug,
    Powerstats? powerstats,
    Appearance? appearance,
    Biography? biography,
    Work? work,
    Connections? connections,
    Images? images,
  }) {
    return Superhero(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      powerstats: powerstats ?? this.powerstats,
      appearance: appearance ?? this.appearance,
      biography: biography ?? this.biography,
      work: work ?? this.work,
      connections: connections ?? this.connections,
      images: images ?? this.images,
    );
  }
}
