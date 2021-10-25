import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/external/datasource/get_currency_conversion_api_datasource.dart';

main() {
  final dio = Dio();

  final datasource = GetConversionApiDatasource(dio);

  test("Must return all Currencies Available when request success complete",
      () async {
    final future = datasource.getConversion('10', 'USD', 'BRL');

    expect(future, completes);
  });
}
