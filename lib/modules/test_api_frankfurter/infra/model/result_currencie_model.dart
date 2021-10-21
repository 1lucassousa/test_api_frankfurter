import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currencie.dart';

class ResultCurrencieModel extends Currencie {
  final String abbreviation;
  final String name;

  ResultCurrencieModel({this.abbreviation, this.name});

  Map<String, dynamic> toMap() {
    return {
      'abbreviation': abbreviation,
      'name': name,
    };
  }

  static List<ResultCurrencieModel> fromMap(Map<String, dynamic> map) {
    List<ResultCurrencieModel> list = [];
    map.forEach((key, value) {
      list.add(ResultCurrencieModel(abbreviation: key, name: value));
    });
    return list;
  }
}
