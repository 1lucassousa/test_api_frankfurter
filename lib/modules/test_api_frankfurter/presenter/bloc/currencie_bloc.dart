import 'dart:async';

import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/usecase/currencie_repository.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/state/state.dart';

class CurrencieBloc {
  final GetCurrencies usecase;

  CurrencieBloc(this.usecase);

  Future mapEventToState() async {
    final result = await usecase();

    return result.fold((l) => Error(l), (r) => CurrencieSuccess(r));
  }

}
