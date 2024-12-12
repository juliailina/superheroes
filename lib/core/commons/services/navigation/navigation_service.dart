import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey(
    debugLabel: 'superheroes-nav-key',
  );
  bool isAppOpen = false;
}
