import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_clone/app/core/widgets/platform_appbar.dart';

class PlatformScaffold extends StatelessWidget {
  const PlatformScaffold({
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    super.key,
  });
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar is ObstructingPreferredPlatformAppBar
                ? appBar! as ObstructingPreferredPlatformAppBar
                : null,
            child: body,
          )
        : Scaffold(
            appBar: appBar,
            body: body,
            bottomNavigationBar: bottomNavigationBar,
          );
  }
}
