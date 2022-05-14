import 'package:flutter/material.dart';

import '../constants/palette.dart';

class CustomText extends Text {
  final String text;
  final Color? textColor;
  final double? textSize;
  final int? maxLine;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final bool? isCenter;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;

  CustomText(
      {Key? key,
      required this.text,
      this.isCenter,
      bool? softWrap,
      TextAlign? textAlign = TextAlign.start,
      this.maxLine,
      this.textDecoration,
      this.textOverflow,
      this.textColor,
      this.textSize,
      this.fontWeight,
      this.fontStyle})
      : super(text,
            key: key,
            overflow: textOverflow,
            softWrap: softWrap ?? true,
            textAlign: isCenter != null ? TextAlign.center : textAlign,
            maxLines: maxLine,
            style: TextStyle(
              fontSize: textSize != null ? (textSize - 1.0) : 14 - 1.0,
              decoration: textDecoration,
              color: textColor ?? Palette.black,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
            ));
}
