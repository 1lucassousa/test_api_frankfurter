import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency_conversion.dart';

abstract class CurrencyConversionDatasource {
  Future<CurrencyConversion> getConversion(
      String amount, String from, String to);
}
