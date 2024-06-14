import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
