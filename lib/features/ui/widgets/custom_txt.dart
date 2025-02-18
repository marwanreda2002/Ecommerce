import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';

class CustomTxt extends StatelessWidget {
  final Color? fontColor;
  final String text;
  final double? fontSize;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;

  const CustomTxt(
      {this.fontWeight,
      this.fontSize,
      required this.text,
      this.fontColor,
      this.textStyle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: textStyle ??
          Theme.of(context).textTheme.titleMedium!.copyWith(
                color: fontColor ?? AppColors.primaryColor,
                fontSize: fontSize ?? 18.sp,
                fontWeight: fontWeight ?? FontWeight.w300,
              ),
    );
  }
}
