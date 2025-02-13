import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_cubit.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../domain/entites/CategoriesResponseEntity.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  HomeTabCubit cubit = getIt<HomeTabCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, HomeTabStates>(
      bloc: cubit..getAllCategories(),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Category",
                    style: AppStyles.semi20Primary,
                  ),
                  Spacer(),
                  Text(
                    "view all",
                    style: AppStyles.semi20Primary,
                  )
                ],
              ),
              state is CategorySuccessState
                  ? _buildCategoryBrandSec(state.categoriesResponseEntity.data!)
                  : Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
              Row(
                children: [
                  Text(
                    "Brands",
                    style: AppStyles.semi20Primary,
                  ),
                  Spacer(),
                  Text(
                    "view all",
                    style: AppStyles.semi20Primary,
                  )
                ],
              ),
              // _buildCategoryBrandSec(),
            ],
          ),
        );
      },
    );
  }

  SizedBox _buildCategoryBrandSec(List<CategoryEntity> list) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.h,
        ),
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            width: double.infinity,
            height: 10.h,
            fit: BoxFit.cover,
            imageUrl: list[index].image!,
            imageBuilder: (context, imageProvider) {
              return CircleAvatar(
                backgroundImage: imageProvider,
                radius: 50.r,
              );
            },
            placeholder: (context, url) => CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
        },
      ), // GridView.builder
    ); // SizedBox
  }
}
