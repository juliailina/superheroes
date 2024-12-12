import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/ui/styles/export_styles.dart';

class CustomIconWidget extends StatelessWidget {
  final String icon;
  final int? value;

  const CustomIconWidget({
    super.key,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return value != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                icon,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Spaces.horizontalS(),
              Text(
                '$value',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
