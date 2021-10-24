import 'package:dio/dio.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/datasource/currency_datasource.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/model/result_currency_model.dart';

class GetCurrenciesApiDatasource implements CurrencyDatasource {
  final Dio dio;

  GetCurrenciesApiDatasource(this.dio);

  @override
  Future<List<Currency>> getAllCurrencieAvailable() async {
    var url = "https://api.frankfurter.app/currencies";

    var response = await dio.get(
      url,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status <= 500;
        },
      ),
    );

    if (response.statusCode == 200) {
      final result = ResultCurrencyModel.fromMap(response.data);
      return result;
    } else {
      throw DatasourceError();
    }
  }
}
