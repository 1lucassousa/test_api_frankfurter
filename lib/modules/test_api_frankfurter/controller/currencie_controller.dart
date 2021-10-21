import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currencie.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/infra/model/result_currencie_model.dart';

class CurrencieController {
  static List<ResultCurrencieModel> list;

  static inicialize(data) {
    list = data;
  }
}
