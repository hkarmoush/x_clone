import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PlatformAppBar({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(title),
          )
        : AppBar(
            title: Text(title),
          );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        Platform.isIOS ? 44.0 : kToolbarHeight,
      );
}
