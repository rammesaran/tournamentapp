// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tournamentapp/application/auth/auth_bloc.dart' as _i7;
import 'package:tournamentapp/domain/auth/i_auth_repository.dart' as _i5;
import 'package:tournamentapp/infrastructure/auth/auth_repository.dart' as _i6;
import 'package:tournamentapp/infrastructure/core/dio_client.dart' as _i3;
import 'package:tournamentapp/infrastructure/core/old_dio_client.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.DioClient>(() => _i3.DioClient());
    gh.lazySingleton<_i4.DioClients>(() => _i4.DioClients());
    gh.lazySingleton<_i5.IAuthRepository>(() => _i6.AuthRepository());
    gh.factory<_i7.AuthBloc>(() => _i7.AuthBloc(gh<_i5.IAuthRepository>()));
    return this;
  }
}
