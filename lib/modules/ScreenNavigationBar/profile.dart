
import 'package:design_ui/bloc/login/cubitlogin.dart';
import 'package:design_ui/bloc/login/stateslogin.dart';
import 'package:design_ui/models/userdatamodel.dart';
import 'package:design_ui/modules/ScreenNavigationBar/setting.dart';
import 'package:design_ui/modules/login/user%20data.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
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
           return (role == 'visitor')
               ?  Center(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('visitor user', style: const TextStyle(
                         fontWeight: FontWeight.w500,
                         color: AppColors.blue,
                         fontSize: 20),),
                   ],
                 ),
               )
               : Column(
                 children: [
                   Container(
                   height: 250,
                   decoration: BoxDecoration(
                   color: AppColors.blue,
                   borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(180,40)),
             ),
                     child: Center(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             username.toString(),
                             style: const TextStyle(
                                 fontWeight: FontWeight.bold,
                                 color: Colors.white,
                                 fontSize: 20),
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text(
                                 "Role :",
                                 style: const TextStyle(
                                     fontWeight: FontWeight.w500,
                                     color: Colors.white,
                                     fontSize: 20),
                               ),
                               Text(
                                 role.toString(),
                                 style: const TextStyle(
                                     fontWeight: FontWeight.w300,
                                     color: Colors.white,
                                     fontSize: 20),
                               ),
                             ],
                           ),
                         ],
                       ),

                     ),
                   ),
                   SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            textAlign: TextAlign.left,

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



                          Visibility(
                            visible: (role == 'admin')? true : false ,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Creators()));
                              },
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Icon(Icons.people_alt_outlined,color: AppColors.blue,),
                                       SizedBox(width: 10,),
                                       Text(
                                        "Creators",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.blue,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Divider(
                                    color: AppColors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ),


                        ],
                      ),
                    )

                 ],
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

