import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currencie.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/repository/currencie_repository.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/usecase/currencie_repository.dart';

class CurrencieRepositoryMock extends Mock implements CurrencieRepository {}

main() {
  final repository = CurrencieRepositoryMock();

  final usecase = GetCurrenciesImpl(repository);

  test("Must return all Currencies Available", () async {
    when(repository.getAllCurrencieAvailable())
        .thenAnswer((_) async => const Right(<Currencie>[]));

    final result = await usecase();

    expect(result | null, isA<List<Currencie>>());
  });
}
