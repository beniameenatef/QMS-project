import 'package:design_ui/modules/login/login.dart';
import 'package:design_ui/modules/login/user%20data.dart';
import 'package:design_ui/shared/shared%20preference.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constant/colors.dart';

class setting extends StatelessWidget {
  const setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (username == null)
        ? const Center(child: Text('Guest user'))
        : Column(
            children: [
              const Divider(
                color: AppColors.blue,
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
                      backgroundColor: Colors.indigo,
                    );
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.logout,
                        color: AppColors.blue,
                      ),
                      Text(
                        'Sign Out ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: AppColors.blue,
              ),
            ],
          );
  }
}
