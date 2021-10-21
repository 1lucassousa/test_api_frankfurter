import 'package:dartz/dartz.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currencie.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';

abstract class CurrencieRepository {
  Future<Either<Failure, List<Currencie>>> getAllCurrencieAvailable();
}
