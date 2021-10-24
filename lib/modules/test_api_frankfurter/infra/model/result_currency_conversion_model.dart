import 'dart:convert';

import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency_conversion.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/model/result_rates_model.dart';

class ResultCurrencyConversionModel extends CurrencyConversion {
  final double amount;
  final String base;
  final String date;
  final ResultRatesModel rates;

  ResultCurrencyConversionModel(
      {this.amount, this.base, this.date, this.rates});

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'base': base,
      'date': date,
      'rates': rates.toMap(),
    };
  }

  factory ResultCurrencyConversionModel.fromMap(Map<String, dynamic> map) {
    return ResultCurrencyConversionModel(
      amount: map['amount'],
      base: map['base'],
      date: map['date'],
      rates: ResultRatesModel.fromMap(map['rates']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultCurrencyConversionModel.fromJson(String source) =>
      ResultCurrencyConversionModel.fromMap(json.decode(source));
}
