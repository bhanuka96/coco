import 'package:flutter/material.dart';

import '../../../components/customText.dart';
import '../../../components/spacing.dart';
import '../../../constants/palette.dart';
import '../../../constants/strings.dart';

class DashboardAppBar extends AppBar {
  DashboardAppBar({Key? key})
      : super(
          key: key,
          elevation: 0,
          backgroundColor: Palette.transparent,
          title: Row(
            children: [
              Image.asset('assets/icons/logo.png', width: 35, height: 35),
              const Spacing(width: 10),
              CustomText(text: Strings.appName, textColor: Palette.black, fontWeight: FontWeight.w700, textSize: 25),
            ],
          ),
        );
}
