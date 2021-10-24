import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/usecase/currency_conversion_repository.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/state/state.dart';

class CurrencyConversionBloc {
  final GetConversion usecase;

  CurrencyConversionBloc(this.usecase);

  Future mapEventToState(String amount, String from, String to) async {
    final result = await usecase(amount, from, to);

    return result.fold((l) => Error(l), (r) => CurrencyConversionSuccess(r));
  }
}
