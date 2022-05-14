import 'package:flutter/material.dart';

import '../constants/palette.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class CustomSnackBar {
  static showSnackBar(String? title, {Color backgroundColor = Palette.white, Color textColor = Palette.black}) async {
    if ((title ?? '').isNotEmpty) {
      await removeSnackBar();
      rootScaffoldMessengerKey.currentState!
          .showSnackBar(SnackBar(behavior: SnackBarBehavior.floating, content: Text(title!, style: TextStyle(color: textColor)), backgroundColor: backgroundColor));
    }
  }

  static removeSnackBar() {
   return rootScaffoldMessengerKey.currentState!.hideCurrentSnackBar();
  }
}
