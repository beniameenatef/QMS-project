
import 'package:design_ui/bloc/home/homecubit.dart';
import 'package:design_ui/bloc/login/cubitlogin.dart';
import 'package:design_ui/bloc/login/stateslogin.dart';
import 'package:design_ui/models/userdatamodel.dart';
import 'package:design_ui/modules/Drawer/yeardropdwon.dart';
import 'package:design_ui/modules/login/user%20data.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constant/colors.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../network/http/HttpPut.dart';

class Creators extends StatelessWidget {
   Creators({Key? key}) : super(key: key);


  late Future<List<Users>> users;

  var selectedValue;

  // @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<logincubit,qualityloginstates>(builder: (context, state) {
      users = GetUser();

      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blue,
          leading: IconButton(
            color: Color(0xFF2F2F31),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              size: 30,
              color: AppColors.orange,
            ),
          ),

          title:
              Text(
                'Supervisor',
                style: TextStyle(color: Color(0xFFF1770D)),
              ),
        ),
          body :FutureBuilder<List<Users>>(
       future: users,
       builder: (context, AsyncSnapshot<List<Users>> snapshot) {
         if (snapshot.hasData) {
           return SingleChildScrollView(
             child: (role == 'guest')
                 ? const Center(
               child: Text('Guest user'),
             )
                 : Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Visibility(
                   visible: (role == 'admin') ? true : false,
                   child: Column(
                     children: [
                       DataTable(
                         headingRowColor: MaterialStateColor.resolveWith(
                               (states) {
                             return AppColors.blue;
                           },
                         ),
                         headingRowHeight: 40,
                         dividerThickness: 3,
                         columnSpacing: 30.0,
                         dataRowHeight: 60,
                         showBottomBorder: true,
                         columns: const [
                           DataColumn(label: Text('user',style: TextStyle(
                             color: AppColors.orange))),
                           DataColumn(label: Text(' ')),
                           DataColumn(label: Text('role',style: TextStyle(
                             color: AppColors.orange,))),
                         ],
                         rows: List.generate(snapshot.data!.length,
                                 (index) {
                               dynamic x = snapshot.data?[index].username;
                               dynamic y = snapshot.data?[index].visible;
                               dynamic z = snapshot.data?[index].id;
                               dynamic a=snapshot.data?[index].email;

                               return DataRow(
                                 cells: [
                                   DataCell(Container(
                                     child: Column(
                                       children: [
                                         Text(
                                              (x == null)
                                                 ? "_"
                                                 : "${x}",textAlign: TextAlign.right
                                           ,),
                                         Text(
                                             (a == null)
                                                 ? "_"
                                                 : "${a}"),
                                       ],
                                     ),
                                   )),
                                   const DataCell(VerticalDivider(
                                     thickness: 3.0,
                                     color: AppColors.blue,
                                   )),
                                   DataCell(
                                       Container(
                                           child: (y == null)
                                               ? const Text("_")
                                               : Text('${y}')), ),
                                 ],
                                 onLongPress: () {
                                   showDataAlert(x, z,context,snapshot.data?[index].gradnumber,snapshot.data?[index].academicyear,
                                       snapshot.data?[index].Astaff,snapshot.data?[index].Mstaff,snapshot.data?[index].lab,
                                       snapshot.data?[index].studDistribution,snapshot.data?[index].studActivity,snapshot.data?[index].bookType,
                                       snapshot.data?[index].theLibrary,snapshot.data?[index].survey,snapshot.data?[index].surveyItem,snapshot.data?[index].studTransaction,
                                       snapshot.data?[index].research,snapshot.data?[index].protocol
                                   );
                                 }

                                 // });
                               );
                             }),
                       ),
                     ],
                   ),
                 ),
               ],
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
     )
      );
    }, listener: (context,state){});
  }


   // bool Rgradnumber=false;
   // bool Racademicyear=false;
   // bool RAstaff=false;
   // bool RMstaff=false;
   // bool Rlab=false;
   // bool RstudDistribution=false;
   // bool RstudActivity=false;
   // bool RbookType=false;
   // bool Rlibrary=false;
   // bool Rsurvey=false;
   // bool RsurveyItem=false;
   // bool RstudTransaction=false;
   // bool Rresearch=false;
   // bool Rprotocol=false;

  showDataAlert(String username, int id,context,
      bool? Rgradnumber,bool? Racademicyear,bool? RAstaff,bool? RMstaff,
      bool? Rlab,bool? RstudDistribution,bool? RstudActivity,bool? RbookType,
      bool? Rlibrary,bool? Rsurvey,bool? RsurveyItem,bool? RstudTransaction,
      bool? Rresearch,bool? Rprotocol

   ) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                const Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 10.0,
            ),
            title: Text(
              "Manage Tables for ${username}",
              style: const TextStyle(fontSize: 24.0),
            ),
            content: Container(
              height: 500,
              width: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(8.0),
                        child: FormField<String>(
                        builder: (FormFieldState<String> state) {
                        return Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text('العام الاكاديمي'),
                                      FlutterSwitch(
                                         width: 100.0,
                                         height: 40.0,
                                         valueFontSize: 20.0,
                                         toggleSize: 40.0,
                                         value: Racademicyear!,
                                         borderRadius: 30.0,
                                         padding: 8.0,
                                         showOnOff: true,
                                         onToggle: (val) {
                                           state.setState(() {
                                             Racademicyear = val;
                                           });
                                         },
                                       ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('اعضاء هيئة التدريس'),
                                      FlutterSwitch(
                                        width: 100.0,
                                        height: 40.0,
                                        valueFontSize: 20.0,
                                        toggleSize: 40.0,
                                        value: RAstaff!,
                                        borderRadius: 30.0,
                                        padding: 8.0,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          state.setState(() {
                                            RAstaff = val;

                                          });

                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text('الاداريين'),
                                      FlutterSwitch(
                                        width: 100.0,
                                        height: 40.0,
                                        valueFontSize: 20.0,
                                        toggleSize: 40.0,
                                        value: RMstaff!,
                                        borderRadius: 30.0,
                                        padding: 8.0,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          state.setState(() {
                                            RMstaff = val;

                                          });

                                        },
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('المعامل'),
                                      FlutterSwitch(
                                        width: 100.0,
                                        height: 40.0,
                                        valueFontSize: 20.0,
                                        toggleSize: 40.0,
                                        value: Rlab!,
                                        borderRadius: 30.0,
                                        padding: 8.0,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          state.setState(() {
                                            Rlab = val;

                                          });

                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text('توزيع الطلاب'),
                                      FlutterSwitch(
                                        width: 100.0,
                                        height: 40.0,
                                        valueFontSize: 20.0,
                                        toggleSize: 40.0,
                                        value: RstudDistribution!,
                                        borderRadius: 30.0,
                                        padding: 8.0,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          state.setState(() {
                                            RstudDistribution = val;

                                          });

                                        },
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('نشاط الطلاب'),
                                      FlutterSwitch(
                                        width: 100.0,
                                        height: 40.0,
                                        valueFontSize: 20.0,
                                        toggleSize: 40.0,
                                        value: RstudActivity!,
                                        borderRadius: 30.0,
                                        padding: 8.0,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          state.setState(() {
                                            RstudActivity = val;

                                          });

                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text('أنواع الكتب'),
                                      FlutterSwitch(
                                        width: 100.0,
                                        height: 40.0,
                                        valueFontSize: 20.0,
                                        toggleSize: 40.0,
                                        value: RbookType!,
                                        borderRadius: 30.0,
                                        padding: 8.0,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          state.setState(() {
                                            RbookType = val;

                                          });

                                        },
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('المكتبة'),
                                      FlutterSwitch(
                                        width: 100.0,
                                        height: 40.0,
                                        valueFontSize: 20.0,
                                        toggleSize: 40.0,
                                        value: Rlibrary!,
                                        borderRadius: 30.0,
                                        padding: 8.0,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          state.setState(() {
                                            Rlibrary = val;

                                          });

                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text('اعداد الخرجين'),
                                      FlutterSwitch(
                                        width: 100.0,
                                        height: 40.0,
                                        valueFontSize: 20.0,
                                        toggleSize: 40.0,
                                        value: Rgradnumber!,
                                        borderRadius: 30.0,
                                        padding: 8.0,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          state.setState(() {
                                            Rgradnumber = val;

                                          });

                                        },
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('الاستطلاعات'),
                                      FlutterSwitch(
                                        width: 100.0,
                                        height: 40.0,
                                        valueFontSize: 20.0,
                                        toggleSize: 40.0,
                                        value: Rsurvey!,
                                        borderRadius: 30.0,
                                        padding: 8.0,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          state.setState(() {
                                            Rsurvey = val;

                                          });

                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text('عناصر الاستطلاعات'),
                                      FlutterSwitch(
                                        width: 100.0,
                                        height: 40.0,
                                        valueFontSize: 20.0,
                                        toggleSize: 40.0,
                                        value: RsurveyItem!,
                                        borderRadius: 30.0,
                                        padding: 8.0,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          state.setState(() {
                                            RsurveyItem = val;

                                          });

                                        },
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('معاملات الطلاب'),
                                      FlutterSwitch(
                                        width: 100.0,
                                        height: 40.0,
                                        valueFontSize: 20.0,
                                        toggleSize: 40.0,
                                        value: RstudTransaction!,
                                        borderRadius: 30.0,
                                        padding: 8.0,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          state.setState(() {
                                            RstudTransaction = val;

                                          });

                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text('الابحاث'),
                                      FlutterSwitch(
                                        width: 100.0,
                                        height: 40.0,
                                        valueFontSize: 20.0,
                                        toggleSize: 40.0,
                                        value: Rresearch!,
                                        borderRadius: 30.0,
                                        padding: 8.0,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          state.setState(() {
                                            Rresearch = val;

                                          });

                                        },
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('البرتوكول'),
                                      FlutterSwitch(
                                        width: 100.0,
                                        height: 40.0,
                                        valueFontSize: 20.0,
                                        toggleSize: 40.0,
                                        value: Rprotocol!,
                                        borderRadius: 30.0,
                                        padding: 8.0,
                                        showOnOff: true,
                                        onToggle: (val) {
                                          state.setState(() {
                                            Rprotocol = val;

                                          });

                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),


                            ],
                          ),
                        );
                        }
                        ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // setState(() {
                            if(Racademicyear==false && RAstaff ==false && RMstaff==false && Rlab==false && RstudDistribution==false
                            && RstudActivity==false && RbookType==false && Rlibrary==false && Rgradnumber==false && Rsurvey==false && RsurveyItem==false
                            && RstudTransaction==false && Rresearch==false && Rprotocol==false) {
                              logincubit.get(context).PutUsers(
                                  id: id,
                                  role:  'guest',
                                  studact: RstudActivity,
                                  studtrans: RstudTransaction,
                                  studis: RstudDistribution,
                                  survey: Rsurvey,
                                  surveyitem: RsurveyItem,
                                  academicy: Racademicyear,
                                  astaff: RAstaff,
                                  mstaff: RMstaff,
                                  lab: Rlab,
                                  libraray: Rlibrary,
                                  research: Rresearch,
                                  protocol: Rprotocol,
                                  booktype: RbookType,
                                  gradnum: Rgradnumber
                              );
                            }
                            else if(Racademicyear==true && RAstaff ==true && RMstaff==true && Rlab==true && RstudDistribution==true
                                && RstudActivity==true && RbookType==true && Rlibrary==true && Rgradnumber==true && Rsurvey==true && RsurveyItem==true
                                && RstudTransaction==true && Rresearch==true && Rprotocol==true) {
                              logincubit.get(context).PutUsers(
                                  id: id,
                                  role:  'admin',
                                  studact: RstudActivity,
                                  studtrans: RstudTransaction,
                                  studis: RstudDistribution,
                                  survey: Rsurvey,
                                  surveyitem: RsurveyItem,
                                  academicy: Racademicyear,
                                  astaff: RAstaff,
                                  mstaff: RMstaff,
                                  lab: Rlab,
                                  libraray: Rlibrary,
                                  research: Rresearch,
                                  protocol: Rprotocol,
                                  booktype: RbookType,
                                  gradnum: Rgradnumber
                              );
                            }
                            else  {
                              logincubit.get(context).PutUsers(
                                  id: id,
                                  role:  'SuperVisor',
                                  studact: RstudActivity,
                                  studtrans: RstudTransaction,
                                  studis: RstudDistribution,
                                  survey: Rsurvey,
                                  surveyitem: RsurveyItem,
                                  academicy: Racademicyear,
                                  astaff: RAstaff,
                                  mstaff: RMstaff,
                                  lab: Rlab,
                                  libraray: Rlibrary,
                                  research: Rresearch,
                                  protocol: Rprotocol,
                                  booktype: RbookType,
                                  gradnum: Rgradnumber
                              );
                            }
                            //print(selectedValue);
                            //selectedValue = null;
                          // });
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.blue,
                          // fixedSize: Size(250, 50),
                        ),
                        child: const Text(
                          "Save",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

