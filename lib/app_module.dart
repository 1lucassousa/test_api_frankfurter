import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_api_frankfurter/app_widget.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/usecase/currency_conversion_repository.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/usecase/currency_repository.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/external/datasource/get_currencies_api_datasource.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/external/datasource/get_currency_conversion_api_datasource.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/repository/get_conversion_repository.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/repository/get_currencies_repository.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/bloc/currency_bloc.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/bloc/currency_conversion_bloc.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/bloc/dropdown_bloc.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/currency_conversion_page.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/result_conversion_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GetCurrenciesImpl(i())),
        Bind((i) => GetCurrenciesApiDatasource(i())),
        Bind((i) => GetCurrenciesRepositoryImpl(i())),
        Bind((i) => CurrencyBloc(i())),
        Bind((i) => GetConversionImpl(i())),
        Bind((i) => GetConversionApiDatasource(i())),
        Bind((i) => GetConversionRepositoryImpl(i())),
        Bind((i) => CurrencyConversionBloc(i())),
        Bind((i) => DropdownBloc())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => const CurrencyConversionPage()),
        ModularRouter('/',
            child: (_, __) => const ResultConversionPage(
                  amount: '',
                  from: '',
                  to: '',
                ))
      ];

  @override
  Widget get bootstrap => const AppWidget();
}
