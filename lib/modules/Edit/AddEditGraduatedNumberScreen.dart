import 'package:design_ui/bloc/home/homecubit.dart';
import 'package:design_ui/bloc/home/homestate.dart';
import 'package:design_ui/models/graduatednumbrmodel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/custom button.dart';
import '../../components/text from.dart';
import '../../constant/colors.dart';
import '../../models/oneyearmodel.dart';
import '../../network/http/HttpGet.dart';
import '../../network/http/HttpSearch.dart';

class AddEditGraduatedNumberScreen extends StatefulWidget {
  const AddEditGraduatedNumberScreen({Key? key, this.object}) : super(key: key);
  final GraduatedNumberData? object;

  @override
  _AddEditGraduatedNumberScreenState createState() =>
      _AddEditGraduatedNumberScreenState();
}

class _AddEditGraduatedNumberScreenState
    extends State<AddEditGraduatedNumberScreen> {
  TextEditingController _CSController = TextEditingController();
  TextEditingController _ISController = TextEditingController();
  TextEditingController _AIController = TextEditingController();
  TextEditingController _NIController = TextEditingController();

  late Future<Oneyear> year;
  late Future<GraduatedNumber> graduatednumber;
  String AlertText = ' ';
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String? selectedValue;
  late int? id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    year = GetOneYears();
    graduatednumber = GetGraduatedNumbers();
    _CSController =
        TextEditingController(text: widget.object?.attributes?.CS?.Number);
    _ISController =
        TextEditingController(text: widget.object?.attributes?.IS?.Number);
    _AIController =
        TextEditingController(text: widget.object?.attributes?.AI?.Number);
    _NIController =
        TextEditingController(text: widget.object?.attributes?.NI?.Number);
    selectedValue =
        widget.object?.attributes?.academicYear?.data?.attributes!.Year;
    id = widget.object?.attributes?.academicYear?.data?.id;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xFF054978),
                leadingWidth: 40,
                leading: Padding(
                  padding: EdgeInsetsDirectional.only(start: 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFFF1770D),
                    ),
                  ),
                ),
                titleSpacing: 0,
                title: (widget.object?.id == null)
                    ? const Text(
                        '?????? ?????? ?????????? ????????????????',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF1770D)),
                      )
                    : const Text(
                        '?????????? ?????????? ????????????????',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF1770D)),
                      ),
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
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2<dynamic>(
                                    isExpanded: true,
                                    hint: Row(
                                      children: const [
                                        Expanded(
                                          child: Text(
                                            '??????????',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items: years
                                        ?.map((item) => DropdownMenuItem(
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
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value as String;

                                        Future<int> data =
                                            SearchOneYear(value.toString());
                                        print(data);
                                        data
                                            .then((int value) => (id = value))
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
                                    buttonPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.black45,
                                      ),
                                      color: Colors.white,
                                    ),
                                    buttonElevation: 0,
                                    itemHeight: 45,
                                    itemPadding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    dropdownMaxHeight: 200,
                                    dropdownWidth: 350,
                                    dropdownPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
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
                                const SizedBox(
                                  height: 30,
                                ),
                                DefaultTextField(
                                    controller: _CSController,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return '???????? ?????? ????????????????';
                                      }
                                      return null;
                                    },
                                    text: 'CS'),
                                const SizedBox(
                                  height: 30,
                                ),
                                DefaultTextField(
                                    controller: _ISController,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return '???????? ?????? ????????????????';
                                      }
                                      return null;
                                    },
                                    text: 'IS'),
                                const SizedBox(
                                  height: 30,
                                ),
                                DefaultTextField(
                                    controller: _AIController,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return '???????? ?????? ????????????????';
                                      }
                                      return null;
                                    },
                                    text: 'AI'),
                                const SizedBox(
                                  height: 30,
                                ),
                                DefaultTextField(
                                    controller: _NIController,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return '???????? ?????? ????????????????';
                                      }
                                      return null;
                                    },
                                    text: 'NI'),
                                const SizedBox(
                                  height: 30,
                                ),
                                DefaultButton(
                                  text: (widget.object?.id == null)
                                      ? '??????'
                                      : '??????????',
                                  color: AppColors.blue,
                                  onpressed: () {
                                    setState(() {
                                      final FormState? form =
                                          formKey.currentState;
                                      if (widget.object?.id == null) {
                                        if (form!.validate()) {
                                          homecubit
                                              .get(context)
                                              .PostGraduatedNumber(
                                                  year: id!,
                                                  cs: _CSController.text,
                                                  Is: _ISController.text,
                                                  ai: _AIController.text,
                                                  ni: _NIController.text);
                                          AlertText = '???? ??????????????';
                                          Navigator.pop(context);
                                        } else {
                                          AlertText = '???????? ?????? ????????????????';
                                        }
                                      } else {
                                        if (form!.validate()) {
                                          homecubit
                                              .get(context)
                                              .PutGraduatedNumber(
                                                  id: widget.object!.id!,
                                                  year: id!,
                                                  cs: _CSController.text,
                                                  Is: _ISController.text,
                                                  ai: _AIController.text,
                                                  ni: _NIController.text);
                                          AlertText = '???? ??????????????';
                                          Navigator.pop(
                                            context,
                                          );
                                        }
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('${AlertText}'),
                              ],
                            ),
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
                            Text('??????????'),
                          ],
                        ),
                      );
                    }
                  }));
        },
        listener: (context, state) {});
  }
}
