import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/services/translation/export_translation.dart';
import 'package:superheroes/core/commons/ui/assets/assets.gen.dart';
import 'package:superheroes/core/commons/ui/styles/export_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spaces.spaceS),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Spaces.spaceL,
            ),
            child: Assets.images.errorImage.image(
              fit: BoxFit.contain,
            ),
          ),
          Spaces.verticalM(),
          Text(
            S.of(context).errorWidgetTitle,
            style: CustomTextStyle.paragraphLbold,
            textAlign: TextAlign.center,
          ),
          Spaces.verticalXS(),
          Text(
            S.of(context).errorWidgetDescription,
            style: CustomTextStyle.paragraphMdefault,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
