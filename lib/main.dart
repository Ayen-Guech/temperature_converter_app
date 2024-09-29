//import 'package:flutter/material.dart';

//void main() {
 // runApp(const MyApp());



//}


import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConversionApp());
}

class TemperatureConversionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Conversion App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();

}

class _TemperatureConverterState extends State<TemperatureConverter> {
  String? _conversionType = 'F to C';
  final TextEditingController _tempController = TextEditingController();
  String _result = '';
  List<String> _history = [];

  void _convertTemperature() {
    final String input = _tempController.text;
    if (input.isEmpty) return;

    double temperature = double.tryParse(input) ?? 0;

    String conversionResult;

    if (_conversionType == 'F to C') {
      double celsius = (temperature - 32) * 5 / 9;
      conversionResult = '${temperature.toStringAsFixed(2)} °F => ${celsius.toStringAsFixed(2)} °C';
    } else {
      double fahrenheit = (temperature * 9 / 5) + 32;
      conversionResult = '${temperature.toStringAsFixed(2)} °C => ${fahrenheit.toStringAsFixed(2)} °F';
    }

    setState(() {
      _result = conversionResult;
      _history.add(conversionResult);
    });

    _tempController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Temperature Converter' )),
      backgroundColor: Colors.lightBlue[50], // Background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: 'F to C',
                  groupValue: _conversionType,
                  onChanged: (value) {
                    setState(() {
                      _conversionType = value;
                    });
                  },
                ),
                const Text('Fahrenheit to Celsius'),
                Radio<String>(
                  value: 'C to F',
                  groupValue: _conversionType,
                  onChanged: (value) {
                    setState(() {
                      _conversionType = value;
                    });
                  },
                ),
                const Text("Celsius to Fahrenheit", style: TextStyle(fontSize: 18)),
              ],
            ),
            TextField(
              controller: _tempController,
              keyboardType: TextIn30putType.number,
              decoration: const InputDecoration(
                labelText: 'Enter temperature',
              ),
              style: const TextStyle(fontSize: 20), // Increased font size
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(height: 20),
            ),
            ElevatedButton(
              onPressed: _convertTemperature,
              child: const Text('Convert', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            Text(
              'Result: $_result',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            const Text(
              'History:',
              style: TextStyle(fontSize: 22),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_history[index], style: const TextStyle(fontSize: 18)), // Increased font size
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}





