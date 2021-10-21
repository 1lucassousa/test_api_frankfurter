import 'package:dio/dio.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currencie.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/datasource/currencie_datasource.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/model/result_currencie_model.dart';

class GetCurrenciesApiDatasource implements CurrencieDatasource {
  final Dio dio;

  GetCurrenciesApiDatasource(this.dio);

  @override
  Future<List<Currencie>> getAllCurrencieAvailable() async {
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
      final result = ResultCurrencieModel.fromMap(response.data);
      return result;
    } else {
      throw DatasourceError();
    }
  }
}
