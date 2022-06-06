import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Product {
  final String name;
  final double price;
  Product(this.name, this.price);
}

final products = [
  Product("Wireless mouse", 3),
  Product("keyboard", 5),
  Product("Camera", 8),
  Product("Speaker", 4),
  Product("Ipad", 10),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentProductIndex = 0;
  int? _inputtedPrice;
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 80)),
            Text(products[_currentProductIndex].name),
            SizedBox(
              width: 200,
              child: TextField(
                key: const Key('priceInput'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) => {_inputtedPrice = int.tryParse(value)},
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _result =
                      _inputtedPrice == products[_currentProductIndex].price
                          ? 'pass'
                          : 'fail';
                });
              },
              child: const Text("Verify"),
            ),
            Visibility(
                visible: _result.isNotEmpty,
                child: Text(_result, key: const Key('result'))),
            Visibility(
              visible: _result.isNotEmpty,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _result = '';
                      if (_currentProductIndex < 4) {
                        _currentProductIndex++;
                      }
                    });
                  },
                  child: const Text("next")),
            )
          ],
        ),
      ),
    );
  }
}
