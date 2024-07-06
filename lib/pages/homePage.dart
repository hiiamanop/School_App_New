import 'package:flutter/material.dart';
import 'package:school_super_app/components/customButton.dart';
import 'package:school_super_app/components/customContainer.dart';
import 'package:school_super_app/pages/E-Book/listKelasPage.dart';
import 'package:school_super_app/pages/E-Exam/exam_landing_page.dart';
import 'package:school_super_app/pages/E-Task/taskLandingPage.dart';
import 'package:school_super_app/pages/calendar/calendarPage.dart';
import 'package:school_super_app/themes/theme.dart';
import 'package:school_super_app/utils/date.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: whiteColor,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(15,10,15,15),
            child: ListView(
              children: [
                // header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    CustomButton(
                      onTap: () {},
                      buttonColor: primaryColor,
                      buttonWidth: 40,
                      buttonHeight: 40,
                      buttonMargin: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image(
                          image: AssetImage("asset/images/akhwat.png"),
                          width: 32,
                        ),
                      ),
                    ),
                    CustomContainer(
                      containerColor: primaryColor,
                      containerWidth: 172,
                      containerHeight: 40,
                      containerMargin: 5,
                      child: DateRow(),
                    ),
                    CustomButton(
                      onTap: () {},
                      buttonColor: whiteColor,
                      buttonWidth: 40,
                      buttonHeight: 40,
                      buttonMargin: 5,
                      child: Icon(
                        Icons.notifications,
                        size: 16.5,
                        color: secondaryColor,
                      ),
                    ),
                    
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

                // Main Banner
                CustomContainer(
                    containerColor: bannerColor,
                    containerWidth: double.infinity,
                    containerHeight: 200,
                    containerMargin: 5,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(23),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Halo 👋',
                                    style: primaryTextStyle.copyWith(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    'Ahmad Naufal Muzakki',
                                    style: primaryTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    'XII IPA 7',
                                    style: primaryTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                              Image(
                                  image: AssetImage('asset/images/medali.png'))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search,
                                  color: greyColor, size: 12),
                              hintText: "Ayoo cari sesuatu disini...",
                              hintStyle: greyTextStyle.copyWith(
                                  fontWeight: FontWeight.w800),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 4.0,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),

                // mata pelajaran
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Mata Pelajaran',
                        style: secondaryTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    child: Row(
                      children: [
                        CustomButton(
                            buttonColor: primaryColor,
                            buttonWidth: 110,
                            buttonHeight: 30,
                            buttonMargin: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '📏 Matematika',
                                  style: blackTextStyle,
                                )
                              ],
                            ),
                            onTap: () {}),
                        SizedBox(
                          width: 5,
                        ),
                        CustomButton(
                            buttonColor: primaryColor,
                            buttonWidth: 100,
                            buttonHeight: 30,
                            buttonMargin: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '🧬 Biologi',
                                  style: blackTextStyle,
                                )
                              ],
                            ),
                            onTap: () {}),
                        SizedBox(
                          width: 5,
                        ),
                        CustomButton(
                            buttonColor: primaryColor,
                            buttonWidth: 100,
                            buttonHeight: 30,
                            buttonMargin: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '⚛️ Fisika',
                                  style: blackTextStyle,
                                )
                              ],
                            ),
                            onTap: () {}),
                        SizedBox(
                          width: 5,
                        ),
                        CustomButton(
                            buttonColor: primaryColor,
                            buttonWidth: 100,
                            buttonHeight: 30,
                            buttonMargin: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '🧪 Kimia',
                                  style: blackTextStyle,
                                )
                              ],
                            ),
                            onTap: () {}),
                        SizedBox(
                          width: 5,
                        ),
                        CustomButton(
                            buttonColor: primaryColor,
                            buttonWidth: 100,
                            buttonHeight: 30,
                            buttonMargin: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '📖 Bahasa',
                                  style: blackTextStyle,
                                )
                              ],
                            ),
                            onTap: () {}),
                        SizedBox(
                          width: 5,
                        ),
                        CustomButton(
                            buttonColor: primaryColor,
                            buttonWidth: 100,
                            buttonHeight: 30,
                            buttonMargin: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '⚖️ PPKN',
                                  style: blackTextStyle,
                                )
                              ],
                            ),
                            onTap: () {}),
                        SizedBox(
                          width: 5,
                        ),
                        CustomButton(
                            buttonColor: primaryColor,
                            buttonWidth: 100,
                            buttonHeight: 30,
                            buttonMargin: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '📚 English',
                                  style: blackTextStyle,
                                )
                              ],
                            ),
                            onTap: () {}),
                        SizedBox(
                          width: 5,
                        ),
                        CustomButton(
                            buttonColor: primaryColor,
                            buttonWidth: 100,
                            buttonHeight: 30,
                            buttonMargin: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Lainnya+',
                                  style: blackTextStyle,
                                )
                              ],
                            ),
                            onTap: () {}),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),

                // Menu Utama
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Menu Utama',
                        style: secondaryTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                              buttonColor: magentaColor,
                              buttonWidth: 60,
                              buttonHeight: 60,
                              buttonMargin: 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.book,
                                    size: 32,
                                    color: whiteColor,
                                  )
                                ],
                              ),
                              onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ListKelasEbook()))),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                'E-Book',
                                style: greyTextStyle,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          CustomButton(
                              buttonColor: orangeColor,
                              buttonWidth: 60,
                              buttonHeight: 60,
                              buttonMargin: 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.task,
                                    size: 32,
                                    color: whiteColor,
                                  )
                                ],
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Tasklandingpage()));
                              }),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                'E-Task',
                                style: greyTextStyle,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          CustomButton(
                              buttonColor: greenColor,
                              buttonWidth: 60,
                              buttonHeight: 60,
                              buttonMargin: 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check,
                                    size: 32,
                                    color: whiteColor,
                                  )
                                ],
                              ),
                              onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Examlandingpage()))),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                'E-Exam',
                                style: greyTextStyle,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          CustomButton(
                              buttonColor: aquaColor,
                              buttonWidth: 60,
                              buttonHeight: 60,
                              buttonMargin: 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    size: 32,
                                    color: whiteColor,
                                  )
                                ],
                              ),
                              onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CalendarPage()))),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                'Kalender',
                                style: greyTextStyle,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),

                // beberapa hari lagi menuju

                CustomContainer(
                    containerColor: whiteColor,
                    containerWidth: double.infinity,
                    containerHeight: 150,
                    containerMargin: 10,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Persiapkan dirimu!!',
                            style: blackTextStyle.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          SizedBox(height: 10,),
                          Text('90', style: redTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 32),),
                          SizedBox(height: 10,),
                          Text('Menuju UAS', style: blackTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400),)
                        ],
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
