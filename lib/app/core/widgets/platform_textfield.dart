import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformTextField extends StatelessWidget {
  const PlatformTextField({
    required this.controller,
    required this.placeholder,
    super.key,
    this.obscureText = false,
  });
  final TextEditingController controller;
  final String placeholder;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controller,
            placeholder: placeholder,
            obscureText: obscureText,
          )
        : TextField(
            controller: controller,
            decoration: InputDecoration(labelText: placeholder),
            obscureText: obscureText,
          );
  }
}
