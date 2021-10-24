import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/repository/currency_repository.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/usecase/currency_repository.dart';

class CurrencieRepositoryMock extends Mock implements CurrencyRepository {}

main() {
  final repository = CurrencieRepositoryMock();

  final usecase = GetCurrenciesImpl(repository);

  test("Must return all Currencies Available", () async {
    when(repository.getAllCurrencieAvailable())
        .thenAnswer((_) async => const Right(<Currency>[]));

    final result = await usecase();

    expect(result | null, isA<List<Currency>>());
  });
}
