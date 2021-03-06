import 'package:design_ui/bloc/home/homecubit.dart';
import 'package:design_ui/bloc/home/homestate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../components/custom button.dart';
import '../../components/text from.dart';
import '../../constant/colors.dart';
import '../../models/modelStaff.dart';
import '../../network/http/HttpGet.dart';

import '../ScreenPageDrawer/العمال الاكادميين .dart';

class AddEditAstaffScreen extends StatefulWidget {
  const AddEditAstaffScreen({Key? key, this.object}) : super(key: key);
  final Datum? object;

  @override
  _AddEditAstaffScreenState createState() => _AddEditAstaffScreenState();
}

class _AddEditAstaffScreenState extends State<AddEditAstaffScreen> {
  @override
  TextEditingController _NameController = TextEditingController();
  TextEditingController _JobController = TextEditingController();

  late Future<Astaff> astaff;

  String AlertText = ' ';
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    astaff = GetAstaff();

    _NameController =
        TextEditingController(text: widget.object?.attributes!.name);
    _JobController =
        TextEditingController(text: widget.object?.attributes!.job);

  }

  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: const Color(0xFF054978),
              leadingWidth: 40,
              leading: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
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
                      'أضف الى العامليين',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFF1770D)),
                    )
                  : const Text(
                      'تعديل العامليين',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFF1770D)),
                    )),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  DefaultTextField(
                      controller: _NameController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'ادخل بعض البيانات';
                        }
                        return null;
                      },
                      text: 'الأسم'),
                  const SizedBox(
                    height: 30,
                  ),
                  DefaultTextField(
                      controller: _JobController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'ادخل بعض البيانات';
                        }
                        return null;
                      },
                      text: 'المسمى الوظيفى'),
                  const SizedBox(
                    height: 30,
                  ),
                  DefaultButton(
                    text: (widget.object?.id == null) ? 'أضف' : 'تعديل',
                    color: AppColors.blue,
                    onpressed: () {
                      setState(() {
                        final FormState? form = formKey.currentState;
                        if (widget.object?.id == null) {
                          if (form!.validate()) {
                            homecubit.get(context).PostAstaff(
                                name: _NameController.text,
                                job: _JobController.text);
                            AlertText = 'تم الاضافة';
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new AL3omal()));
                          } else {
                            AlertText = 'ادخل بعض البيانات';
                          }
                        } else {
                          if (form!.validate()) {
                            homecubit.get(context).PutAstaff(
                                id: widget.object!.id!,
                                name: _NameController.text,
                                job: _JobController.text);
                            AlertText = 'تم التعديل';
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new AL3omal()));
                          }
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('${AlertText}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
