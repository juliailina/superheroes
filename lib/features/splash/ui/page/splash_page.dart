import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:superheroes/core/commons/services/export_services.dart';
import 'package:superheroes/core/commons/ui/assets/assets.gen.dart';
import 'package:superheroes/core/commons/ui/styles/typography.dart';
import 'package:superheroes/features/navigation_bar/export_navigation_bar.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

class _Constants {
  static const int splashDuration = 3;
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> navigate() async {
    await Future.wait([
      locator<SuperheroesBloc>().init(),
    ]);

    await Future.delayed(
        const Duration(
          seconds: _Constants.splashDuration,
        ), () async {
      if (mounted) {
        context.pushReplacement(NavigationBarRoutes.navigationBar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await navigate();
    });
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.lottie.superheroJson.lottie(
              fit: BoxFit.contain,
            ),
            Text(
              S.of(context).appTitle,
              style: CustomTextStyle.displayXL,
            ),
          ],
        ),
      ),
    );
  }
}
