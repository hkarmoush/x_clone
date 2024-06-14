import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void showPlatformBottomSheet({
  required BuildContext context,
  required WidgetBuilder builder,
}) {
  if (Platform.isIOS) {
    showCupertinoModalPopup(
      context: context,
      builder: builder,
    );
  } else {
    showModalBottomSheet(
      context: context,
      builder: builder,
    );
  }
}
