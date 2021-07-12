/// 모바일, 데스크탑 등의 여러 플랫폼에서 일관된
/// 디자인을 위해 구글이 제공하는 라이브러리
import 'package:flutter/material.dart';

//플러터의 시작점. main 함수에서
// 제일 처음 뭔가를 불러내 앱의 실행을 이끈다.
void main() => runApp(MyApp());
//runApp 에는 Widget 이 들어간다.

class MyApp extends StatelessWidget {
  final String title = 'First App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      //기본적인 테마를 잡아준다.
      theme: ThemeData(
        //Swatch:견본
        primarySwatch: Colors.blue,
      ),

      ///home 에 넣을 페이지를 만들때는 항상
      ///StatelessWidget 으로 만들지,
      ///StatefulWidget 으로 만들지 고민해봐야 함.
      ///혹시 상태변화, 모양 등의 뭔가 하나라도 변화가 있는
      ///페이지라면 stateful Widget 을 사용해야 한다.
      home: MyHomePage(
        title: title,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    /// Scaffold : 다양한 요소를 배치하고 그릴 수 있는
    /// 빈 도화지와 같은 역할
    return Scaffold(
      appBar: AppBar(
        // JS 에서 `${}`처럼 쓸 수 있다.
        title: Text('$title'),
      ),
      body: Center(
        child: Column(
          /// Column = 당연히 여러 요소가 들어갈 것이다
          /// = children:[]을 사용해 여러 요소를 넣을 수 있다.
          children: [
            Text('Hello'),
            Text('Hello'),
            Text('Hello'),
          ],
        ),
      ),
    );
  }
}
