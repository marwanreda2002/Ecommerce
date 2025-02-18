import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/features/ui/pages/home_screen/cubit/home_screen_cubit.dart';
import 'package:e_commerce/features/ui/pages/home_screen/cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeScreenCubit cubit = HomeScreenCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeStates>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Image.asset(
              AppAssets.appBarLeading,
              color: AppColors.primaryColor,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: cubit.bodyList[cubit.selectedIndex],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: AppColors.primaryColor),
              child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                  currentIndex: cubit.selectedIndex,
                  onTap: cubit.bottomNavOnTap,
                  iconSize: 24.sp,
                  items: [
                    _bottomNavBarItemBuilder(
                      isSelected: cubit.selectedIndex == 0,
                      selectedIcon: AppAssets.selectedHomeIcon,
                      unselectedIcon: AppAssets.unSelectedHomeIcon,
                    ),
                    _bottomNavBarItemBuilder(
                      isSelected: cubit.selectedIndex == 1,
                      selectedIcon: AppAssets.selectedCategoryIcon,
                      unselectedIcon: AppAssets.unSelectedCategoryIcon,
                    ),
                    _bottomNavBarItemBuilder(
                      isSelected: cubit.selectedIndex == 2,
                      selectedIcon: AppAssets.selectedFavouriteIcon,
                      unselectedIcon: AppAssets.unSelectedFavouriteIcon,
                    ),
                    _bottomNavBarItemBuilder(
                      isSelected: cubit.selectedIndex == 3,
                      selectedIcon: AppAssets.selectedAccountIcon,
                      unselectedIcon: AppAssets.unSelectedAccountIcon,
                    ),
                  ]),
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _bottomNavBarItemBuilder(
      {required bool isSelected,
      required String selectedIcon,
      required String unselectedIcon}) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        foregroundColor:
            isSelected ? AppColors.primaryColor : AppColors.whiteColor,
        radius: 25.r,
        backgroundColor: isSelected ? AppColors.whiteColor : Colors.transparent,
        child: Image.asset(
          isSelected ? selectedIcon : unselectedIcon,
        ),
      ),
      label: "",
    );
  }
}
