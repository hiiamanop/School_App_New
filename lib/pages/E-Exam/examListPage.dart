import 'package:flutter/material.dart';
import 'package:school_super_app/components/customButton.dart';
import 'package:school_super_app/components/customContainer.dart';
import 'package:school_super_app/model/model_quiz.dart';
import 'package:school_super_app/pages/E-Exam/examPage.dart';
import 'package:school_super_app/themes/theme.dart';

class ExamListPage extends StatelessWidget {
  final QuizCategory category;
  const ExamListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          'E-Exam',
          style: blackTextStyle,
        ),
      ),
      body: Container(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: CustomContainer(
            containerColor: bgColor,
            containerWidth: double.infinity,
            containerHeight: MediaQuery.of(context).size.height * 0.78,
            containerMargin: 5,
            child: Padding(
                padding: EdgeInsets.all(12),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: category.quizSets.length,
                    itemBuilder: (context, index) {
                      final QuizSet = category.quizSets[index];
                      return Padding(
                        padding: EdgeInsets.all(12),
                        child: CustomButton(
                            buttonColor: whiteColor,
                            buttonWidth: double.infinity,
                            buttonHeight: 40,
                            buttonMargin: 10,
                            child: Row(
                              children: [
                                Text(
                                  category.image,
                                  style: TextStyle(fontSize: 50),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  QuizSet.name,
                                  style: blackTextStyle.copyWith(fontSize: 16),
                                )
                              ],
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ExamPage(quizSet: QuizSet,)));
                            }),
                      );
                    }))),
      )),
    );
  }
}
