import 'package:cricket/model/cricket.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/weather?lat=28.4595&lon=77.0266&appid=e77e558e80f3b53249ddb36c055b14f9
  //https://api.openweathermap.org/data/2.5/weather?q=Gurgaon&appid=e77e558e80f3b53249ddb36c055b14f9
  final String authority = 'api.cricapi.com';
  final String path = 'v1/currentMatches';
  final String apiKey = 'ec922bc2-00e8-48f8-b145-06c9978aef8d';

  Future<Cricket> getWeather(String location) async {
    Map<String, dynamic> parameter = {
      
      'apikey': apiKey
    };

    Uri uri = Uri.https(authority, path, parameter);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    
    for(var it in data["data"]) {
      if(it["teamInfo"][0]["shortname"]==location || it["teamInfo"][1]["shortname"]==location){
      data=it;
      break;}
    }
    Cricket weatherData = Cricket.fromJson(data);
    // print(result.body);
    //return result.body;
    return weatherData;
  }
}
