import 'dart:io';

import 'package:flutter/cupertino.dart' show CupertinoTextField;
import 'package:flutter/material.dart';

class PlatformTextView extends StatelessWidget {
  const PlatformTextView({
    required this.controller,
    required this.placeholder,
    super.key,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String placeholder;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controller,
            placeholder: placeholder,
            maxLines: maxLines,
            padding: const EdgeInsets.all(12),
          )
        : TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: placeholder,
              border: const OutlineInputBorder(),
            ),
            maxLines: maxLines,
          );
  }
}
