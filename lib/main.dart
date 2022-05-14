import 'package:coco/constants/palette.dart';
import 'package:coco/constants/strings.dart';
import 'package:coco/views/dashboard/dashboardPage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/customSnackBar.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: Palette.appTheme,
      themeMode: ThemeMode.system,
      home: const DashboardPage(),
    );
  }
}
