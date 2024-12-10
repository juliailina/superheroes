import 'package:flutter/material.dart';
import 'package:superheroes/features/navigation_bar/domain/export_domain.dart';

class NavigationBarBloc {
  final ValueNotifier<NavigationBarTab> _selectedIndexNavigationBar =
      ValueNotifier(NavigationBarTab.home);

  ValueNotifier<NavigationBarTab> get selectedIndexNavigationBar =>
      _selectedIndexNavigationBar;

  set onChangeTab(NavigationBarTab tab) {
    _selectedIndexNavigationBar.value = tab;
  }
}
