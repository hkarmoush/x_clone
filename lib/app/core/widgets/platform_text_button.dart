import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformTextButton extends StatelessWidget {
  const PlatformTextButton({
    required this.text,
    required this.onPressed,
    super.key,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: onPressed,
            child: Text(text),
          )
        : TextButton(
            onPressed: onPressed,
            child: Text(text),
          );
  }
}
