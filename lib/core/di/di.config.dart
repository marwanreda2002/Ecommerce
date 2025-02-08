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
import '../../data/repositories/auth_repository_imp.dart' as _i346;
import '../../domain/repositories/auth/auth_repository.dart' as _i660;
import '../../domain/repositories/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i900;
import '../../domain/use_cases/register_use_case.dart' as _i479;
import '../../features/ui/auth/register/cubit/register_view_model.dart'
    as _i873;
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
    gh.factory<_i900.AuthRemoteDataSource>(
        () => _i373.AuthRemoteDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i660.AuthRepository>(
        () => _i346.AuthRepositoryImpl(gh<_i900.AuthRemoteDataSource>()));
    gh.factory<_i479.RegisterUseCase>(
        () => _i479.RegisterUseCase(gh<_i660.AuthRepository>()));
    gh.factory<_i873.RegisterViewModel>(() =>
        _i873.RegisterViewModel(registerUseCase: gh<_i479.RegisterUseCase>()));
    return this;
  }
}
