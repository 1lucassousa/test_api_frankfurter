import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency_conversion.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/error/error.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/repository/currency_conversion_repository.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/usecase/currency_conversion_repository.dart';

class CurrencyConversionRepositoryMock extends Mock
    implements CurrencyConversionRepository {}

main() {
  final repository = CurrencyConversionRepositoryMock();

  final usecase = GetConversionImpl(repository);

  test("Must return Conversion Data", () async {
    when(repository.getConversion(any, any, any))
        .thenAnswer((_) async => Right(CurrencyConversion()));

    final result = await usecase("1", "USD", "BRL");

    expect(result | null, isA<CurrencyConversion>());
  });

  test("Must return a Failure when parameters is null", () async {
    when(repository.getConversion(any, any, any))
        .thenAnswer((_) async => Right(CurrencyConversion()));

    final result = await usecase(null, null, null);
    expect(result.fold(id, id), isA<Failure>());
  });
}
