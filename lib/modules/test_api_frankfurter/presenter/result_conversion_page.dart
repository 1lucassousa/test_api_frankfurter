import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/controller/currency_controller.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/bloc/currency_conversion_bloc.dart';
import 'package:test_api_frankfurter/modules/test_api_frankfurter/presenter/state/state.dart'
    as state;

class ResultConversionPage extends StatelessWidget {
  const ResultConversionPage(
      {Key key, @required this.amount, @required this.from, @required this.to})
      : super(key: key);

  final String amount;
  final String from;
  final String to;

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<CurrencyConversionBloc>();

    Future request() async {
      return bloc.mapEventToState(amount, from, to);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Conversion'),
      ),
      body: FutureBuilder(
        future: Future(request),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data is state.CurrencyConversionSuccess) {
            CurrencyController.inicializeConversionData(
                (snapshot.data).currencyConversion);
          }

          return Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        const TextSpan(text: 'Amount: '),
                        TextSpan(
                            text: CurrencyController.resultConversion.amount
                                .toString(),
                            style:
                                const TextStyle(fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        const TextSpan(text: 'Base: '),
                        TextSpan(
                            text: CurrencyController.resultConversion.base,
                            style:
                                const TextStyle(fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        const TextSpan(text: 'Date: '),
                        TextSpan(
                            text: CurrencyController.resultConversion.date
                                .toString(),
                            style:
                                const TextStyle(fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        const TextSpan(text: 'Value in '),
                        TextSpan(
                            text: CurrencyController
                                    .resultConversion.rates.abbreviation +
                                ': '),
                        TextSpan(
                            text: CurrencyController
                                .resultConversion.rates.value
                                .toString(),
                            style:
                                const TextStyle(fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
