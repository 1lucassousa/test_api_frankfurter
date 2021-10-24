import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/model/result_currency_conversion_model.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/model/result_currency_model.dart';

class CurrencyController {
  static List<ResultCurrencyModel> list;
  static ResultCurrencyConversionModel resultConversion;

  static inicializeCurrencies(data) {
    list = data;
  }

  static inicializeConversionData(data) {
    resultConversion = data;
  }
}
