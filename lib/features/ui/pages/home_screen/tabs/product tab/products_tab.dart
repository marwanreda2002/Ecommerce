import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/product%20tab/cubit/product_cubit.dart';
import 'package:e_commerce/features/ui/pages/home_screen/tabs/product%20tab/cubit/product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';

class ProductsTab extends StatelessWidget {
  ProductsTab({super.key});

  ProductCubit cubit = getIt<ProductCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit..getAllProduct(),
      builder: (context, state) {
        if (state is ProductSuccessState) {
          return SafeArea(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 1.5,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h),
                itemCount: state.response.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.productRoute,
                            arguments: state.response.data![index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border:
                              Border.all(color: AppColors.primary300opacity),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.r),
                                  child: CachedNetworkImage(
                                    width: 191.w,
                                    height: 120.h,
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        state.response.data![index].imageCover!,
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.error,
                                      color: AppColors.redColor,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 8.h,
                                    right: 8.w,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white60,
                                      radius: 20.r,
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {
                                            // Todo add to fav
                                          },
                                          icon: Icon(
                                            Icons.favorite_border_outlined,
                                            color: AppColors.primaryColor,
                                          ),
                                          padding: EdgeInsets.zero,
                                          iconSize: 30.r,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ));
                },
              )),
            ],
          ));
        } else if (state is ProductErrorState) {
          return Text(state.message);
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ));
        }
      },
    );
  }
}
