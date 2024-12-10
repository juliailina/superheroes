import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/ui/assets/assets.gen.dart';
import 'package:superheroes/core/commons/ui/styles/export_styles.dart';

class CustomFontSize {
  static const double s48 = 48;
  static const double s40 = 40;
  static const double s32 = 32;
  static const double s28 = 28;
  static const double s24 = 24;
  static const double s20 = 20;
  static const double s18 = 18;
  static const double s16 = 16;
  static const double s14 = 14;
  static const double s13 = 13;
  static const double s12 = 12;
  static const double s11 = 11;
  static const double s10 = 10;
  static const double s8 = 8;
}

class CustomFontWeight {
  /// w400
  static const FontWeight regular = FontWeight.w400;

  /// w700
  static const FontWeight bold = FontWeight.w700;
}

class CustomLineHeight {
  static const double h72 = 72;
  static const double h56 = 56;
  static const double h48 = 48;
  static const double h40 = 40;
  static const double h32 = 32;
  static const double h28 = 28;
  static const double h24 = 24;
  static const double h20 = 20;
  static const double h18 = 18;
  static const double h16 = 16;
}

class CustomLetterSpacing {
  static const double ls15 = 1.15;
  static const double ls10 = 1.10;
}

class CustomTextStyle {
  // D I S P L A Y
  /// Georgia, w600 (bold), s48
  static TextStyle displayXXL = TextStyle(
    fontFamily: Assets.fonts.aquawaxThin,
    fontWeight: CustomFontWeight.bold,
    fontSize: CustomFontSize.s48,
    // height: LineHeight.h72,
  );

  /// Georgia, w600 (bold), s40
  static TextStyle displayXL = displayXXL.copyWith(
    fontSize: CustomFontSize.s40,
    // height: LineHeight.h56,
  );

  // T I T L E
  /// Georgia, w600 (bold), s32
  static TextStyle titleXL = TextStyle(
    fontFamily: Assets.fonts.aquawaxUltraBold,
    fontWeight: CustomFontWeight.bold,
    fontSize: CustomFontSize.s32,
    color: CustomColors.black,
    // height: LineHeight.h48,
  );

  /// Georgia, w600 (bold), s28
  static TextStyle titleL = titleXL.copyWith(
    fontSize: CustomFontSize.s28,
    // height: LineHeight.h40,
  );

  /// Georgia, w600 (bold), s24
  static TextStyle titleM = titleXL.copyWith(
    fontSize: CustomFontSize.s24,
    // height: LineHeight.h32,
  );

  /// Georgia, w600 (bold), s20
  static TextStyle titleS = titleXL.copyWith(
    fontSize: CustomFontSize.s20,
    // height: LineHeight.h28,
  );

  /// Georgia, w600 (bold), s18
  static TextStyle titleXS = titleXL.copyWith(
    fontSize: CustomFontSize.s18,
    // height: LineHeight.h24,
  );

  /// Roboto, w600 (bold), s16, ls15
  static TextStyle titleSection = titleXL.copyWith(
    fontFamily: Assets.fonts.aquawaxHeavy,
    fontSize: CustomFontSize.s16,
    // height: CustomLineHeight.h24,
    letterSpacing: CustomLetterSpacing.ls15,
  );

  // P A R A G R A P H
  /// Roboto, w400 (regular), s18
  static TextStyle paragraphXLdefault = TextStyle(
    fontFamily: Assets.fonts.aquawaxThin,
    fontWeight: CustomFontWeight.regular,
    fontSize: CustomFontSize.s18,
    // height: LineHeight.h28,
  );

  /// Roboto, w700 (bold), s18
  static TextStyle paragraphXLbold = paragraphXLdefault.copyWith(
    fontWeight: CustomFontWeight.bold,
  );

  /// Roboto, w400 (regular), s16
  static TextStyle paragraphLdefault = paragraphXLdefault.copyWith(
    fontSize: CustomFontSize.s16,
    // height: LineHeight.h24,
  );

  /// Roboto, w600 (bold), s16
  static TextStyle paragraphLbold = paragraphLdefault.copyWith(
    fontWeight: CustomFontWeight.bold,
    fontFamily: Assets.fonts.aquawaxMedium,
  );

  /// Roboto, w400 (regular), s14
  static TextStyle paragraphMdefault = paragraphXLdefault.copyWith(
    fontSize: CustomFontSize.s14,
    // height: LineHeight.h20,
  );

  /// Roboto, w700 (bold), s14
  static TextStyle paragraphMbold = paragraphMdefault.copyWith(
    fontWeight: CustomFontWeight.bold,
  );

  /// Roboto, w400 (regular), s13
  static TextStyle paragraphSdefault = paragraphXLdefault.copyWith(
    fontSize: CustomFontSize.s13,
    // height: LineHeight.h18,
  );

  /// Roboto, w700 (bold), s13
  static TextStyle paragraphSbold = paragraphSdefault.copyWith(
    fontWeight: CustomFontWeight.bold,
  );

  /// Roboto, w400 (regular), s14, underline
  static TextStyle linkM = paragraphMdefault.copyWith(
    decoration: TextDecoration.underline,
  );

  // U I   T E X T
  /// Roboto, w600 (bold), s16, ls10
  static TextStyle uiTextL = TextStyle(
    fontFamily: Assets.fonts.aquawaxThin,
    fontWeight: CustomFontWeight.bold,
    fontSize: CustomFontSize.s16,
    // height: LineHeight.h24,
    // letterSpacing: CustomLetterSpacing.ls10,
  );

  /// Roboto, w600 (bold), s14, ls10
  static TextStyle uiTextM = uiTextL.copyWith(
    fontSize: CustomFontSize.s14,
  );

  /// Roboto, w600 (bold), s13, ls10
  static TextStyle uiTextS = uiTextM.copyWith(
    fontSize: CustomFontSize.s13,
  );
}
