// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mvp_engineer/application/auth/auth_bloc.dart' as _i815;
import 'package:mvp_engineer/application/login/login_bloc.dart' as _i129;
import 'package:mvp_engineer/application/products/products_bloc.dart' as _i563;
import 'package:mvp_engineer/domain/app-data/app_data.dart' as _i549;
import 'package:mvp_engineer/domain/auth/i_auth_facade.dart' as _i64;
import 'package:mvp_engineer/domain/store/i_store_facade.dart' as _i65;
import 'package:mvp_engineer/infrastructure/auth/auth_repo.dart' as _i709;
import 'package:mvp_engineer/infrastructure/core/dio.dart' as _i192;
import 'package:mvp_engineer/infrastructure/store/store_repo.dart' as _i600;
import 'package:mvp_engineer/injection/injection_module.dart' as _i222;

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
    gh.lazySingleton<_i549.AppData>(() => injectionModule.appData);
    gh.lazySingleton<_i192.DioClient>(() => injectionModule.dioClient);
    gh.lazySingleton<_i64.IAuthFacade>(
        () => _i709.AuthRepo(gh<_i549.AppData>()));
    gh.lazySingleton<_i65.IStoreFacade>(() => _i600.StoreRepo());
    gh.factory<_i563.ProductsBloc>(
        () => _i563.ProductsBloc(gh<_i65.IStoreFacade>()));
    gh.factory<_i815.AuthBloc>(() => _i815.AuthBloc(gh<_i64.IAuthFacade>()));
    gh.factory<_i129.LoginBloc>(() => _i129.LoginBloc(gh<_i64.IAuthFacade>()));
    return this;
  }
}

class _$InjectionModule extends _i222.InjectionModule {}
