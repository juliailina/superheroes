import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;
  final bool isModal;

  const CustomAppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.isModal = false,
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
      automaticallyImplyLeading: !widget.isModal,
      actions: [
        if (widget.isModal)
          CloseButton(
            onPressed: () {
              context.pop();
            },
          ),
      ],
    );
  }
}
