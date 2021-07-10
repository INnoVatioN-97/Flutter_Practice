import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'saved.dart';

// 상태가 변하는 위젯들은 StatefulWidget
// 상태가 변하지 않는 위젯들은 StatelessWidget
/// 여러 랜덤 단어값들이 담긴 List 형 클래스 _RandomListState를
/// RandomList 에서 return 해준다.
class RandomList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RandomListState();
}

class _RandomListState extends State<RandomList> {
  //Set : 중복 없는 집합, List : 중복 허용
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Namging App")),
        actions: [
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SavedList(saved: _saved)));
              })
        ],
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return (ListView.builder(itemBuilder: (context, index) {
      /// 인덱스 0, 2, 4, 6 : 진짜 아이템
      /// 인덱스 1, 3, 5, 7 : 아이템을 나누는 선(Dividers)
      if (index.isOdd) {
        return Divider();
      }
      //index 를 2로 나눈 몫을 realIndex 라는 변수에 저장.
      var realIndex = index ~/ 2;
      if (realIndex >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[realIndex]);
    }));
  }

  Widget _buildRow(WordPair pair) {
    // 눌린 단어가 이미 있는지를 판별하기 위한 bool 변수
    final bool alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        textScaleFactor: 1.5,
      ),
      trailing: Icon(
        //삼항 연산자가 가능하다.
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: Colors.pink,
      ),
      onTap: () {
        ///상태변화가 생기면 setState 를 통해 이를 반영시킨다.
        ///즉, 다시 렌더링하면서 갱신.
        setState(() {
          //_saved 라는 Set 에 단어들이 들어있지 않으면 추가, 있으면 제거
          if (alreadySaved)
            _saved.remove(pair);
          else
            _saved.add(pair);
          print(_saved.toSet());
        });
      },
    );
  }
}
