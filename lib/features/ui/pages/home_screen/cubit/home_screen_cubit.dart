import 'package:e_commerce/features/ui/pages/home_screen/cubit/home_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../tabs/favorite_tab.dart';
import '../tabs/home_tab/home_tab.dart';
import '../tabs/products_tab.dart';
import '../tabs/user_tab.dart';

class HomeScreenCubit extends Cubit<HomeStates> {
  HomeScreenCubit() : super(HomeInitialState());
  int selectedIndex = 0;
  List<Widget> bodyList = [
    HomeTab(),
    ProductsTab(),
    FavoriteTab(),
    const UserTab()
  ];

  void bottomNavOnTap(int index) {
    selectedIndex = index;
    emit(HomeChangeSelectedIndexState());
  }
}
