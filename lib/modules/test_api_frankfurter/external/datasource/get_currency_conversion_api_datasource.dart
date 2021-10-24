import 'package:dio/dio.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency_conversion.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/datasource/currency_conversion_datasource.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/model/result_currency_conversion_model.dart';

class GetConversionApiDatasource implements CurrencyConversionDatasource {
  final Dio dio;

  GetConversionApiDatasource(this.dio);

  @override
  Future<CurrencyConversion> getConversion(
      String amount, String from, String to) async {
    var url =
        "https://api.frankfurter.app/latest?amount=$amount&from=$from&to=$to";

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
      final result = ResultCurrencyConversionModel.fromMap(response.data);
      return result;
    } else {
      throw DatasourceError();
    }
  }
}
