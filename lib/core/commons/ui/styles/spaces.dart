import 'package:flutter/material.dart';

class CustomRadius {
  static const double _s = 2;
  static const double _m = 4;
  static const double _l = 8;
  static const double _xl = 12;
  static const double _xxl = 32;
  static const double _xxxl = 100;

  // B O R D E R   R A D I U S   W I D G E T S
  /// Circular radius of 2
  static BorderRadius radiusS = BorderRadius.circular(_s);

  /// Circular radius of 4
  static BorderRadius radiusM = BorderRadius.circular(_m);

  /// Circular radius of 8
  static BorderRadius radiusL = BorderRadius.circular(_l);

  /// Circular radius of 12
  static BorderRadius radiusXL = BorderRadius.circular(_xl);

  /// Circular radius of 32
  static BorderRadius radiusXXL = BorderRadius.circular(_xxl);

  /// Circular radius of 100
  static BorderRadius radiusXXXL = BorderRadius.circular(_xxxl);
}

class MaxLines {
  static const one = 1;
  static const two = 2;
  static const three = 3;
}

class IconSize {
  /// 12
  static const double iconXS = 12;

  /// 16
  static const double iconS = 16;

  /// 20
  static const double iconM = 20;

  /// 24 should be the default
  static const double iconL = 24;

  /// 32
  static const double iconXL = 32;
}

class Spaces {
  // U N I V E R S A L   S P A C E S   (use them as values for margins, paddings)
  /// {@template space_zero}
  /// 0
  /// {@endtemplate}
  static const double zero = 0;

  /// {@template space_XXXS}
  /// 2
  /// {@endtemplate}
  static const double spaceXXXS = 2;

  /// {@template space_XXS}
  /// 4
  /// {@endtemplate}
  static const double spaceXXS = 4;

  /// {@template space_XS}
  /// 8
  /// {@endtemplate}
  static const double spaceXS = 8;

  /// {@template space_S}
  /// 16
  /// {@endtemplate}
  static const double spaceS = 16;

  /// {@template space_M}
  /// 24
  /// {@endtemplate}
  static const double spaceM = 24;

  /// {@template space_L}
  /// 32
  /// {@endtemplate}
  static const double spaceL = 32;

  /// {@template space_XL}
  /// 56
  /// {@endtemplate}
  static const double spaceXL = 56;

  /// {@template space_XXL}
  /// 80
  /// {@endtemplate}
  static const double spaceXXL = 80;

  /// {@template space_XXXL}
  /// 96
  /// {@endtemplate}
  static const double spaceXXXL = 96;

  /// {@template space_XXXXL}
  /// 120
  /// {@endtemplate}
  static const double spaceXXXXL = 120;

  // V E R T I C A L   S P A C E S   (use them as vertical containers to create space)

  /// Creates a SizedBox with the desired [height]
  static Widget verticalSpace(double height) {
    return SizedBox(height: height);
  }

  /// Vertical
  ///{@macro space_XXXS}
  static Widget verticalXXXS() {
    return verticalSpace(spaceXXXS);
  }

  /// Vertical
  ///{@macro space_XXS}
  static Widget verticalXXS() {
    return verticalSpace(spaceXXS);
  }

  /// Vertical
  ///{@macro space_XS}
  static Widget verticalXS() {
    return verticalSpace(spaceXS);
  }

  /// Vertical
  ///{@macro space_S}
  static Widget verticalS() {
    return verticalSpace(spaceS);
  }

  /// Vertical
  ///{@macro space_M}
  static Widget verticalM() {
    return verticalSpace(spaceM);
  }

  /// Vertical
  ///{@macro space_L}
  static Widget verticalL() {
    return verticalSpace(spaceL);
  }

  /// Vertical
  ///{@macro space_XL}
  static Widget verticalXL() {
    return verticalSpace(spaceXL);
  }

  /// Vertical
  ///{@macro space_XXL}
  static Widget verticalXXL() {
    return verticalSpace(spaceXXL);
  }

  /// Vertical
  ///{@macro space_XXXL}
  static Widget verticalXXXL() {
    return verticalSpace(spaceXXXL);
  }

  // H O R I Z O N T A L   S P A C E S   (use them as horizontal containers to create space)

  /// Creates a SizedBox with the desired [width]
  static Widget horizontalSpace(double width) {
    return SizedBox(width: width);
  }

  /// Horizontal
  ///{@macro space_XXXS}
  static Widget horizontalXXXS() {
    return horizontalSpace(spaceXXXS);
  }

  /// Horizontal
  ///{@macro space_XXS}
  static Widget horizontalXXS() {
    return horizontalSpace(spaceXXS);
  }

  /// Horizontal
  ///{@macro space_XS}
  static Widget horizontalXS() {
    return horizontalSpace(spaceXS);
  }

  /// Horizontal
  ///{@macro space_S}
  static Widget horizontalS() {
    return horizontalSpace(spaceS);
  }

  /// Horizontal
  ///{@macro space_M}
  static Widget horizontalM() {
    return horizontalSpace(spaceM);
  }

  /// Horizontal
  ///{@macro space_L}
  static Widget horizontalL() {
    return horizontalSpace(spaceL);
  }

  /// Horizontal
  ///{@macro space_XL}
  static Widget horizontalXL() {
    return horizontalSpace(spaceXL);
  }

  /// Horizontal
  ///{@macro space_XXL}
  static Widget horizontalXXL() {
    return horizontalSpace(spaceXXL);
  }
}
