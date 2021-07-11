import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/model/model_movie.dart';
import 'package:netflix_clone/widget/box_slider.dart';
import 'package:netflix_clone/widget/carousel_slider.dart';
import 'package:netflix_clone/widget/circle_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Firestore firestore = Firestore.instance;
  Stream<QuerySnapshot> streamData;


  @override
  void initState() {
    super.initState();
    //스트림에 파이어스토어 DB 속 movie 컬렉션을 스냅샷형태로 넣어준다.
    streamData = firestore.collection('movie').snapshots();
  }

  Widget _fetchData(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
        // stream: Firestore.instance.collection('movie').snapshots(),
      stream: Firestore.instance.collection('movie').snapshots(),
        builder: (context, snapshot){
        //스냅샷에 데이터가 없으면 LinearProgressIndicator 로 로딩화면을 만들어준다.
          //아니면 _buildBody 를 리턴(영화 몸체)
          if(!snapshot.hasData) return LinearProgressIndicator();
          return _buildBody(context, snapshot.data.documents);
        },
    );
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot){
    ///매개변수로 들어온 snapshot list 를 map 함수를 이용해 Movie 모델 형태로 바꾸고,
    /// toList 를 이용해 리스트 형태로 변환해 넣어준다.
    List<Movie> movies = snapshot.map((d) => Movie.fromSnapshot(d)).toList();
    return ListView(
      children: [
        // 기본적으로 Stack 은 LIFO 이므로 맨 처음에 넣은게 밑에 깔린다.
        Stack(
          children: [
            CarouselImage(movies: movies),
            TopBar(),
          ],
        ),
        CircleSlider(movies: movies,),
        BoxSlider(movies: movies,),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'images/netflix_logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
