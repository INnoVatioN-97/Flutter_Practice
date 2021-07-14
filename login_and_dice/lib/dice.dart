import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart/';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1, rightDice = 1;

  getRandomNum() {
    while (true) {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
      if (leftDice != rightDice) break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text('Dice Game')),
      ),
      body: Center(
          child: Column(
        // Column(열) 에서의 주 축: 세로축 = 세로축에 대해 가운데 정렬됨.
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(32),
            child: Row(
              // Row(행) 에서의 주 축: 가로축 = 가로축에 대해 가운데 정렬됨.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  // flex: 2, // 2대1의 비율이 나타남(아래와 더불어)
                  child: Image.asset('images/dice$leftDice.png'),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  // flex: 1,
                  child: Image.asset('images/dice$rightDice.png'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          ButtonTheme(
              minWidth: 100,
              height: 60,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    // leftDice = Random().nextInt(6) + 1;
                    // rightDice = Random().nextInt(6) + 1;
                    getRandomNum();
                  });
                  showToast("Left dice : {$leftDice}, Right dice: {$rightDice}");
                },
                color: Colors.orangeAccent,
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
              )),
        ],
      )),
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
