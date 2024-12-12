import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:superheroes/core/commons/ui/assets/assets.gen.dart';

class _Constants {
  static const Radius borderRadius = Radius.circular(25);
}

Widget get _placeholderImageWidget => Assets.placeholder.image(
      fit: BoxFit.cover,
    );

class CustomSquareImage extends StatelessWidget {
  const CustomSquareImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(_Constants.borderRadius),
      child: CachedNetworkImage(
        width: double.infinity,
        height: double.infinity,
        imageUrl: image,
        fit: BoxFit.cover,
        placeholder: (context, url) => _placeholderImageWidget,
        errorWidget: (context, url, error) => _placeholderImageWidget,
      ),
    );
  }
}
