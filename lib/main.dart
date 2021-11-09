import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

//void main(){
//runApp(MyNatural());
//}
void main() => runApp(MyNatural());

class MyNatural extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyNaturalState();
  }
}

class _MyNaturalState extends State<MyNatural> {

  final questions = const [
    {
      'questionText': 'Where\'s your clothes?',
      'responses': [
        'In the Locker',
        'Outside',
        'To my friend',
        'To my House'
      ],
    },
    {
      'questionText': 'How\'s your body?',
      'responses': ['In Shape', 'Fit', 'Very Well', 'Very Good'],
    },
    {
      'questionText': 'who\'s your favourite country music artist?',
      'responses': [
        'Don Williams',
        'Kenny Rogers',
        'Alan Jackson',
        'George Strait'
      ],
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    if (_questionIndex < questions.length){


      print('we have more questions');
    } else {
      print('No more questions');
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext first) {


  //  questions = [];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My Number One App'),
          ),
          body: _questionIndex < questions.length ? Column(
            children: [
              Question(
                questions[_questionIndex]['questionText'],
              ),
              SizedBox(
                height: 40.0,
              ),
          ...(questions[_questionIndex]['responses'] as List<String>).map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList()

            ],
          ) : Center(child: Text: 'You finished') ,
      ),
    );
  }
}
