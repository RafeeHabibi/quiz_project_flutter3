import 'package:quize_project/questions.dart';

class QuestionBrain
{
  int _questionNumber = 0;

  List<Question> _questions = [
    Question(question: 'The Earth orbits around the Sun.', answer: true),
    Question(question: 'Dogs are a type of reptile.', answer: false),
    Question(question: 'Oxygen is necessary for human survival.', answer: true),
    Question(question: 'The Earth orbits around the Sun.', answer: true),
    Question(question: 'Dogs are a type of reptile.', answer: false),
    Question(question: 'Oxygen is necessary for human survival.', answer: true),
  ];

  String getQuestionText()
  {
    return _questions[_questionNumber].question;
  }
  bool getCorrectAnswer()
  {
    return _questions[_questionNumber].answer;
  }
  void nextQuestion()
  {
    if(_questionNumber < _questions.length - 1)
    {
      _questionNumber++;
    }
    else
    {
      _questionNumber = 0;
    }
  }
}