import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const PlatformAppBar({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions ?? [],
            ),
          )
        : AppBar(
            title: Text(title),
            actions: actions,
          );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(Platform.isIOS ? 44.0 : kToolbarHeight);
}
