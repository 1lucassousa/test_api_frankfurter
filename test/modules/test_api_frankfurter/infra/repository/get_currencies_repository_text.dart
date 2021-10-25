import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/datasource/currency_datasource.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/repository/get_currencies_repository.dart';

class CurrencyDatasourceMock extends Mock implements CurrencyDatasource {}

main() {
  final datasource = CurrencyDatasourceMock();
  final repository = GetCurrenciesRepositoryImpl(datasource);

  test("Must return a Currencies List", () async {
    when(datasource.getAllCurrencieAvailable())
        .thenAnswer((_) async => <Currency>[]);

    final result = await repository.getAllCurrencieAvailable();

    expect(result | null, isA<List<Currency>>());
  });

  test("Must return a DatasourceError when datasource will failure", () async {
    when(datasource.getAllCurrencieAvailable()).thenThrow(DatasourceError());

    final result = await repository.getAllCurrencieAvailable();

    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
