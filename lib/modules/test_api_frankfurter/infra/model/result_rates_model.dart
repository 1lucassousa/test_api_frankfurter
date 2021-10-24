import 'dart:convert';

import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/rates.dart';

class ResultRatesModel extends Rates {
  final String abbreviation;
  final double value;

  ResultRatesModel({this.abbreviation, this.value});

  Map<String, dynamic> toMap() {
    return {
      'abbreviation': abbreviation,
      'value': value,
    };
  }

  factory ResultRatesModel.fromMap(Map<String, dynamic> map) {
    String base;
    double toBaseValue;
    map.forEach((key, value) {
      base = key;
      toBaseValue = value;
    });
    return ResultRatesModel(
      abbreviation: base,
      value: toBaseValue,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultRatesModel.fromJson(String source) =>
      ResultRatesModel.fromMap(json.decode(source));
}
