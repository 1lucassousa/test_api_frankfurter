import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency.dart';
import 'package:dartz/dartz.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/repository/currency_repository.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/datasource/currency_datasource.dart';

class GetCurrenciesRepositoryImpl implements CurrencyRepository {
  final CurrencyDatasource datasource;

  GetCurrenciesRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Currency>>> getAllCurrencieAvailable() async {
    try {
      final result = await datasource.getAllCurrencieAvailable();
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError(e));
    }
  }
}
