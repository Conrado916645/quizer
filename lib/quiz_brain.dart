import 'question.dart';

class QuizBrain{
  List<Question> _questionList=[
    Question(q: 'Pogi ako.',a: true),
    Question(q: 'Panget ka.',a: false),
    Question(q: 'Pogi sya.',a: true)
  ];

  int _questionNumber = 0;

   void nextQuestion(){
    if(_questionNumber < _questionList.length -1){
      _questionNumber++;
    }
    else{
      _questionNumber = 0;
    }
   }

  String getQuesionText(){
    return _questionList[_questionNumber].questions;
  }

  bool getQuesionAnswer(){
    return _questionList[_questionNumber].answers;
  }
}