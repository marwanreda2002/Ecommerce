import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  String text;
  Color backgroundColor;
  TextStyle textStyle;
  void Function()? onPressed;

  CustomElevatedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.backgroundColor,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: SizedBox(
          height: 64.h,
          width: 398.w,
          child: Center(
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ));
  }
}
