import 'package:flutter/material.dart';

import '../constants/strings.dart';
import 'customText.dart';

class CustomError extends StatelessWidget{
  const CustomError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Center(child: CustomText(text: Strings.somethingError));
  }
  
}