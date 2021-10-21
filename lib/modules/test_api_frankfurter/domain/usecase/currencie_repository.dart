import 'package:dartz/dartz.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currencie.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/repository/currencie_repository.dart';

abstract class GetCurrencies {
  Future<Either<Failure, List<Currencie>>> call();
}

class GetCurrenciesImpl implements GetCurrencies {
  final CurrencieRepository repository;

  GetCurrenciesImpl(this.repository);

  @override
  Future<Either<Failure, List<Currencie>>> call() async {
    return repository.getAllCurrencieAvailable();
  }
}
