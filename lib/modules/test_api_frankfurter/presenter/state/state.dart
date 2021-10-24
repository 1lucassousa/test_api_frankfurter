import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency_conversion.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';

abstract class State {}

class CurrencySuccess implements State {
  final List<Currency> currencies;

  CurrencySuccess(this.currencies);
}

class CurrencyConversionSuccess implements State {
  final CurrencyConversion currencyConversion;

  CurrencyConversionSuccess(this.currencyConversion);
}

class Error implements State {
  final DatasourceError datasourceError;

  Error(this.datasourceError);
}
