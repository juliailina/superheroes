import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.backgroundColor,
  });

  @override
  State<CustomAppBar> createState() => _CustomThemeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _CustomThemeAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      title: widget.title != null
          ? Text(
              widget.title!,
            )
          : null,
    );
  }
}
