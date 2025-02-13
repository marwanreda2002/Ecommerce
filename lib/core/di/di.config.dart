// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_sources/remote_data_source/auth_remote_data_source_impl.dart'
    as _i373;
import '../../data/data_sources/remote_data_source/home_remote_data_source_impl.dart';
import '../../data/repositories/auth_repository_imp.dart';
import '../../data/repositories/home_repo_impl.dart';
import '../../domain/repositories/auth/auth_repository.dart';
import '../../domain/repositories/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i900;
import '../../domain/repositories/data_sources/remote_data_source/home_remote_data-source.dart';
import '../../domain/repositories/home/home_repo.dart';
import '../../domain/use_cases/LoginUseCase.dart' as _i621;
import '../../domain/use_cases/get_all_category_use_case.dart';
import '../../domain/use_cases/register_use_case.dart';
import '../../features/ui/auth/login/cubit/login_cubit.dart' as _i209;
import '../../features/ui/auth/register/cubit/register_view_model.dart';
import '../../features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_cubit.dart';
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl());
    gh.factory<HomeRepo>(
        () => HomeRepoImpl(homeRemoteDataSource: gh<HomeRemoteDataSource>()));
    gh.factory<_i900.AuthRemoteDataSource>(
        () => _i373.AuthRemoteDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<AuthRepository>(
        () => AuthRepositoryImpl(gh<_i900.AuthRemoteDataSource>()));
    gh.factory<_i209.LoginCubit>(
        () => _i209.LoginCubit(loginUseCase: gh<_i621.LoginUseCase>()));
    gh.factory<RegisterUseCase>(() => RegisterUseCase(gh<AuthRepository>()));
    gh.factory<_i621.LoginUseCase>(
        () => _i621.LoginUseCase(gh<AuthRepository>()));
    gh.factory<RegisterViewModel>(
        () => RegisterViewModel(registerUseCase: gh<RegisterUseCase>()));
    gh.factory<GetAllCategoryUseCase>(
        () => GetAllCategoryUseCase(homeRepo: gh<HomeRepo>()));
    gh.factory<HomeTabCubit>(() =>
        HomeTabCubit(getAllCategoriesUseCase: gh<GetAllCategoryUseCase>()));
    return this;
  }
}
