import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_api_frankfurter/app_widget.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/usecase/currencie_repository.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/external/datasource/get_currencies_api_datasource.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/repository/get_currencies_repository.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/bloc/currencie_bloc.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/currencie_conversion_page.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/home_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GetCurrenciesImpl(i())),
        Bind((i) => GetCurrenciesApiDatasource(i())),
        Bind((i) => GetCurrenciesRepositoryImpl(i())),
        Bind((i) => CurrencieBloc(i())),
      ];

  @override
  List<ModularRouter> get routers =>
      [ModularRouter('/', child: (_, __) => HomePage()),
      ModularRouter('/', child: (_, __) => CurrencieConversionPage())];

  @override
  Widget get bootstrap => AppWidget();
}
