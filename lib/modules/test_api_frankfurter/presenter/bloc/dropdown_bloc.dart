import 'package:rxdart/rxdart.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency.dart';

class DropdownBloc {
  final _selectedCurrencyIn = BehaviorSubject<Currency>();
  final _selectedCurrencyOut = BehaviorSubject<Currency>();

  Stream<Currency> get selectedcurrencyIn => _selectedCurrencyIn;
  Stream<Currency> get selectedcurrencyOut => _selectedCurrencyOut;

  void selectedCurrencyinEvent(Currency currency) =>
      _selectedCurrencyIn.add(currency);

  void selectedCurrencyOutEvent(Currency currency) =>
      _selectedCurrencyOut.add(currency);

  void dispose() {
    _selectedCurrencyIn.close();
    _selectedCurrencyOut.close();
  }

  get valueInHasValue => _selectedCurrencyIn.hasValue;
  get valueOutHasValue => _selectedCurrencyIn.hasValue;

  get valueIn => _selectedCurrencyIn.value.abbreviation;
  get valueOut => _selectedCurrencyOut.value.abbreviation;
}
