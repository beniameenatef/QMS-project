
import 'package:design_ui/bloc/login/cubitlogin.dart';
import 'package:design_ui/bloc/login/stateslogin.dart';
import 'package:design_ui/models/userdatamodel.dart';
import 'package:design_ui/modules/login/user%20data.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constant/colors.dart';
import '../../network/http/HttpPut.dart';

class profile extends StatelessWidget {
   profile({Key? key}) : super(key: key);
//
//   @override
//   State<profile> createState() => _profileState();
// }
// // String _currentSelectedValue='';
//
// class _profileState extends State<profile> {
  late Future<List<Users>> users;
  var selectedValue;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<logincubit,qualityloginstates>(
        builder: (context, state) {
          users = GetUser();

          return FutureBuilder<List<Users>>(
       future: users,
       builder: (context, AsyncSnapshot<List<Users>> snapshot) {
         if (snapshot.hasData) {
           return SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(15.0),
               child: (role == 'guest')
                   ? const Center(
                 child: Text('Guest user'),
               )
                   : Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Divider(
                     color: AppColors.blue,
                   ),
                   const Text(
                     "Username",
                     style: TextStyle(
                         fontWeight: FontWeight.w500,
                         color: AppColors.blue,
                         fontSize: 20),
                   ),
                   Text(
                     username.toString(),
                     style: const TextStyle(
                         fontWeight: FontWeight.w300,
                         color: AppColors.blue,
                         fontSize: 20),
                   ),
                   const Divider(
                     color: AppColors.blue,
                   ),
                   const Text(
                     "Email",
                     style: const TextStyle(
                         fontWeight: FontWeight.w500,
                         color: AppColors.blue,
                         fontSize: 20),
                   ),
                   Text(
                     email.toString(),
                     style: const TextStyle(
                         fontWeight: FontWeight.w300,
                         color: AppColors.blue,
                         fontSize: 20),
                   ),
                   const Divider(
                     color: AppColors.blue,
                   ),
                 ],
               ),
             ),
           );
         } else if (snapshot.hasError) {
           return Text('${snapshot.error}');
         } else {
           return Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: const [
                 CircularProgressIndicator(
                   color: AppColors.blue,
                 ),
                 Text('تحميل'),
               ],
             ),
           );
         }
       },
     );
    }, listener: (context,state){});
  }

}

