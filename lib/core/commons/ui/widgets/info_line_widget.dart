import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/ui/styles/export_styles.dart';

class InfoLineWidget extends StatelessWidget {
  const InfoLineWidget({
    super.key,
    required this.param,
    required this.label,
  });

  final String param;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spaces.spaceXXS),
      child: Text(
        label + param,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
