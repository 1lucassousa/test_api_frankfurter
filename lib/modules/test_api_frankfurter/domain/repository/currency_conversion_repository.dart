import 'package:dartz/dartz.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency_conversion.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';

abstract class CurrencyConversionRepository {
  Future<Either<Failure, CurrencyConversion>> getConversion(
      String amount, String from, String to);
}
