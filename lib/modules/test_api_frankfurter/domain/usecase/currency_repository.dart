import 'package:dartz/dartz.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/repository/currency_repository.dart';

abstract class GetCurrencies {
  Future<Either<Failure, List<Currency>>> call();
}

class GetCurrenciesImpl implements GetCurrencies {
  final CurrencyRepository repository;

  GetCurrenciesImpl(this.repository);

  @override
  Future<Either<Failure, List<Currency>>> call() async {
    return repository.getAllCurrencieAvailable();
  }
}
