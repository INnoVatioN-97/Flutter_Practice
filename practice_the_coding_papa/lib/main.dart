//Flutter에서 제공하는 Design language를 쓰겠다.
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'src/random_list.dart';

/// Flutter는 lambda식을 =>로 쓴다. (JS와 다름)
/// 또한 플러터는 모든 Component를 Widget이라고 부른다.
/// 기본적으로 Flutter는 Dart라는 언어를 사용.
/// 실행시 제일 먼저 main()이라는 메소드를 찾아 실행한다.
void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RandomList(),
    );
  }

}

