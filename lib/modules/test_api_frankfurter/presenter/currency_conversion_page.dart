import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/controller/currency_controller.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/domain/entities/currency.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/bloc/currency_bloc.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/bloc/dropdown_bloc.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/result_conversion_page.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/state/state.dart'
    as state;

class CurrencyConversionPage extends StatefulWidget {
  const CurrencyConversionPage({Key key}) : super(key: key);

  @override
  _CurrencyConversionPageState createState() => _CurrencyConversionPageState();
}

class _CurrencyConversionPageState extends State<CurrencyConversionPage> {
  final bloc = Modular.get<CurrencyBloc>();
  final dropdownBloc = Modular.get<DropdownBloc>();

  final valuecurrencyController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final blocCurrency = Modular.get<CurrencyBloc>();

  Future request() async {
    return await bloc.mapEventToState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Currency Conversion'),
        ),
        body: FutureBuilder(
          future: Future(request),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data is state.CurrencySuccess) {
              CurrencyController.inicializeCurrencies(
                  (snapshot.data).currencies);
            }

            return Container(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  _textFormField("Amount", controller: valuecurrencyController),
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<List<Currency>>(
                    stream: dropdownBloc.currencysIn,
                    builder: (context, snapshot) {
                      return StreamBuilder<Currency>(
                        stream: dropdownBloc.selectedcurrencyIn,
                        builder: (context, snapshot) {
                          return Container(
                            height: 60,
                            padding: const EdgeInsets.only(
                                top: 4, right: 10, left: 10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(25)),
                            child: DropdownButton(
                              hint: const Text('In'),
                              dropdownColor: Colors.white,
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 16,
                              isExpanded: true,
                              underline: const SizedBox(),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              value: snapshot.data,
                              onChanged: dropdownBloc.selectedCurrencyinEvent,
                              items: CurrencyController.list.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem.abbreviation +
                                      ": " +
                                      valueItem.name),
                                );
                              }).toList(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<List<Currency>>(
                    stream: dropdownBloc.currencysOut,
                    builder: (context, snapshot) {
                      return StreamBuilder<Currency>(
                        stream: dropdownBloc.selectedcurrencyOut,
                        builder: (context, snapshot) {
                          return Container(
                            height: 60,
                            padding: const EdgeInsets.only(
                                top: 4, right: 10, left: 10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(25)),
                            child: DropdownButton(
                              hint: const Text('Out'),
                              dropdownColor: Colors.white,
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 16,
                              isExpanded: true,
                              underline: const SizedBox(),
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              value: snapshot.data,
                              onChanged: dropdownBloc.selectedCurrencyOutEvent,
                              items: CurrencyController.list.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem.abbreviation +
                                      ": " +
                                      valueItem.name),
                                );
                              }).toList(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                      ),
                      child: const Text('Convert'),
                      onPressed: () async {
                        if (valuecurrencyController.text.isEmpty ||
                            !dropdownBloc.valueInHasValue ||
                            !dropdownBloc.valueOutHasValue) {
                          _alert(context, 'You need to enter all fields');
                        } else if (valuecurrencyController.text.contains(',')) {
                          _alert(context,
                              'Amount has invalid character, use period instead of comma');
                        } else if (dropdownBloc.valueIn ==
                            dropdownBloc.valueOut) {
                          _alert(context, 'Values ​​cannot be equal');
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultConversionPage(
                                  amount: valuecurrencyController.text,
                                  from: dropdownBloc.valueIn,
                                  to: dropdownBloc.valueOut),
                            ),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }

  _textFormField(
    String label, {
    TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        labelText: label,
      ),
    );
  }

  _alert(BuildContext context, String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Warning"),
            content: Text(msg),
            actions: <Widget>[
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
