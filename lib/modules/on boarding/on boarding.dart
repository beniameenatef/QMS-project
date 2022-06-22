
import 'package:design_ui/constant/colors.dart';
import 'package:design_ui/modules/login/login.dart';
import 'package:design_ui/modules/on%20boarding/classes.dart';
import 'package:design_ui/shared/shared%20preference.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingScrean extends StatelessWidget {
  List<boardingmodel> boarding = [
    boardingmodel(
      image: 'assets/image/factualylogo.png',
      text: "َنظام ادارة الجودة " "QMS",
      body: "تطبيق لتسهيل ادارة الجودة والتعامل معها ",
    ),
    boardingmodel(
      image: 'assets/image/image1.jpeg',
      text: ' تحويل النظام الورقي الي الكتروني',
      body: '''أضافة وتعديل ومسح البيانات في الجداول\n تسهيل التعامل مع البيانات وعرضها بشكل سلس ''',
      body2: '',


    ),
    boardingmodel(
        image: 'assets/image/image2.jpeg',
        text: 'صلاحيات الادمن',
        body:
        "جميع خدمات التطبيق له الصلاحيه التحكم فيها  وله صلاحية عمل creators للتعديل والاضافة علي بعض الجداول الذي يعطيله الصلاحية للتعديل عليها ",
        ),
    boardingmodel(
        image: 'assets/image/task.jpeg',
        text: 'صلاحيات المستخدم',
        body:
        " له الصلاحية علي التحكم في بعض الجدوال المحدده له من قبل الادمن \n يمكنه رؤيه ذلك الجداول والتعديل عليها فقط عندما يجعله الادمن creator "),
    boardingmodel(
        image: 'assets/image/task2.jpeg',
        text: 'صلاحيات  Visitor ',
        body: " له الصلاحية علي رؤية الصفحه الرئيسية واحصائيات الجودة فقط"),
  ];
  var boardcontroller = PageController();
  bool islast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        // title: Text('hello=>'),
        actions: [
          TextButton(
            onPressed: () {
              cachehelper
                  .savedata(key: 'onboarding', value: true)
                  .then((value) {
                if (value) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => loginqualityapp()));
                }
              });
            },
            child: const Padding(
              padding: EdgeInsetsDirectional.only(end: 20),
              child: Text(
                'Skip',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) =>
                  buildBoardingItem(boarding[index]),
              itemCount: boarding.length,
              controller: boardcontroller,
              physics: BouncingScrollPhysics(),
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  islast = true;
                } else {
                  islast = false;
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: boardcontroller,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    activeDotColor: AppColors.orange,
                    spacing: 5,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: AppColors.blue,
                  onPressed: () {
                    boardcontroller.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                    if (islast) {
                      cachehelper
                          .savedata(key: 'onboarding', value: true)
                          .then((value) {
                        if (value) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginqualityapp()),
                          );
                        }
                      });
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // void navigateandfinish(context,widget)=>Navigator.pushAndRemoveUntil(context,
  //     MaterialPageRoute(builder: (context) => loginsocialapp()),
  //         (Route<dynamic>route) => false);

  Widget buildBoardingItem(boardingmodel model) => Column(
    children: [
      Image(
        image: AssetImage('${model.image}'),
        width: 300,
        height: 350,
      ),
      Spacer(),
      Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 20, end: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${model.text}',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: AppColors.blue,
                    )),
                SizedBox(height: 10),
                Text('${model.body}',
                    textDirection: TextDirection.rtl,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.values.first,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.black,

                    )),
              ],
            ),
          )),
      // SizedBox(
      //   height: 10,
      // ),
    ],
  );
}