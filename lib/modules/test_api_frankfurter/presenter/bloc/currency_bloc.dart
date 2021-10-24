import 'dart:async';

import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/usecase/currency_repository.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/state/state.dart';

class CurrencyBloc {
  final GetCurrencies usecase;

  CurrencyBloc(this.usecase);

  Future mapEventToState() async {
    final result = await usecase();

    return result.fold((l) => Error(l), (r) => CurrencySuccess(r));
  }
}
