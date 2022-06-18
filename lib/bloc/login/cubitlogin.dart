import 'dart:convert';

import 'package:design_ui/bloc/login/stateslogin.dart';
import 'package:design_ui/models/userdatamodel.dart';
import 'package:design_ui/modules/login/user%20data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class logincubit extends Cubit<qualityloginstates> {
  logincubit() : super(qualityloginInitialState());

  static logincubit get(context) => BlocProvider.of(context);


  bool ispassword =true;
void visibal()
{
  ispassword=!ispassword;
  emit(visibalSuccessState());

}
bool isbrache=true;
void branch()
{
  isbrache=!isbrache;
  emit(brancheSuccessState());
}
  Users?userdatamodel;

  Future LoginUser({String? emaill, String? password}) async {
emit(loginloadingstate());
    dynamic api = 'https://qms-application.herokuapp.com/api/auth/local?populate=*';

  await http.post(Uri.parse(api),
        body: {
          "identifier": "${emaill.toString()}",
          "password": "${password.toString()}"
        }
    ).then((value)
    {

      if (value.statusCode == 200) {
        print("Account Login in");
        var data = jsonDecode(value.body.toString());
        print(data["jwt"]);
        jwt = data["jwt"];
        username=data["user"]["username"];
        email=data["user"]["email"];
        role=data["user"]["visible"];
        //avatar=data["user"]["avatar"];
        print(jwt);
        print(username);
        print(email);

        print(value.body);
         userdatamodel =Users.fromJson(data);
         emit(loginsuccessstate(userdatamodel));
        Fluttertoast.showToast(
          msg: "تم التسجيل بنجاح ",
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.indigo,);
        return userdatamodel;

      } else {
        print(value.body);
        throw Exception('Failed to log in user.');
      }
    }).catchError((error)
    {
      emit(loginerrorstate(error.toString()));
      Fluttertoast.showToast(
        msg: "خطأ في التسجيل اعد كتابه البريد الالكتروني او الرقم السري مره اخري",
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.indigo,);
      print(error.toString());
    });

  }
//   Future<Userdatalogin?> LoginUser(
//       {
//         String ?emaill,
//         String? password
//       }) async {
// emit(loginloadingstate());
//     dynamic api = 'https://qms-application.herokuapp.com/api/auth/local?populate=*';
//
//     await http.get(Uri.parse(api),
//         headers:  {
//           "identifier": "${emaill.toString()}",
//           "password": "${password.toString()}",
//           // "jwt":"jwt"
//         }
//     ).then((value)
//     {
//       if (value.statusCode == 200) {
//         print("Account Login in");
//         var data = jsonDecode(value.body.toString());
//         //print(data["jwt"]);
//         jwt = data["jwt"];
//         username=data["user"]["username"];
//         email=data["user"]["email"];
//         //avatar=data["user"]["avatar"];
//         print(jwt);
//
//
//         print(username);
//         print(email);
//
//         print(value.body);
//          userdatamodel= Userdatalogin.fromJson(data);
//          emit(loginsuccessstate(userdatamodel));
//         Fluttertoast.showToast(
//           msg: "Login Successfully",
//           textColor: Colors.white,
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           backgroundColor: Colors.indigo,);
//         return userdatamodel;
//
//       } else {
//         print(value.body);
//         throw Exception('Failed to log in user.');
//       }
//     }).catchError((error)
//     {
//
//       emit(loginerrorstate(error.toString()));
//       Fluttertoast.showToast(
//         msg: "Please Again Enter Your Email And Password",
//         textColor: Colors.white,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.indigo,);
//       print(error.toString());
//     });
//
//
//   }

  Future SignUpUser({String ?name, String ?email, String ?password,
  }) async {
    emit(registerloadingstate());
    dynamic api = 'https://qms-application.herokuapp.com/api/auth/local/register';

     await http.post(Uri.parse(api),
        body: {

          "username": "${name.toString()}",
          // 'Authorization': jwt??'',
          "email": "${email.toString()}",
          "password": "${password.toString()}",
         "visible":"guest"
        }
    ).then((value)
    {

      if (value.statusCode == 200) {
        print("Account Created");
        var data = jsonDecode(value.body.toString());
        emit(registersuccessstate(userdatamodel));
        Fluttertoast.showToast(
          msg: "تم الانشاء بنجاح ",
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.indigo,);
        print(data["jwt"]);
      } else {
        print(value.body);
        throw Exception('Failed to sign up user.');
      }
    }).catchError((error)
     {
       emit(registererrorstate(error.toString()));
       Fluttertoast.showToast(
         msg: "Failed ",
         textColor: Colors.white,
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
         backgroundColor: Colors.indigo,);
       print(error.toString());
     });

  }


  Future<Users?> PutUsers({int? id, String? role}) async {
emit(putuserdataloadingstate());
    dynamic api = 'https://qms-application.herokuapp.com/api/users/${id}';

    final response = await http.put((Uri.parse(api)), headers:<String , String> {
      //'Authorization' : 'xyz',
      'Content-Type': 'application/json; charset=UTF-8',
    },
        body: jsonEncode(<String,dynamic>{

          "visible":"${role}"

        })
    ).then((value)
    {

      if (value.statusCode == 200) {
        var data = jsonDecode(value.body.toString());
        print(data);
         userdatamodel= Users.fromJson(jsonDecode(value.body));
         emit(putuserdatasuccessstate(userdatamodel));
        return userdatamodel;
      } else {
        throw Exception('Failed to put user.');
      }
    }).catchError((error)
    {
      emit(putuserdataerrorstate(error.toString()));
      print(error.toString());
    });

  }
  Future GetUserData({dynamic jwt}) async {
    emit(getuserdataloadingstate());
    final response = await http.get(Uri.parse('https://qms-application.herokuapp.com/api/users/me'),
        headers:<String , String> {
          'Authorization' : 'Bearer ${jwt}',
        }).then((value)
    {
      if(value.statusCode==200){
        print(value.body);
        var data = jsonDecode(value.body.toString());
        //print(data["jwt"]);
        //jwt = data["jwt"];
        username=data["username"];
        email=data["email"];
        role=data["visible"];
        emit(getuserdatasuccessstate(userdatamodel));
        print('new request------------------');
        //print(jwt);
        print(username);
        print(email);
        print(role);
        print('--------------------------');


      }
      else
      {
        throw Exception('failed to get  one user data');
      }
    }).catchError((error)
    {
      emit(getuserdataerrorstate(error.toString()));
      print(error.toString());
    });



  }


}