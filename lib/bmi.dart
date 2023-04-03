import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Bmi extends StatefulWidget {
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final TextEditingController inp1 = new TextEditingController();
  final TextEditingController inp2 = new TextEditingController();
  double _result = 0;

  double CalculateBmi(double height, double weight) {
    double heiMeter = height / 100;
    double bmi = weight / (heiMeter * heiMeter);
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          TextField(
            controller: inp1,
            decoration: InputDecoration(
              hintText: 'Height (in CentiMeters)',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: inp2,
            decoration: InputDecoration(
              hintText: 'Weight (in KG)',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                _result = (CalculateBmi(
                    double.parse(inp1.text), double.parse(inp2.text)));
                setState(() {});
              },
              child: Text('Calculate')),
          SizedBox(
            height: 20,
          ),
          Text(
            _result == 0 ? "Result" : "BMI : ${_result.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
