import 'package:geolocator/geolocator.dart';

class MyLocation {
  double latitude = 0, longitude = 0;

  Future<void> getMyCurrentLocation() async {
    // 높은 위치 정확도
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      print(position);
      print('$latitude\n$longitude');
    } catch (e) {
      print('문제가 발생했습니다.');
    }
  }
}
