import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_cubit.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../domain/entites/CategoriesResponseEntity.dart';
import '../../../../../../domain/use_cases/get_all_brands_use_case.dart';
import '../../../../../../domain/use_cases/get_all_category_use_case.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  HomeTabCubit cubit = getIt<HomeTabCubit>();

  @override
  Widget build(BuildContext context) {
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
          // cubit.categoriesList.isNotEmpty
          //     ? _buildCategoryBrandSec(cubit.categoriesList)
          //     : Center(
          //         child: CircularProgressIndicator(
          //           color: AppColors.primaryColor,
          //         ),
          //       ),
          BlocBuilder<HomeTabCubit, HomeTabStates>(
            bloc: HomeTabCubit(
                getAllBrandsUseCase: getIt<GetAllBrandsUseCase>(),
                getAllCategoriesUseCase: getIt<GetAllCategoryUseCase>())
              ..getAllCategories(),
            builder: (context, state) {
              if (state is CategorySuccessState) {
                return _buildCategoryBrandSec(
                    state.categoriesResponseEntity.data!);
              } else if (state is CategoryErrorState) {
                return Center(child: Text(state.errMsg));
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
            },
          ),
          // state is CategorySuccessState
          //     ? _buildCategoryBrandSec(state.categoriesResponseEntity.data!)
          //     : Center(
          //   child: CircularProgressIndicator(
          //     color: AppColors.primaryColor,
          //   ),
          // );

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
          BlocBuilder<HomeTabCubit, HomeTabStates>(
            bloc: HomeTabCubit(
                getAllBrandsUseCase: getIt<GetAllBrandsUseCase>(),
                getAllCategoriesUseCase: getIt<GetAllCategoryUseCase>())
              ..getAllBrands(),
            builder: (context, state) {
              if (state is BrandsSuccessState) {
                return _buildCategoryBrandSec(state.brandsResponseEntity.data!);
              } else if (state is BrandsErrorState) {
                return Center(child: Text(state.errMsg));
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
            },
          ),

          // cubit.brandsList.isNotEmpty?
          // _buildCategoryBrandSec(cubit.brandsList):
          // Center(
          //   child: CircularProgressIndicator(
          //     color: AppColors.primaryColor,
          //   ),
          // ),
          // state is BrandsSuccessState
          //     ? _buildCategoryBrandSec(state.brandsResponseEntity.data!)
          //     : Center(
          //         child: CircularProgressIndicator(
          //           color: AppColors.primaryColor,
          //         ),
          //       ),
        ],
      ),
    );
  }

  SizedBox _buildCategoryBrandSec(List<CategoriesOrBrandsEntity> list) {
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
      ),
    );
  }
}
