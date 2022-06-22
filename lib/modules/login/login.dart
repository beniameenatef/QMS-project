import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:design_ui/bloc/login/cubitlogin.dart';
import 'package:design_ui/bloc/login/stateslogin.dart';
import 'package:design_ui/components/passwordtextform.dart';
import 'package:design_ui/constant/colors.dart';
import 'package:design_ui/components/custom%20button.dart';
import 'package:design_ui/components/text%20from.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/ScreenNavigationBar/Home/ScreensHome/overview.dart';
import 'package:design_ui/modules/ScreenNavigationBar/Home/home.dart';
import 'package:design_ui/modules/login/register.dart';
import 'package:design_ui/modules/login/user%20data.dart';
import 'package:design_ui/shared/shared%20preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/http/HttpPost.dart';
import '../datialesHomeScreen/detailshome.dart';

class loginqualityapp extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  TextEditingController emaillogincontroller = TextEditingController();
  TextEditingController passwordlogincontroller = TextEditingController();
  bool obserText = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<logincubit, qualityloginstates>(
        listener: (context, state) {
      if (state is loginsuccessstate) {
        if (state.userdatamodel!.confirmed = true) {
          cachehelper.savedata(
              key: 'username', value: username);
          cachehelper.savedata(
              key: 'visible', value: role);
          cachehelper.savedata(
              key: 'gradnumber', value: Rgradnumber);
          cachehelper.savedata(
              key: 'academicyear', value: Racademicyear);
          cachehelper.savedata(
              key: 'Astaff', value: RAstaff);
          cachehelper.savedata(
              key: 'Mstaff', value: RMstaff);
          cachehelper.savedata(
              key: 'lab', value: Rlab);
          cachehelper.savedata(
              key: 'studDistribution', value: RstudDistribution);
          cachehelper.savedata(
              key: 'studActivity', value: RstudActivity);
          cachehelper.savedata(
              key: 'bookType', value: RbookType);
          cachehelper.savedata(
              key: 'library', value: Rlibrary);
          cachehelper.savedata(
              key: 'survey', value: Rsurvey);
          cachehelper.savedata(
              key: 'surveyItem', value: RsurveyItem);
          cachehelper.savedata(
              key: 'studTransaction', value: RstudTransaction);
          cachehelper.savedata(
              key: 'research', value: Rresearch);
          cachehelper.savedata(
              key: 'protocol', value: Rprotocol);
          cachehelper.savedata(
              key: 'email', value: email);
          cachehelper
              .savedata(key: 'jwt', value: jwt)
              .then((value) {
            print(" jwt is ${jwt}");
            print(" email is ${email}");
            print(" username is ${username}");

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => AppDrawer(
                            child: detailshomePage(
                          child: homescreen(),
                        ))));
          });
        } else {
          print('error');
        }
      }
    }, builder: (context, state) {
      var visibalcubit = logincubit.get(context);

      return Scaffold(
        appBar: null,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Form(
                  key: formkey,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset('assets/image/qualitylogo.jpg',
                            width: 250, height: 150),
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                      const Text(
                        'Welcome To ',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                      const Text(
                        'Quality Management System ',
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const Text(
                        'For Faculty of CsIs  ',
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      DefaultTextField(
                        controller: emaillogincontroller,
                        text: 'email',
                        prefix: Icons.email_outlined,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return ('email address must not be empty');
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordTextFormField(
                        prefix: Icons.lock_outline,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return ('password must not be empty');
                          }
                          return null;
                        },
                        obserText: obserText,
                        controller: passwordlogincontroller,
                        suffixPressed: () {
                          FocusScope.of(context).unfocus();
                          obserText = !obserText;
                          visibalcubit.visibal();
                        },
                        text: 'Password',
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ConditionalBuilder(
                          condition: state is! loginloadingstate,
                          builder: (context) => DefaultButton(
                            color: AppColors.orange,
                            text: 'Login',
                            onpressed: () {
                              if (formkey.currentState!.validate()) {
                                logincubit.get(context).LoginUser(
                                    emaill: emaillogincontroller.text.trim(),
                                    password:
                                        passwordlogincontroller.text.trim());
                              }
                            },
                          ),
                          fallback: (BuildContext context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ),

                      const SizedBox(
                        height: 11,
                      ),
                      Center(
                          child: DefaultButton(
                        text: 'visitor',
                        color: AppColors.blue,
                        onpressed: () {
                          role='visitor';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    detailshomePage(role: "visitor")),
                          );
                        },
                      )),
                      SizedBox(
                        height: 11,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => regestersocialapp()),
                              );
                            },
                            child: const Text(
                              'Register Now',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
