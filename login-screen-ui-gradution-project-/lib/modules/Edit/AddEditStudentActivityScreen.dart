import 'package:design_ui/models/studentactivitymodel.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:design_ui/network/http/HttpPost.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../components/custom button.dart';
import '../../components/text from.dart';
import '../../constant/colors.dart';
import '../../models/oneyearmodel.dart';
import '../../network/http/HttpSearch.dart';
class AddEditStudentActivityScreen extends StatefulWidget {
  const AddEditStudentActivityScreen({Key? key}) : super(key: key);

  @override
  _AddEditStudentActivityScreenState createState() => _AddEditStudentActivityScreenState();
}

class _AddEditStudentActivityScreenState extends State<AddEditStudentActivityScreen> {
  TextEditingController _TotalController= TextEditingController();
  TextEditingController _NumberController= TextEditingController();
  TextEditingController _PercentageController= TextEditingController();


  late Future<StudentActivity> studentactivity;
  late Future<Oneyear> year;
  String AlertText= ' ';
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String? selectedValue;
  late int? id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studentactivity = GetStudentActivity();
    year=GetOneYears();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF054978),
          leadingWidth: 40,
          leading:Padding(padding: EdgeInsetsDirectional.only(start: 10),
            child:IconButton(onPressed: ()
            {
              Navigator.pop(context);

            },icon: Icon(Icons.arrow_back_ios,color: Color(0xFFF1770D),),
            ),),
          titleSpacing: 0,

          title:Text('أضف الى الانشطة',style: TextStyle(fontWeight: FontWeight.bold,
              color: Color(0xFFF1770D)),),
        ),
        body: FutureBuilder<Oneyear>(
            future: year,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Datumm>? years = snapshot.data!.data;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(children: [
                        SizedBox(height: 30,),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<dynamic>(
                            isExpanded: true,
                            hint: Row(
                              children: const [
                                Expanded(
                                  child: Text(
                                    'السنة',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ), items: years?.map((item) => DropdownMenuItem(
                            value: item.attributes!.year,
                            child: Text(
                              ("${item.attributes!.year.toString()}"),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blue,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                              .toList(),
                            value: selectedValue,
                            onChanged: (value)  {
                              setState(() {
                                selectedValue = value as String;

                                Future<int> data = SearchOneYear(value.toString());
                                print(data);
                                data.then((int value) => (id=value))
                                    .catchError((e) => 499);
                                // id = data;

                              });
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                            ),
                            iconSize: 14,
                            iconEnabledColor: AppColors.blue,
                            iconDisabledColor: Colors.grey,
                            buttonHeight: 70,
                            buttonWidth: double.infinity,
                            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black45,
                              ),
                              color: Colors.white,
                            ),
                            buttonElevation: 0,
                            itemHeight: 45,
                            itemPadding: const EdgeInsets.only(left: 14, right: 14),
                            dropdownMaxHeight: 200,
                            dropdownWidth: 350,
                            dropdownPadding: EdgeInsets.symmetric(horizontal: 10),
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            dropdownElevation: 8,
                            scrollbarRadius: const Radius.circular(40),
                            scrollbarThickness: 6,
                            scrollbarAlwaysShow: true,
                            offset: const Offset(-20, 0),
                          ),
                        ),
                        SizedBox(height: 30,),
                        DefaultTextField(
                            controller: _NumberController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل بعض البيانات';
                              }
                              return null;
                            },
                            text: 'العدد'

                        ),
                        SizedBox(height: 30,),
                        DefaultTextField(
                            controller: _TotalController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل بعض البيانات';
                              }
                              return null;
                            },
                            text: 'المجموع'

                        ),
                        SizedBox(height: 30,),
                        DefaultTextField(
                            controller: _PercentageController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'ادخل بعض البيانات';
                              }
                              return null;
                            },
                            text: 'النسبة'

                        ),
                        SizedBox(height: 30,),
                        DefaultButton(
                          text: 'أضف',
                          color: AppColors.blue,
                          onpressed:() {
                            setState(() {

                              final FormState? form = formKey.currentState;
                              if(form!.validate())
                              {
                                studentactivity=PostStudentActivity(_TotalController.text, _NumberController.text, _PercentageController.text, id!);
                                AlertText = 'تم الاضافة';
                                Navigator.pop(context);

                              }
                              else
                              {
                                AlertText = 'ادخل بعض البيانات';
                              }

                            });

                          },
                        ),
                        SizedBox(height: 10,),
                        Text('${AlertText}'),
                      ],),
                    ),
                  ),
                );
              }
              else if (snapshot.hasError) {
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
            }
        )



    );
  }
}