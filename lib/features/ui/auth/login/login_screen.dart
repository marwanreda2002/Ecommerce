import 'package:e_commerce/features/ui/auth/login/cubit/login_cubit.dart';
import 'package:e_commerce/features/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../../core/utils/validator.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  LoginCubit cubit = getIt<LoginCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      bloc: cubit,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, message: "Loading...");
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showAlert(
              context: context,
              title: "Error",
              message: state.errMsg,
              posActionName: "Ok");
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showAlert(
              context: context,
              message: state.msg,
              posActionName: "Ok",
              posAction: () {
                Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
              });
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 91.h, left: 97.w, right: 97.w, bottom: 10.h),
              child: Image.asset(AppAssets.appBarLeading),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "E-mail",
                            style: AppStyles.medium18White,
                          ),
                          CustomTextFormField(
                              controller: cubit.emailController,
                              isPassword: false,
                              keyboardType: TextInputType.text,
                              isObscureText: false,
                              hintText: "enter your email",
                              hintStyle: AppStyles.light18HintText,
                              filledColor: AppColors.whiteColor,
                              validator: AppValidators.validateEmail),
                          Text(
                            "Password",
                            style: AppStyles.medium18White,
                          ),
                          CustomTextFormField(
                            controller: cubit.passwordController,
                            isPassword: true,
                            keyboardType: TextInputType.visiblePassword,
                            isObscureText: true,
                            hintText: "enter your password",
                            hintStyle: AppStyles.light18HintText,
                            filledColor: AppColors.whiteColor,
                            validator: AppValidators.validatePassword,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 35.h),
                            child: CustomElevatedButton(
                                text: "Login in",
                                onPressed: () {
                                  cubit.login();
                                },
                                backgroundColor: AppColors.whiteColor,
                                textStyle: AppStyles.semi20Primary),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.registerRoute);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    "Don't have account? Register",
                                    style: AppStyles.medium18White,
                                    maxLines: 1,
                                  )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
