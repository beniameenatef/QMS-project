// import 'package:design_ui/constant/colors.dart';
// import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D8%A7%D8%A8%D8%AD%D8%A7%D8%AB.dart';
// import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D8%A7%D8%B3%D8%AA%D8%B7%D9%84%D8%A7%D8%B9%D8%A7%D8%AA.dart';
// import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D8%A8%D8%B1%D8%AA%D9%88%D9%83%D9%88%D9%84.dart';
// import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D8%B9%D8%A7%D9%85%20%D8%A7%D9%84%D8%A7%D9%83%D8%A7%D8%AF%D9%8A%D9%85%D9%8A.dart';
// import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D9%85%D9%83%D8%AA%D8%A8%D8%A9.dart';
// import 'package:design_ui/modules/ScreenPageDrawer/%D8%AA%D8%AE%D8%B5%D8%B5%20%D8%A7%D9%84%D8%A7%D8%A8%D8%AD%D8%A7%D8%AB.dart';
// import 'package:design_ui/modules/ScreenPageDrawer/%D8%B9%D9%86%D8%A7%D8%B5%D8%B1%20%D8%A7%D9%84%D8%A7%D8%B3%D8%AA%D8%B7%D9%84%D8%A7%D8%B9%D8%A7%D8%AA.dart';
// import 'package:design_ui/modules/ScreenPageDrawer/%D9%85%D8%B9%D8%A7%D9%85%D9%84%D8%A7%D8%AA%20%D8%A7%D9%84%D8%B7%D9%84%D8%A7%D8%A8.dart';
// import 'package:design_ui/modules/ScreenPageDrawer/%D9%86%D8%B4%D8%A7%D8%B7%20%D8%A7%D9%84%D8%B7%D9%84%D8%A7%D8%A8.dart';
// import 'package:design_ui/modules/login/login.dart';
// import 'package:design_ui/modules/login/user%20data.dart';
// import 'package:design_ui/shared/shared%20preference.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../ScreenPageDrawer/اعداد الخريجين.dart';
// import '../ScreenPageDrawer/الاقسام.dart';
// import '../ScreenPageDrawer/العمال الاداريين.dart';
// import '../ScreenPageDrawer/العمال الاكادميين .dart';
// import '../ScreenPageDrawer/المعامل.dart';
// import '../ScreenPageDrawer/انواع الكتب.dart';
// import '../ScreenPageDrawer/توزيع الطلاب.dart';
// import '../ScreenPageDrawer/نوع البرتوكول.dart';
//
// class CustomDrawer extends StatelessWidget {
//   bool obserText = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         onWillPop: () async => false,
//         child: Material(
//           color: const Color(0xFF054978),
//           child: SafeArea(
//             child: Theme(
//               data: ThemeData(
//                 brightness: Brightness.dark,
//               ),
//               child: Padding(
//                   padding: const EdgeInsetsDirectional.only(
//                       start: 20, bottom: 40, end: 100),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Padding(
//                               padding: const EdgeInsetsDirectional.only(
//                                   start: 10, top: 70),
//                               //     child:CircleAvatar(
//                               //   radius: 30,
//                               //
//                               // ),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             const Text(
//                               'Welcome!',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: AppColors.orange,
//                                   fontSize: 20),
//                             ),
//                             Text(
//                               username.toString(),
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: AppColors.orange,
//                                   fontSize: 20),
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             // Text('${email}',style:
//                             // TextStyle(fontWeight: FontWeight.bold,color: AppColors.orange),),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           width: 400,
//                           height: 1,
//                           child: const Divider(
//                             color: const Color(0xfff4f4f8),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             //MyStatefulWidget();
//
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Al3am_Alacademy()));
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 'العام الاكاديمي ',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                               // MyAppp(),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => AL3omal(),
//                               ),
//                             );
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 'اعضاء هيئة التدريس',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => El3omalelEdareen(),
//                               ),
//                             );
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 ' الاداريين',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Alma3amel(),
//                               ),
//                             );
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 'المعامل ',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Tawzee3Altolap(),
//                               ),
//                             );
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 'توزيع الطلاب ',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => NashatAtolap(),
//                               ),
//                             );
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 'نشاط الطلاب',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Anwa3elkotb(),
//                               ),
//                             );
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 ' أنواع الكتب',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Almaktba(),
//                               ),
//                             );
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 ' المكتبة',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => a3dadAl5rgeen(),
//                               ),
//                             );
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 'اعداد الخرجين',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Alasttla3at(),
//                               ),
//                             );
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 'الاستطلاعات',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => anaserAlasttla3at(),
//                               ),
//                             );
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 'عناصر الاستطلاعات',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Mo3amalatALtolap(),
//                               ),
//                             );
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 'معاملات الطلاب',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Alab7as(),
//                               ),
//                             );
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 'الابحاث',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Alprotocol(),
//                               ),
//                             );
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 'البرتوكول',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Container(
//                           width: 400,
//                           height: 1,
//                           child: const Divider(
//                             color: const Color(0xfff4f4f8),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 50,
//                         ),
//                         InkWell(
//                           onTap: () {},
//                           child: Row(
//                             children: const [
//                               Text(
//                                 '    Settings ',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                               Icon(Icons.settings_outlined)
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 30,
//                         ),
//                         InkWell(
//                           onTap: (){
//                             username = null;
//                             email = null;
//                             jwt = null;
//                             cachehelper.deletedata(key: "username");
//                             cachehelper.deletedata(key: "email");
//                             cachehelper.deletedata(key: "jwt").then((value) {
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => loginqualityapp()),
//                               );
//                               Fluttertoast.showToast(
//                                 msg: "تم تسجيل الخروج بنجاح ",
//                                 textColor: Colors.white,
//                                 toastLength: Toast.LENGTH_SHORT,
//                                 gravity: ToastGravity.BOTTOM,
//                                 backgroundColor: Colors.indigo,
//                               );
//                             });
//                           },
//                           child: Row(
//                             children: const [
//                               Text(
//                                 '    Sign Out ',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                               Icon(Icons.logout)
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   )),
//             ),
//           ),
//         ));
//   }
// }

import 'package:design_ui/bloc/login/cubitlogin.dart';
import 'package:design_ui/bloc/login/stateslogin.dart';
import 'package:design_ui/constant/colors.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D8%A7%D8%A8%D8%AD%D8%A7%D8%AB.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D8%A7%D8%B3%D8%AA%D8%B7%D9%84%D8%A7%D8%B9%D8%A7%D8%AA.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D8%A8%D8%B1%D8%AA%D9%88%D9%83%D9%88%D9%84.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D8%B9%D8%A7%D9%85%20%D8%A7%D9%84%D8%A7%D9%83%D8%A7%D8%AF%D9%8A%D9%85%D9%8A.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D9%85%D9%83%D8%AA%D8%A8%D8%A9.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D8%B9%D9%86%D8%A7%D8%B5%D8%B1%20%D8%A7%D9%84%D8%A7%D8%B3%D8%AA%D8%B7%D9%84%D8%A7%D8%B9%D8%A7%D8%AA.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D9%85%D8%B9%D8%A7%D9%85%D9%84%D8%A7%D8%AA%20%D8%A7%D9%84%D8%B7%D9%84%D8%A7%D8%A8.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D9%86%D8%B4%D8%A7%D8%B7%20%D8%A7%D9%84%D8%B7%D9%84%D8%A7%D8%A8.dart';
import 'package:design_ui/modules/login/login.dart';
import 'package:design_ui/modules/login/user%20data.dart';
import 'package:design_ui/shared/shared%20preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../ScreenPageDrawer/اعداد الخريجين.dart';
import '../ScreenPageDrawer/الاقسام.dart';
import '../ScreenPageDrawer/العمال الاداريين.dart';
import '../ScreenPageDrawer/العمال الاكادميين .dart';
import '../ScreenPageDrawer/المعامل.dart';
import '../ScreenPageDrawer/انواع الكتب.dart';
import '../ScreenPageDrawer/توزيع الطلاب.dart';
import '../ScreenPageDrawer/نوع البرتوكول.dart';

class CustomDrawer extends StatelessWidget {
  bool obserText = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<logincubit,qualityloginstates>(builder: (context, state) {
     return WillPopScope(
         onWillPop: () async => false,
         child: Material(
           color: const Color(0xFF054978),
           child: SafeArea(
             child: Theme(
               data: ThemeData(
                 brightness: Brightness.dark,
               ),
               child: Padding(
                   padding: const EdgeInsetsDirectional.only(
                       start: 20, bottom: 40, end: 100),
                   child: SingleChildScrollView(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             const Padding(
                               padding: const EdgeInsetsDirectional.only(
                                   start: 10, top: 70),
                               //     child:CircleAvatar(
                               //   radius: 30,
                               //
                               // ),
                             ),
                             const SizedBox(
                               height: 10,
                             ),
                             const Text(
                               'Welcome!',
                               style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   color: AppColors.orange,
                                   fontSize: 20),
                             ),
                             Text(
                               username.toString(),
                               style: const TextStyle(
                                   fontWeight: FontWeight.bold,
                                   color: AppColors.orange,
                                   fontSize: 20),
                             ),
                             const SizedBox(
                               height: 5,
                             ),
                             // Text('${email}',style:
                             // TextStyle(fontWeight: FontWeight.bold,color: AppColors.orange),),
                           ],
                         ),
                         const SizedBox(
                           height: 20,
                         ),
                         Container(
                           width: 400,
                           height: 1,
                           child: const Divider(
                             color: Color(0xfff4f4f8),
                           ),
                         ),
                         const SizedBox(
                           height: 15,
                         ),
                         Visibility(
                           visible: (Racademicyear == true || role == 'admin') ? true : false,
                           child: InkWell(
                             onTap: () {
                               //MyStatefulWidget();

                               Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context) => Al3am_Alacademy()));
                             },
                             child: Column(
                               children: [
                                 Row(
                                   children: const [
                                     Text(
                                       'العام الاكاديمي ',
                                       style: TextStyle(
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                                     // MyAppp(),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 15,
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Visibility(
                           visible: (RAstaff == true|| role == 'admin')
                               ? true
                               : false,
                           child: InkWell(
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => AL3omal(),
                                 ),
                               );
                             },
                             child: Column(
                               children: [
                                 Row(
                                   children: const [
                                     Text(
                                       'اعضاء هيئة التدريس',
                                       style: TextStyle(
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 15,
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Visibility(
                           visible: (RMstaff == true || role == 'admin')
                               ? true
                               : false,
                           child: InkWell(
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => El3omalelEdareen(),
                                 ),
                               );
                             },
                             child: Column(
                               children: [
                                 Row(
                                   children: const [
                                     Text(
                                       ' الاداريين',
                                       style: TextStyle(
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 15,
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Visibility(
                           visible: (Rlab == true || role == 'admin')
                               ? true
                               : false,
                           child: InkWell(
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => Alma3amel(),
                                 ),
                               );
                             },
                             child: Column(
                               children: [
                                 Row(
                                   children: const [
                                     Text(
                                       'المعامل ',
                                       style: TextStyle(
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 15,
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Visibility(
                           visible: (RstudDistribution == true|| role == 'admin')
                               ? true
                               : false,
                           child: InkWell(
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => Tawzee3Altolap(),
                                 ),
                               );
                             },
                             child: Column(
                               children: [
                                 Row(
                                   children: const [
                                     Text(
                                       'توزيع الطلاب ',
                                       style: TextStyle(
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 15,
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Visibility(
                           visible: (RstudActivity == true || role == 'admin')
                               ? true
                               : false,
                           child: InkWell(
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => NashatAtolap(),
                                 ),
                               );
                             },
                             child: Column(
                               children: [
                                 Row(
                                   children: const [
                                     Text(
                                       'نشاط الطلاب',
                                       style: TextStyle(
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 15,
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Visibility(
                           visible: (RbookType == true || role == 'admin')
                               ? true
                               : false,
                           child: InkWell(
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => Anwa3elkotb(),
                                 ),
                               );
                             },
                             child: Column(
                               children: [
                                 Row(
                                   children: const [
                                     Text(
                                       ' أنواع الكتب',
                                       style: TextStyle(
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 15,
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Visibility(
                           visible: (Rlibrary == true|| role == 'admin') ? true : false,
                           child: InkWell(
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => Almaktba(),
                                 ),
                               );
                             },
                             child: Column(
                               children: [
                                 Row(
                                   children: const [
                                     Text(
                                       ' المكتبة',
                                       style: TextStyle(
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 15,
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Visibility(
                           visible: (Rgradnumber == true || role == 'admin')
                               ? true
                               : false,
                           child: InkWell(
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => a3dadAl5rgeen(),
                                 ),
                               );
                             },
                             child: Column(
                               children: [
                                 Row(
                                   children: const [
                                     Text(
                                       'اعداد الخرجين',
                                       style: TextStyle(
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 15,
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Visibility(
                           visible: (Rsurvey == true || role == 'admin')
                               ? true
                               : false,
                           child: InkWell(
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => Alasttla3at(),
                                 ),
                               );
                             },
                             child: Column(
                               children: [
                                 Row(
                                   children: const [
                                     Text(
                                       'الاستطلاعات',
                                       style: TextStyle(
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 15,
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Visibility(
                           visible: (RsurveyItem == true || role == 'admin')
                               ? true
                               : false,
                           child: InkWell(
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => anaserAlasttla3at(),
                                 ),
                               );
                             },
                             child: Column(
                               children: [
                                 Row(
                                   children: const [
                                     Text(
                                       'عناصر الاستطلاعات',
                                       style: TextStyle(
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 15,
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Visibility(
                           visible: (RstudTransaction == true || role == 'admin')
                               ? true
                               : false,
                           child: InkWell(
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => Mo3amalatALtolap(),
                                 ),
                               );
                             },
                             child: Column(
                               children: [
                                 Row(
                                   children: const [
                                     Text(
                                       'معاملات الطلاب',
                                       style: TextStyle(
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 15,
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Visibility(
                           visible: (Rresearch == true|| role == 'admin')
                               ? true
                               : false,
                           child: InkWell(
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => Alab7as(),
                                 ),
                               );
                             },
                             child: Column(
                               children: [
                                 Row(
                                   children: const [
                                     Text(
                                       'الابحاث',
                                       style: TextStyle(
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 15,
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Visibility(
                           visible: (Rprotocol == true || role == 'admin')
                               ? true
                               : false,
                           child: InkWell(
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => Alprotocol(),
                                 ),
                               );
                             },
                             child: Column(
                               children: [
                                 Row(
                                   children: const [
                                     Text(
                                       'البرتوكول',
                                       style: TextStyle(
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 15,
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Container(
                           width: 400,
                           height: 1,
                           child: const Divider(
                             color: const Color(0xfff4f4f8),
                           ),
                         ),
                         // const SizedBox(
                         //   height: 50,
                         // ),
                         // InkWell(
                         //   onTap: () {},
                         //   child: Row(
                         //     children: const [
                         //       Text(
                         //         '    Settings ',
                         //         style: TextStyle(
                         //             fontSize: 20,
                         //             fontWeight: FontWeight.bold,
                         //             color: Colors.white),
                         //       ),
                         //       Icon(Icons.settings_outlined)
                         //     ],
                         //   ),
                         // ),
                         const SizedBox(
                           height: 30,
                         ),
                         InkWell(
                           onTap: () {
                             username = null;
                             email = null;
                             jwt = null;
                             cachehelper.deletedata(key: "username");
                             cachehelper.deletedata(key: "email");
                             cachehelper.deletedata(key: "jwt").then((value) {
                               Navigator.pushReplacement(
                                 context,
                                 MaterialPageRoute(
                                     builder: (context) => loginqualityapp()),
                               );
                               Fluttertoast.showToast(
                                 msg: "تم تسجيل الخروج بنجاح ",
                                 textColor: Colors.white,
                                 toastLength: Toast.LENGTH_SHORT,
                                 gravity: ToastGravity.BOTTOM,
                                 backgroundColor: AppColors.blue,
                               );
                             });
                           },
                           child: Row(
                             children: const [
                               Text(
                                 '    Sign Out ',
                                 style: TextStyle(
                                     fontSize: 20,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.white),
                               ),
                               Icon(Icons.logout)
                             ],
                           ),
                         ),
                       ],
                     ),
                   )),
             ),
           ),
         ));
    }, listener: (context,state){});
  }
}
