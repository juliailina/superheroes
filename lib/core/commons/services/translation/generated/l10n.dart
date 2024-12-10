// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Superheroes`
  String get appTitle {
    return Intl.message(
      'Superheroes',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Superheroes app!`
  String get welcomeMessage {
    return Intl.message(
      'Welcome to Superheroes app!',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeLabel {
    return Intl.message(
      'Home',
      name: 'homeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Superheroes`
  String get superheroesLabel {
    return Intl.message(
      'Superheroes',
      name: 'superheroesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Playground`
  String get playgroundLabel {
    return Intl.message(
      'Playground',
      name: 'playgroundLabel',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong.`
  String get errorWidgetTitle {
    return Intl.message(
      'Something went wrong.',
      name: 'errorWidgetTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection and try again.`
  String get errorWidgetDescription {
    return Intl.message(
      'Please check your internet connection and try again.',
      name: 'errorWidgetDescription',
      desc: '',
      args: [],
    );
  }

  /// `Superhero of the day`
  String get homePageTitle {
    return Intl.message(
      'Superhero of the day',
      name: 'homePageTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}