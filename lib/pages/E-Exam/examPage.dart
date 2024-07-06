import 'package:flutter/material.dart';
import 'package:school_super_app/components/customContainer.dart';
import 'package:school_super_app/model/model_quiz.dart';
import 'package:school_super_app/pages/E-Exam/result_page.dart';
import 'package:school_super_app/themes/theme.dart';

class ExamPage extends StatefulWidget {
  final QuizSet quizSet;

  const ExamPage({super.key, required this.quizSet});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  int currentQuestionIndex = 0;
  List<int?> selectedAnswer = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedAnswer = List<int?>.filled(widget.quizSet.questions.length, null);
  }

  void goToNextQuestion() {
    if (currentQuestionIndex < widget.quizSet.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  void goToPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Question currentQuestion =
        widget.quizSet.questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('E-exam', style: blackTextStyle,),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: CustomContainer(
            containerColor: whiteColor,
            containerWidth: double.infinity,
            containerHeight: MediaQuery.of(context).size.height * 0.78,
            containerMargin: 5,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentQuestion.question,
                      style: blackTextStyle.copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ...currentQuestion.options.asMap().entries.map((entry) {
                      final index = entry.key;
                      final option = entry.value;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedAnswer[currentQuestionIndex] = index;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color:
                                  selectedAnswer[currentQuestionIndex] == index
                                      ? bannerColor
                                      : whiteColor,
                              border: Border.all(
                                width: 2,
                                color: selectedAnswer[currentQuestionIndex] ==
                                        index
                                    ? bannerColor
                                    : greyColor,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            option,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: selectedAnswer[currentQuestionIndex] ==
                                        index
                                    ? whiteColor
                                    : blackColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        currentQuestionIndex > 0
                            ? ElevatedButton(
                                onPressed: goToPreviousQuestion,
                                child: Text(
                                  'Back',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ))
                            : SizedBox(),
                        ElevatedButton(
                            onPressed: () {
                              if (currentQuestionIndex <
                                  widget.quizSet.questions.length - 1) {
                                goToNextQuestion();
                              } else {
                                int totalCorrect = 0;
                                for (int i = 0;
                                    i < widget.quizSet.questions.length;
                                    i++) {
                                  if (selectedAnswer[i] ==
                                      widget
                                          .quizSet.questions[i].selectedIndex) {
                                    totalCorrect++;
                                  }
                                }
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(
                                  totalQuestions: widget.quizSet.questions.length,
                                  totalAttempts: widget.quizSet.questions.length,
                                  totalCorrect: totalCorrect,
                                  totalScore: totalCorrect * 10,
                                  quizSet: widget.quizSet,
                                )));
                              }
                            },
                            child: Text(
                              currentQuestionIndex ==
                                      widget.quizSet.questions.length - 1
                                  ? "Submit"
                                  : "Next",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
