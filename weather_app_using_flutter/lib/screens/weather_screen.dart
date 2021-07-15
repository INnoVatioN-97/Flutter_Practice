import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData});

  final parseWeatherData;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String cityName = "";
  int temp = 0;

  @override
  void initState() {
    super.initState();
    updateData(widget.parseWeatherData);
  }

  updateData(dynamic weatherData) {
    ///json 형태로 디코드, 위 주소속 json 에서 weather 요소는
    ///배열이며, 우리가 찾을 정보는 0번 배열에 저장되어있다.

    temp = weatherData['main']['temp'].round();
    // temp = temp2.round();
    cityName = weatherData['name'];

    print('temp : $temp\ncityName : $cityName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'image/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),


          ],
        ),
      ),
    );
  }
}
