import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DiceGamePage(),
  ));
}

class DiceGamePage extends StatefulWidget {
  const DiceGamePage({Key? key}) : super(key: key);

  @override
  _DiceGamePageState createState() => _DiceGamePageState();
}

class _DiceGamePageState extends State<DiceGamePage> {
  var _score=0;
  var _highestScore=0;
  var _diceSum=0;

  var _index1 = 0;
  var _index2 = 0;






  bool _isGameOver = false;
  final _random = Random.secure();

  final _diceList = <String>[
    'pics/d1.png',
    'pics/d2.png',
    'pics/d3.png',
    'pics/d4.png',
    'pics/d5.png',
    'pics/d6.png',



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dice Game'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Score:$_score',
                style:TextStyle(fontSize: 30),
              ),
              Text('Highest Score:$_highestScore',
                style:TextStyle(fontSize: 30),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(_diceList[_index1],height: 100,width: 100,),
                  Image.asset(_diceList[_index2],height: 100,width: 100,),
                ],
              ),
              Text('Dice sum:$_diceSum',
                style:TextStyle(fontSize: 20),
              ),
              if(_isGameOver)  Text('Game over',
                style:TextStyle(fontSize: 20,color:Colors.red),

              ),
              ElevatedButton(
                child:Text('Roll'),
                onPressed: _rollTheDice,
              ),

              ElevatedButton(
                child:Text('Reset'),
                onPressed: _reset,
              ),
            ],


          ),

        ));
  }

  void _rollTheDice() {
    setState(() {
      _index1 = _random.nextInt(6);
      _index2 = _random.nextInt(6);
      _score += _index1 + _index2 + 2;

      _diceSum = _index1 + _index2 + 2;
      if (_diceSum == 7) {
        _isGameOver = true;
      }
      else if(_score>_highestScore){
        _highestScore = _score;
      }



      else {
        _score += _index1 + _index2 + 2;
      }


    });
  }








  void _reset() {
    setState(() {
      _diceSum=0;
      _score=0;
      _highestScore=0;
      _isGameOver = false;
    });
  }
}
