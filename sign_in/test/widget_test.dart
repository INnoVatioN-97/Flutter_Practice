import 'dart:io'; //소켓, HTTP 통신시 사용

void main() {
  showData();
}

void showData() async{
  startTask();
  fetchData(await accessData());
}

 startTask() {
  String info1 = '요청 수행 시작';
  print(info1);
}

Future<String> accessData() async{
  String account="";

  Duration time = Duration(seconds: 3);
  // sleep(time);
  // String info2 = '데이터 접속중...';
  // print(info2);
  if (time.inSeconds > 2) {
    // sleep(time);
    await Future.delayed(time, () {
      account = '8500만원';
      print(account);
    });
    // String info2 = '데이터 처리 완료.';
    // print(info2);
  } else {
    String info2 = '데이터를 가져왔습니다.';
    print(info2);
  }
  return account;
}

fetchData(String account) {
  String info3 = '잔액은 $account입니다.';
  print(info3);
}
