import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:design_ui/bloc/login/cubitlogin.dart';
import 'package:design_ui/bloc/login/stateslogin.dart';
import 'package:design_ui/components/passwordtextform.dart';
import 'package:design_ui/constant/colors.dart';
import 'package:design_ui/components/custom%20button.dart';
import 'package:design_ui/components/text%20from.dart';
import 'package:design_ui/modules/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/http/HttpPost.dart';

class regestersocialapp extends StatelessWidget {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _conformpasswordcontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();
  bool obserText = true;
  bool obserText2 = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<logincubit, qualityloginstates>(
        listener: (context, state) {
      if (state is registersuccessstate) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => loginqualityapp()));
      }
    }, builder: (context, state) {
      var visibalcubit = logincubit.get(context);

      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blue,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset('assets/image/qualitylogo.jpg',
                          width: 200, height: 200),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Create New Account ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: AppColors.blue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Complete this form',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DefaultTextField(
                      controller: _namecontroller,
                      text: 'User Name',
                      prefix: Icons.drive_file_rename_outline,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return ('name must not be empty');
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DefaultTextField(
                      controller: _emailcontroller,
                      text: 'Email',
                      prefix: Icons.email,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return ('email address must not be empty');
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PasswordTextFormField(
                      prefix: Icons.lock_outline,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return ('password must not be empty');
                        } else if (value.length < 6) {
                          return ('Password have to be more than 6 characters');
                        }
                        return null;
                      },
                      obserText: obserText,
                      controller: _passwordcontroller,
                      suffixPressed: () {
                        FocusScope.of(context).unfocus();
                        obserText = !obserText;
                        visibalcubit.visibal();
                      },
                      text: 'Password (at least 6 digits)',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordTextFormField(
                      prefix: Icons.lock_outline,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return ('Confirm password must not be empty');
                        } else if (_conformpasswordcontroller.text !=
                            _passwordcontroller.text) {
                          return ("password not matched");
                        }
                        return null;
                      },
                      obserText: obserText2,
                      controller: _conformpasswordcontroller,
                      suffixPressed: () {
                        FocusScope.of(context).unfocus();
                        obserText2 = !obserText2;
                        visibalcubit.visibal();
                      },
                      text: 'Conform Password',
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    ConditionalBuilder(
                      condition: state is! registerloadingstate,
                      builder: (context) => DefaultButton(
                        text: "REGISTER",
                        color: AppColors.orange,

                        onpressed: () async {
                          if (formkey.currentState!.validate()) {
                            await logincubit.get(context).SignUpUser(
                                name: _namecontroller.text.trim(),
                                email: _emailcontroller.text.trim(),
                                password: _passwordcontroller.text.trim());
                          }
                        },

                      ),
                      fallback: (BuildContext context) =>
                          Center(child: CircularProgressIndicator()),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
