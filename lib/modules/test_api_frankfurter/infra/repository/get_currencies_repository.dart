import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currencie.dart';
import 'package:dartz/dartz.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/repository/currencie_repository.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/datasource/currencie_datasource.dart';

class GetCurrenciesRepositoryImpl implements CurrencieRepository {
  final CurrencieDatasource datasource;

  GetCurrenciesRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Currencie>>> getAllCurrencieAvailable() async {
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
