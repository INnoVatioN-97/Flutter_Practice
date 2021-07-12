/// 모바일, 데스크탑 등의 여러 플랫폼에서 일관된
/// 디자인을 위해 구글이 제공하는 라이브러리
import 'package:flutter/material.dart';

//플러터의 시작점. main 함수에서
// 제일 처음 뭔가를 불러내 앱의 실행을 이끈다.
void main() => runApp(MyApp());
//runApp 에는 Widget 이 들어간다.

class MyApp extends StatelessWidget {
  final String appTitle = 'BBANTO';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,

      ///home 에 넣을 페이지를 만들때는 항상
      ///StatelessWidget 으로 만들지,
      ///StatefulWidget 으로 만들지 고민해봐야 함.
      ///혹시 상태변화, 모양 등의 뭔가 하나라도 변화가 있는
      ///페이지라면 stateful Widget 을 사용해야 한다.
      home: Grade(title: appTitle),
    );
  }
}

class Grade extends StatelessWidget {
  Grade({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    /// Scaffold : 다양한 요소를 배치하고 그릴 수 있는
    /// 빈 도화지와 같은 역할
    return Scaffold(
      // AppBar 를 제외한 나머지 부분의 배경색
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        // JS 에서 `${}`처럼 쓸 수 있다.
        // 밑줄에 Center 로 감싸는 것과, 그 밑에 두줄은 기능상 차이가 없다.
        // title: Center(child: Text('$title')),
        title: Text('$title'),
        centerTitle: true,
        backgroundColor: Colors.amber[700],
        elevation: 0.0, // 앱바의 그림자 제거(떠있지않게)
      ),

      /// Center 는 대부분 모두 가운데에 정렬을 해주는것 같지만,
      /// 사실 가로축에 대해서만 가운데 정렬을한다.
      /// 그래서 세로축 정렬은 mainAxisAlignment 를 통해 해줘야.
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //하위 children 을 세로축에 대해 정렬할 때 사용.
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/chulgoo.gif'),
                backgroundColor: Colors.white,
                radius: 55.0,
              ),
            ),
            Divider(
              height: 35.0, //Divider 시작되는 가운데 줄로부터 위 30, 아래 30픽셀씩 잡아먹음.
              color: Colors.grey[850],
              thickness: 0.5,
              endIndent: 30.0,
            ),
            Text(
              'Name',
              style: TextStyle(color: Colors.white, letterSpacing: 2.0),
            ),
            //간격 넓히는 빈 박스
            SizedBox(
              height: 5.0,
            ),
            Text(
              'ChulGoo',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              '똘기 LEVEL',
              style: TextStyle(color: Colors.white, letterSpacing: 2.0),
            ),
            //간격 넓히는 빈 박스
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Lv.999',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Ganjang shower',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'K-Jammin hero',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Spit master',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/chulgoo.png'),
                radius: 40.0,
                backgroundColor: Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
