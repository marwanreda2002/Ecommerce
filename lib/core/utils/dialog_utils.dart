import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_styles.dart';

class DialogUtils {
  static void showLoading({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.primaryColor,
            content: Row(
              children: [
                CircularProgressIndicator(
                  color: AppColors.whiteColor,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  message,
                  style: AppStyles.regular18White,
                )
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showAlert({
    required BuildContext context,
    required String message,
    String title = '',
    String? posActionName,
    Function? posAction,
    String? negActionName,
    Function? negAction,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(
            posActionName,
            style: AppStyles.regular18White,
          )));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(
            negActionName,
            style: AppStyles.regular18White,
          )));
    }
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.primaryColor,
            title: Text(
              title,
              style: AppStyles.regular18White,
            ),
            content: Text(
              message,
              style: AppStyles.regular18White,
            ),
            actions: actions,
          );
        });
  }
}
