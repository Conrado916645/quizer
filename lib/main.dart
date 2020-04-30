import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain  quizBrain = new QuizBrain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreCounter = [];

  Icon answerStatus(bool answer) {
    if (answer) {
      return Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.clear,
        color: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Center(
            child: Text(
              quizBrain.getQuesionText(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text('True'),
              onPressed: () {
                if (quizBrain.getQuesionAnswer() == true)
                  scoreCounter.add(answerStatus(true));
                else
                  scoreCounter.add(answerStatus(false));

                setState(() {
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Text('False'),
              onPressed: () {
                if (quizBrain.getQuesionAnswer()== false)
                  scoreCounter.add(answerStatus(true));
                else
                  scoreCounter.add(answerStatus(false));
                setState(() {
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreCounter,
        ),
      ],
    );
  }
}
