import 'package:custom_progress_dialog/custom_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/controller/currencie_controller.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/bloc/currencie_bloc.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/currencie_conversion_page.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/state/state.dart'
    as state;

class HomePage extends StatelessWidget {
  final ProgressDialog _progressDialog = ProgressDialog();

  final bloc = Modular.get<CurrencieBloc>();

  Future _request() async {
    return await bloc.mapEventToState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            _progressDialog.showProgressDialog(context);

            var result = await _request();

            if (result is state.CurrencieSuccess) {
              _progressDialog.dismissProgressDialog(context);

              CurrencieController.inicialize((result).currencies);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CurrencieConversionPage(),
                ),
              );
            }
          },
          child: const Text('Currency Conversion'),
        ),
      ),
    );
  }
}
