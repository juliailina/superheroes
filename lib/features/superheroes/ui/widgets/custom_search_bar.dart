import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/services/export_services.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: S.of(context).searchLabel,
        suffixIcon: const Icon(Icons.search),
      ),
    );
  }
}
