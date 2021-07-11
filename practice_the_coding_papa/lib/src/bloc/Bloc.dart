import 'package:english_words/english_words.dart';
import 'dart:async';

//Bloc Pattern 을 위한 클래스
class Bloc {
  final Set<WordPair> saved = Set<WordPair>();

  final _savedController = StreamController<Set<WordPair>>.broadcast();

  //getter 구현, 아래 세 함수는 동일한 함수이다.
  // Stream<Set<WordPair>> getSavedStream (){
  //   return _savedController.stream;
  // }
  // get getSavedStream {
  //   return _savedController.stream;
  // }
  get savedStream => _savedController.stream;

  // 얘를 부르면 지금 상태의 saved 를 스트림에 한번 보내주기
  get addCurrentSaved => _savedController.sink.add(saved);

  //들어온 아이템이 있으면 삭제 없으면 추가하는 메소드
  addToOrRemoveFromSavedList(WordPair item) {
    if (saved.contains(item)) {
      saved.remove(item);
    } else {
      saved.add(item);
    }
    //변경사항을 컨트롤러에 알려준다(싱크, 동기화)
    _savedController.sink.add(saved);
  }

  // Stream 을 만들어주면 반드시 사용 후에는 dispose(종료)해줘야 한다.
  dispose() {
    _savedController.close();
  }
}

var bloc = Bloc();
