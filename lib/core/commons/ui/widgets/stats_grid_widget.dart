import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/ui/widgets/export_widgets.dart';

class _Constants {
  static const int gridRowCount = 3;
  static const double gridAspectRatio = 3;
}

class StatsGridWidget extends StatelessWidget {
  const StatsGridWidget({
    super.key,
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });
  final int? intelligence;
  final int? strength;
  final int? speed;
  final int? durability;
  final int? power;
  final int? combat;

  @override
  Widget build(BuildContext context) {
    final stats = {
      '🧠': intelligence,
      '💪': strength,
      '🏃': speed,
      '✊': durability,
      '⚡': power,
      '🥷': combat,
    };

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _Constants.gridRowCount,
        childAspectRatio: _Constants.gridAspectRatio,
      ),
      itemCount: stats.length,
      itemBuilder: (BuildContext context, index) {
        final entry = stats.entries.toList()[index];
        return CustomIconWidget(
          icon: entry.key,
          value: entry.value,
        );
      },
    );
  }
}
