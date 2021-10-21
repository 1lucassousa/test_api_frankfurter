import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currencie.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';

abstract class State {}

class CurrencieSuccess implements State {
  final List<Currencie> currencies;

  CurrencieSuccess(this.currencies);
}

class Error implements State {
  final DatasourceError datasourceError;

  Error(this.datasourceError);
}
