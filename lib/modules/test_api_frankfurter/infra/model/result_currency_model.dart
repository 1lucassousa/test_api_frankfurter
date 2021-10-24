import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency.dart';

class ResultCurrencyModel extends Currency {
  final String abbreviation;
  final String name;

  ResultCurrencyModel({this.abbreviation, this.name});

  Map<String, dynamic> toMap() {
    return {
      'abbreviation': abbreviation,
      'name': name,
    };
  }

  static List<ResultCurrencyModel> fromMap(Map<String, dynamic> map) {
    List<ResultCurrencyModel> list = [];
    map.forEach((key, value) {
      list.add(ResultCurrencyModel(abbreviation: key, name: value));
    });
    return list;
  }
}
