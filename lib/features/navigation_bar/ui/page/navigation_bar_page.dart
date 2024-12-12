import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:superheroes/core/commons/services/export_services.dart';
import 'package:superheroes/core/commons/ui/styles/export_styles.dart';
import 'package:superheroes/features/generator/export_generator.dart';
import 'package:superheroes/features/home/export_home.dart';
import 'package:superheroes/features/navigation_bar/export_navigation_bar.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

class _Constants {
  static const Radius clipRadius = Radius.circular(22);
  static const double fillIcon = 1;
}

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  late NavigationBarBloc _navigationBarBloc;

  @override
  void initState() {
    super.initState();
    _navigationBarBloc = locator<NavigationBarBloc>();
  }

  NavigationDestination _getNavigationDestination({
    required String label,
    required IconData icon,
  }) =>
      NavigationDestination(
        tooltip: label,
        icon: _getIconWidget(icon),
        selectedIcon: _getIconWidget(
          icon,
          isFill: true,
        ),
        label: label,
      );

  Icon _getIconWidget(
    IconData icon, {
    bool isFill = false,
  }) =>
      Icon(
        icon,
        fill: isFill ? _Constants.fillIcon : null,
      );

  List<Widget> get _navBardestinations => [
        _getNavigationDestination(
          label: S.of(context).homeLabel,
          icon: Symbols.home_rounded,
        ),
        _getNavigationDestination(
          label: S.of(context).superheroesLabel,
          icon: Symbols.view_list_rounded,
        ),
        _getNavigationDestination(
          label: S.of(context).generatorLabel,
          icon: Symbols.smart_toy_rounded,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _navigationBarBloc.selectedIndexNavigationBar,
      builder: (context, selectedNavBarTab, _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              selectedNavBarTab.appBarTitle(context),
            ),
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: _Constants.clipRadius,
              topRight: _Constants.clipRadius,
            ),
            child: NavigationBar(
              indicatorColor: CustomColors.transparent,
              selectedIndex: selectedNavBarTab.index,
              onDestinationSelected: (index) {
                _navigationBarBloc.onChangeTab = NavigationBarTab.values[index];
                if (index != NavigationBarTab.home.index && context.canPop()) {
                  context.pop();
                }
              },
              destinations: _navBardestinations,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            ),
          ),
          body: IndexedStack(
            index: selectedNavBarTab.index,
            children: const [
              HomePage(),
              SuperheroesPage(),
              GeneratorPage(),
            ],
          ),
        );
      },
    );
  }
}
