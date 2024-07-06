import 'package:flutter/material.dart';
import 'package:school_super_app/components/customContainer.dart';
import 'package:school_super_app/model/model_quiz.dart';
import 'package:school_super_app/pages/E-Exam/examPage.dart';
import 'package:school_super_app/pages/homePage.dart';
import 'package:school_super_app/themes/theme.dart';

class ResultPage extends StatelessWidget {
  final int totalQuestions;
  final int totalAttempts;
  final int totalCorrect;
  final int totalScore;
  final QuizSet quizSet;

  const ResultPage(
      {super.key,
      required this.totalQuestions,
      required this.totalAttempts,
      required this.totalCorrect,
      required this.totalScore,
      required this.quizSet});

  @override
  Widget build(BuildContext context) {
    String feedback = totalScore < 30
        ? 'you failed'
        : totalScore < 60
            ? 'Good!!'
            : totalScore < 80
                ? 'Great'
                : 'Awesome';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hasil',
          style: blackTextStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: CustomContainer(
            containerColor: whiteColor,
            containerWidth: double.infinity,
            containerHeight: MediaQuery.of(context).size.height * 0.4,
            containerMargin: 5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Nilai Mu"),
                  Text(
                    feedback,
                    style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("${totalScore} / ${totalQuestions  * 10}"),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: CustomContainer(
                        containerColor: whiteColor,
                        containerWidth: 100,
                        containerHeight: 50,
                        containerMargin: 5,
                        child: Center(
                          child: Text('Beranda', style: blackTextStyle,),
                        )),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
