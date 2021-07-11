import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'bloc/Bloc.dart';

/// 굳이 손으로 class Save extends St... 라고 쓰기보다
/// stful, stless 라고 치고 엔터 하면
/// 알아서 잘 자동완성 시켜준다. 유용하게 쓰자.
class SavedList extends StatefulWidget {
  @override
  _SavedListState createState() => _SavedListState();
}

class _SavedListState extends State<SavedList> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text("Saved")
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return StreamBuilder<Set<WordPair>>(
      stream: bloc.savedStream,
      builder: (context, snapshot) {
        var saved = Set<WordPair>();

        if(snapshot.hasData) saved.addAll(snapshot.data);
        else bloc.addCurrentSaved;

        return ListView.builder(
            itemCount: saved.length * 2,
            itemBuilder: (context, index) {
              if (index.isOdd) return Divider();

              var realIndex = index ~/ 2;

              return _buildRow(saved.toList()[realIndex]);

              ///saved 는 Set 이라 a[5] 이렇게 안됨.
              ///그래서 toList()로 List 화 한 다음 return
            });
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        textScaleFactor: 1.5,
      ),
      onTap: () {
        bloc.addToOrRemoveFromSavedList(pair);
      },
    );
  }
}
