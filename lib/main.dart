import 'package:flutter/material.dart';
import 'package:quize_project/questionbrain.dart';
import 'package:quize_project/questions.dart';

QuestionBrain questionBrain = QuestionBrain();
void main() => runApp(Quiz());

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userAnswer)
  {
    bool correctAnswer = questionBrain.getCorrectAnswer();
    String result = (correctAnswer == userAnswer ? 'Your answer is correct' : 'Your answer is false');
    print('$result');

    setState(() {
      scoreKeeper.add(
        Icon(
          correctAnswer ? Icons.check : Icons.close,
          color: correctAnswer ? Colors.green : Colors.red,
        ),
      );
      questionBrain.nextQuestion();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                questionBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
