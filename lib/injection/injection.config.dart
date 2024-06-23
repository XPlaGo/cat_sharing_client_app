// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cat_sharing_client_app/config/app.config.dart' as _i3;
import 'package:cat_sharing_client_app/config/config.module.dart' as _i11;
import 'package:cat_sharing_client_app/services/auth_service.dart' as _i4;
import 'package:cat_sharing_client_app/services/cat_service.dart' as _i5;
import 'package:cat_sharing_client_app/services/owner_service.dart' as _i6;
import 'package:cat_sharing_client_app/services/payment_account_service.dart'
    as _i7;
import 'package:cat_sharing_client_app/services/payment_service.dart' as _i8;
import 'package:cat_sharing_client_app/services/trade_service.dart' as _i10;
import 'package:cat_sharing_client_app/services/transaction_service.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final configModule = _$ConfigModule();
    await gh.singletonAsync<_i3.AppConfig>(
      () => configModule.appSettings,
      preResolve: true,
    );
    gh.factory<_i4.AuthService>(() => _i4.AuthService(gh<_i3.AppConfig>()));
    gh.factory<_i5.CatService>(() => _i5.CatService(gh<_i3.AppConfig>()));
    gh.factory<_i6.OwnerService>(() => _i6.OwnerService(gh<_i3.AppConfig>()));
    gh.factory<_i7.PaymentAccountService>(
        () => _i7.PaymentAccountService(gh<_i3.AppConfig>()));
    gh.factory<_i8.PaymentService>(
        () => _i8.PaymentService(gh<_i3.AppConfig>()));
    gh.factory<_i9.TransactionService>(
        () => _i9.TransactionService(gh<_i3.AppConfig>()));
    gh.factory<_i10.TradeService>(() => _i10.TradeService(gh<_i3.AppConfig>()));
    return this;
  }
}

class _$ConfigModule extends _i11.ConfigModule {}
