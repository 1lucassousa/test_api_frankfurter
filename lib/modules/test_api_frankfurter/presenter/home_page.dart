import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/controller/currencie_controller.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/bloc/currencie_bloc.dart';

class HomePage extends StatelessWidget {
  final bloc = Modular.get<CurrencieBloc>();

  Future _request() async {
    return await bloc.mapEventToState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: CurrencieController.list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(CurrencieController.list[index].abbreviation +
                ": " +
                CurrencieController.list[index].name),
          );
        },
      ),
    );
  }
}
