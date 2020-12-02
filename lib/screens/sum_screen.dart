import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SumScreen extends StatefulWidget {
  @override
  _SumScreenState createState() => _SumScreenState();
}

class _SumScreenState extends State<SumScreen> {
  int _a = 0;
  int _b = 0;
  int _sum = 0;

  Future<void> _calcSum() async {
    const channel = MethodChannel('juniorstaudt.com.br/native');

    try {
      final sum = await channel.invokeMethod('calcSum', {"a": _a, "b": _b});
      setState(() {
        _sum = sum;
      });
    } on PlatformException {
      setState(() {
        _sum = 0;
      });
    }

    setState(() {
      _sum = _a + _b;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Somador nativo"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Resultado: $_sum',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _a = int.tryParse(value) ?? 0;
                  });
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _b = int.tryParse(value) ?? 0;
                  });
                },
              ),
              RaisedButton(
                child: Text('Somar'),
                onPressed: _calcSum,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
