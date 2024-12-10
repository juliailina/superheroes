import 'package:flutter/foundation.dart';
import 'package:superheroes/features/superheroes/domain/models/export_models.dart';

class SuperheroesResponse {
  final List<Superhero> superheroes;

  SuperheroesResponse({
    required this.superheroes,
  });

  factory SuperheroesResponse.fromList(List<dynamic> list) {
    return SuperheroesResponse(
      superheroes: list
          .map(
            (superhero) {
              try {
                return Superhero.fromMap(superhero as Map<String, dynamic>);
              } catch (e) {
                debugPrint('Error parsing superheroes: $e');
                return null;
              }
            },
          )
          .whereType<Superhero>()
          .toList(),
    );
  }
}
