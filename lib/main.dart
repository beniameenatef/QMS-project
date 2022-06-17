import 'package:design_ui/bloc/login/cubitlogin.dart';
import 'package:design_ui/constant/endpoint.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/modules/login/user%20data.dart';
import 'package:design_ui/modules/on%20boarding/on%20boarding.dart';
import 'package:design_ui/network/dio%20helper.dart';
import 'package:design_ui/bloc/home/homecubit.dart';

import 'package:design_ui/shared/shared%20preference.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/ScreenNavigationBar/Home/home.dart';
import 'modules/login/login.dart';




void main() async{

//   WidgetsFlutterBinding.ensureInitialized();
//   DioHelper.init();
//   await cachehelper.init();
//   bool ?onboarding;
//   onboarding= cachehelper.getdata(key: 'onboarding');
//   String ?jwt;
//   jwt= cachehelper.getdata(key: 'jwt');
//   Widget widget;
//
//   if(onboarding != null)
//   {
//     if(jwt != null){
//       widget = AppDrawer(child:loginqualityapp());
//     print("anta sA7 ${jwt}");}
//     else widget = loginqualityapp();
//   } else
//   {
//     widget = onBoardingScrean();
//   }
//   runApp(MyApp(
//     startWidget: widget,
//
//   ));
// }
//
// class MyApp extends StatelessWidget {
//   final bool ?onboarding;
//   final Widget ?startWidget;
//
//    MyApp({ this.onboarding, this.startWidget}) ;
//   // This widget is the root of your application.
//   @override
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await cachehelper.init();
  bool ?onboarding;
  onboarding= cachehelper.getdata(key: 'onboarding');
  // String ?jwt;
  jwt= cachehelper.getdata(key: 'jwt');
  jwt= cachehelper.getdata(key: 'visible');
  email= cachehelper.getdata(key: 'email');
  username= cachehelper.getdata(key: 'username');
  Widget widget;
// if(username==null||jwt==null||email==null) widget=detailshomePage(role:"guest");
  if(onboarding != null)
  {
    if(jwt != null && email!=null&&username!=null) widget = AppDrawer(child:detailshomePage());
    else widget =  loginqualityapp();
    // AppDrawer(child:loginqualityapp());
  } else
  {
    widget = onBoardingScrean();
  }

  runApp(MyApp(
    startWidget: widget,
  ));}

class MyApp extends StatelessWidget {
  final bool ?onboarding;
  final Widget ?startWidget;

  MyApp({ this.onboarding, this.startWidget}) ;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => homecubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => logincubit(),
          ),
          // BlocProvider<BlocC>(
          //   create: (BuildContext context) => BlocC(),
          // ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            backgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          home:
          startWidget
          // years(),
          // AppDrawer(child:loginqualityapp()),
        ));
  }
}



