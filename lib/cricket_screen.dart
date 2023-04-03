import 'package:cricket/model/cricket.dart';
import 'package:cricket/model/http_helper.dart';
import 'package:flutter/material.dart';

class CricketScreen extends StatefulWidget {
  const CricketScreen({Key? key}) : super(key: key);

  @override
  State<CricketScreen> createState() => _CricketScreenState();
}

class _CricketScreenState extends State<CricketScreen> {
  TextEditingController textController = TextEditingController();
  Cricket result = Cricket('', '', "0", "0", '0', '0');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cricket Score'),
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                        hintText: 'Enter Team Name',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: getData,
                        )),
                  ),
                ),
                weatherRow('Place: ', result.name),
                weatherRow('Match Type: ', result.matchType),
                weatherRow('Status: ', result.status),
                weatherRow('Venue: ', result.venue),
                weatherRow('Date: ', result.date),
                // weatherRow('Humidity: ', result.humidity.toStringAsFixed(2)),
              ],
            )));
  }

  Future getData() async {
    HttpHelper httpHelper = HttpHelper();
    result = await httpHelper.getWeather(textController.text);
    setState(() {
      result;
    });
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                label,
                style:
                    TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
              )),
          Expanded(
              flex: 4,
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).primaryColor),
              )),
        ],
      ),
    );
    return row;
  }
}
