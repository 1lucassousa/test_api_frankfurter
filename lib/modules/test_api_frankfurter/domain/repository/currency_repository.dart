import 'package:dartz/dartz.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, List<Currency>>> getAllCurrencieAvailable();
}
