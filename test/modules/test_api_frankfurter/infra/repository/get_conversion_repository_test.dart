import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency_conversion.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/datasource/currency_conversion_datasource.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/repository/get_conversion_repository.dart';

class ConversionDatasourceMock extends Mock
    implements CurrencyConversionDatasource {}

main() {
  final datasource = ConversionDatasourceMock();
  final repository = GetConversionRepositoryImpl(datasource);

  test("Must return a Conversion Data", () async {
    when(datasource.getConversion(any, any, any))
        .thenAnswer((_) async => CurrencyConversion());

    final result = await repository.getConversion("1", "USD", "BRL");

    expect(result | null, isA<CurrencyConversion>());
  });

  test("Must return a DatasourceError when datasource will failure", () async {
    when(datasource.getConversion(any, any, any)).thenThrow(DatasourceError());

    final result = await repository.getConversion("1", "USD", "BRL");

    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
