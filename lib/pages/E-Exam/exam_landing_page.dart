import 'package:flutter/material.dart';
import 'package:school_super_app/components/customContainer.dart';
import 'package:school_super_app/data/data_quiz.dart';
import 'package:school_super_app/pages/E-Exam/examListPage.dart';
import 'package:school_super_app/themes/theme.dart';

class Examlandingpage extends StatelessWidget {
  const Examlandingpage({super.key});

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
              child: GridView.builder(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: Data.categories.length,
                padding: EdgeInsets.all(15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  final category = Data.categories[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ExamListPage(category: category)));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: whiteColor),
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(category.image, style: TextStyle(fontSize: 50),)),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(category.name, style: blackTextStyle,),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )),
      )),
    );
  }
}
