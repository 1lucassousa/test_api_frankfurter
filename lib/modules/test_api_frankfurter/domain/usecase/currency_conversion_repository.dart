import 'package:dartz/dartz.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency_conversion.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/repository/currency_conversion_repository.dart';

abstract class GetConversion {
  Future<Either<Failure, CurrencyConversion>> call(
      String amount, String from, String to);
}

class GetConversionImpl implements GetConversion {
  final CurrencyConversionRepository repository;

  GetConversionImpl(this.repository);

  @override
  Future<Either<Failure, CurrencyConversion>> call(
      String amount, String from, String to) async {
    if (amount == null ||
        amount.isEmpty ||
        from.isEmpty ||
        from == null ||
        to.isEmpty ||
        to == null) {
      return Left(InvalidError());
    }

    return repository.getConversion(amount, from, to);
  }
}
