import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency.dart';

abstract class CurrencyDatasource {
  Future<List<Currency>> getAllCurrencieAvailable();
}
