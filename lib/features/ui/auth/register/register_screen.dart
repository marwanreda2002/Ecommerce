import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/validator.dart';
import 'package:e_commerce/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:e_commerce/features/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/app_assets.dart';
import '../../widgets/custom_text_form_field.dart';
import 'cubit/register_states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context, message: "Loading...");
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showAlert(
              context: context,
              title: "Error",
              message: state.errors.errMsg,
              posActionName: "Ok");
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showAlert(
              context: context,
              message: state.registerResponseEntity.message!,
              posActionName: "Ok");
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
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Full Name",
                            style: AppStyles.medium18White,
                          ),
                          CustomTextFormField(
                              controller: viewModel.fullNameController,
                              isPassword: false,
                              keyboardType: TextInputType.text,
                              isObscureText: false,
                              hintText: "enter full name",
                              hintStyle: AppStyles.light18HintText,
                              filledColor: AppColors.whiteColor,
                              validator: AppValidators.validateFullName),
                          Text(
                            "Mobile Number",
                            style: AppStyles.medium18White,
                          ),
                          CustomTextFormField(
                            controller: viewModel.mobileNumberController,
                            isPassword: false,
                            keyboardType: TextInputType.text,
                            isObscureText: false,
                            hintText: "enter your mobile no.",
                            hintStyle: AppStyles.light18HintText,
                            filledColor: AppColors.whiteColor,
                            validator: AppValidators.validatePhoneNumber,
                          ),
                          Text(
                            "E-mail address",
                            style: AppStyles.medium18White,
                          ),
                          CustomTextFormField(
                            controller: viewModel.emailController,
                            isPassword: false,
                            keyboardType: TextInputType.text,
                            isObscureText: false,
                            hintText: "enter your email address",
                            hintStyle: AppStyles.light18HintText,
                            filledColor: AppColors.whiteColor,
                            validator: AppValidators.validateEmail,
                          ),
                          Text(
                            "Password",
                            style: AppStyles.medium18White,
                          ),
                          CustomTextFormField(
                            controller: viewModel.passwordController,
                            isPassword: true,
                            keyboardType: TextInputType.visiblePassword,
                            isObscureText: true,
                            hintText: "enter your password",
                            hintStyle: AppStyles.light18HintText,
                            filledColor: AppColors.whiteColor,
                            validator: AppValidators.validatePassword,
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.visibility_off)),
                          ),
                          Text(
                            "Re-Password",
                            style: AppStyles.medium18White,
                          ),
                          CustomTextFormField(
                            controller: viewModel.rePasswordController,
                            isPassword: true,
                            keyboardType: TextInputType.visiblePassword,
                            isObscureText: true,
                            hintText: "enter your password",
                            hintStyle: AppStyles.light18HintText,
                            filledColor: AppColors.whiteColor,
                            validator: AppValidators.validatePassword,
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.visibility_off)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 35.h),
                            child: CustomElevatedButton(
                                text: "Sign up",
                                onPressed: () {
                                  viewModel.register();
                                },
                                backgroundColor: AppColors.whiteColor,
                                textStyle: AppStyles.semi20Primary),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.loginRoute);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    "Already have account? login",
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
