import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency_conversion.dart';
import 'package:dartz/dartz.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/repository/currency_conversion_repository.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/datasource/currency_conversion_datasource.dart';

class GetConversionRepositoryImpl implements CurrencyConversionRepository {
  final CurrencyConversionDatasource datasource;

  GetConversionRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, CurrencyConversion>> getConversion(
      String amount, String from, String to) async {
    try {
      final result = await datasource.getConversion(amount, from, to);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError(e));
    }
  }
}
