import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String weatherUrl;
  final String airUrl;
  Network(this.weatherUrl, this.airUrl);


  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(weatherUrl);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
  Future<dynamic> getAirData() async {
    http.Response response = await http.get(airUrl);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}
