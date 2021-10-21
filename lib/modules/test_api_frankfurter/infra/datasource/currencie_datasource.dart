import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currencie.dart';

abstract class CurrencieDatasource {
  Future<List<Currencie>> getAllCurrencieAvailable();
}
