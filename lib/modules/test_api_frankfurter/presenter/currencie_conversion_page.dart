import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/controller/currencie_controller.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/bloc/currencie_bloc.dart';

class CurrencieConversionPage extends StatefulWidget {
  const CurrencieConversionPage({Key key}) : super(key: key);

  @override
  _CurrencieConversionPageState createState() =>
      _CurrencieConversionPageState();
}

class _CurrencieConversionPageState extends State<CurrencieConversionPage> {
  final bloc = Modular.get<CurrencieBloc>();

  final valueCurrencieController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String valueIn;
  String valueOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Conversion'),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          _textFormField("Value Currencie",
              controller: valueCurrencieController),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 59,
            padding: const EdgeInsets.only(top: 4, right: 10, left: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
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
              value: valueIn,
              onChanged: (newValue) {
                setState(() {
                  valueIn = newValue;
                });
              },
              items: CurrencieController.list.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem.abbreviation,
                  child: Text(valueItem.abbreviation + ": " + valueItem.name),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 59,
            padding: const EdgeInsets.only(top: 4, right: 10, left: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
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
              value: valueOut,
              onChanged: (newValue) {
                setState(() {
                  valueOut = newValue;
                });
              },
              items: CurrencieController.list.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem.abbreviation,
                  child: Text(valueItem.abbreviation + ": " + valueItem.name),
                );
              }).toList(),
            ),
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
              onPressed: () async {},
            ),
          )
        ],
      ),
    );
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
}
