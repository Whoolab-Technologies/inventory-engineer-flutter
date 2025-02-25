// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mvp_engineer/application/auth/auth_bloc.dart' as _i730;
import 'package:mvp_engineer/application/login/login_bloc.dart' as _i837;
import 'package:mvp_engineer/application/material_request/material_request_bloc.dart'
    as _i566;
import 'package:mvp_engineer/application/products/products_bloc.dart' as _i992;
import 'package:mvp_engineer/domain/app-data/app_data.dart' as _i554;
import 'package:mvp_engineer/domain/auth/i_auth_facade.dart' as _i129;
import 'package:mvp_engineer/domain/material_request/i_material_request_facade.dart'
    as _i973;
import 'package:mvp_engineer/domain/product/i_product_facade.dart' as _i983;
import 'package:mvp_engineer/infrastructure/auth/auth_repo.dart' as _i597;
import 'package:mvp_engineer/infrastructure/core/dio.dart' as _i429;
import 'package:mvp_engineer/infrastructure/material_request/material_request_repo.dart'
    as _i49;
import 'package:mvp_engineer/infrastructure/product/product_repo.dart' as _i127;
import 'package:mvp_engineer/injection/injection_module.dart' as _i118;

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
    final injectionModule = _$InjectionModule();
    gh.lazySingleton<_i554.AppData>(() => injectionModule.appData);
    gh.lazySingleton<_i429.DioClient>(() => injectionModule.dioClient);
    gh.lazySingleton<_i129.IAuthFacade>(
        () => _i597.AuthRepo(gh<_i554.AppData>()));
    gh.lazySingleton<_i973.IMaterialRequestFacade>(
        () => _i49.MaterialRequestRepo());
    gh.lazySingleton<_i983.IProductFacade>(() => _i127.ProductRepo());
    gh.factory<_i730.AuthBloc>(() => _i730.AuthBloc(gh<_i129.IAuthFacade>()));
    gh.factory<_i992.ProductsBloc>(
        () => _i992.ProductsBloc(gh<_i983.IProductFacade>()));
    gh.factory<_i837.LoginBloc>(() => _i837.LoginBloc(gh<_i129.IAuthFacade>()));
    gh.factory<_i566.MaterialRequestBloc>(
        () => _i566.MaterialRequestBloc(gh<_i973.IMaterialRequestFacade>()));
    return this;
  }
}

class _$InjectionModule extends _i118.InjectionModule {}
