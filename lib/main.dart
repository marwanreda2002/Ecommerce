import 'package:e_commerce/features/ui/auth/register/register_screen.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/product%20tab/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/my_bloc_observer.dart';
import 'features/ui/auth/login/login_screen.dart';
import 'features/ui/pages/home_screen/home_screen.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.homeRoute,
            routes: {
              AppRoutes.productRoute: (context) => ProductDetails(),
              AppRoutes.registerRoute: (context) => RegisterScreen(),
              AppRoutes.loginRoute: (context) => LoginScreen(),
              AppRoutes.homeRoute: (context) => HomeScreen(),
            },
            theme: AppTheme.lightTheme,
          );
        });
  }
}
