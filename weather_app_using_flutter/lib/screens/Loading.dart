import 'package:flutter/material.dart';
import 'package:weather_app_using_flutter/data/my_location.dart';
import 'package:weather_app_using_flutter/data/network.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app_using_flutter/screens/weather_screen.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double latitude3 = 0, longitude3 = 0;

  ///앱 실행시 처음으로 수행되머 state 를 초기화하는 메소드.
  ///React 에서 componentDidMount()에서 API 를 호출하듯
  ///여기서 API 를 호출.
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    var apiKey = env['OPEN_WEATHER_API_KEY'];
    MyLocation myLocation = new MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude;
    longitude3 = myLocation.longitude;
    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric');
    var weatherData = await network.getJsonData();
    // print(weatherData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(parseWeatherData: weatherData,);
    }));
  }

  // fetchData() async {
  //
  //     ///json 형태로 디코드, 위 주소속 json 에서 weather 요소는
  //     ///배열이며, 우리가 찾을 정보는 0번 배열에 저장되어있다.
  //     var myJson = parsingData['weather'][0]['description'];
  //     print(myJson);
  //
  //     var wind = parsingData['wind']['speed'];
  //     print(wind);
  //
  //     var id = parsingData['id'];
  //     print(id);
  //   } else
  //     print(response.statusCode);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // getLocation();
          },
          child: Text(
            'Get My Location',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}
