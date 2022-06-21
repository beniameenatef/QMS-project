import 'package:design_ui/bloc/home/homecubit.dart';
import 'package:design_ui/bloc/home/homestate.dart';
import 'package:design_ui/models/graduatednumbrmodel.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/ScreenPageDrawer/%D8%A7%D9%84%D8%B9%D9%85%D8%A7%D9%84%20%D8%A7%D9%84%D8%A7%D9%83%D8%A7%D8%AF%D9%85%D9%8A%D9%8A%D9%86%20.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/network/http/HttpDelete.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/colors.dart';
import '../Edit/AddEditGraduatedNumberScreen.dart';

class a3dadAl5rgeen extends StatelessWidget {
  a3dadAl5rgeen({Key? key}) : super(key: key);

  late Future<GraduatedNumber> graduatednumber;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
        builder: (context, state) {
          graduatednumber = GetGraduatedNumbers();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF054978),
              leadingWidth: 35,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppDrawer(child: detailshomePage()),
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFFF1770D),
                ),
              ),
              titleSpacing: 0,
              title: Text(
                'أعداد الخرجين',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFFF1770D)),
              ),
            ),
            body: FutureBuilder<GraduatedNumber>(
              future: graduatednumber,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return InteractiveViewer(
                    constrained: false,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            DataTable(
                              columnSpacing: 50.0,
                              headingRowColor: MaterialStateColor.resolveWith(
                                    (states) {
                                  return AppColors.blue;
                                },
                              ),
                              headingRowHeight: 40,
                              dividerThickness: 3,
                              dataRowHeight: 80,
                              showBottomBorder: true,
                              columns: const [
                                DataColumn(label: Text('Year',style: TextStyle(
                                  color: AppColors.orange,
                                ),),),
                                DataColumn(label: Text(' ')),
                                DataColumn(label: Text('CS',style: TextStyle(
                                  color: AppColors.orange,
                                ),)),
                                DataColumn(label: Text(' ')),
                                DataColumn(label: Text('IS',style: TextStyle(
                                  color: AppColors.orange,
                                ),)),
                                DataColumn(label: Text(' ')),
                                DataColumn(label: Text('AI',style: TextStyle(
                                  color: AppColors.orange,
                                ),)),
                                DataColumn(label: Text(' ')),
                                DataColumn(
                                  label: Text('NI',style: TextStyle(
                                    color: AppColors.orange,
                                  ),),
                                ),
                                DataColumn(label: Text(' ')),
                                DataColumn(
                                  label: Text('Delete',style: TextStyle(
                                    color: AppColors.orange,
                                  ),),
                                ),
                                DataColumn(label: Text(' ')),
                              ],
                              rows: List.generate(snapshot.data!.data!.length,
                                  (index) {
                                dynamic x = snapshot.data?.data?[index]?.attributes?.academicYear?.data?.attributes?.Year.toString();
                                dynamic y = snapshot.data?.data?[index]!.attributes?.CS?.Number.toString();
                                dynamic z = snapshot.data?.data?[index]?.attributes?.IS?.Number.toString();
                                dynamic a = snapshot.data?.data?[index]!.attributes?.AI?.Number.toString();
                                dynamic b = snapshot.data?.data?[index]!.attributes?.NI?.Number.toString();
                                (x == null) ? print('') : print(x);
                                return DataRow(
                                    cells: [
                                      DataCell(Container(
                                          child: (x == null) ? Text("0") : Text("${x}"))),
                                      const DataCell(VerticalDivider(
                                        thickness: 3.0,
                                        color: AppColors.blue,
                                      )),
                                      DataCell(Container(
                                          child: (y == null) ? Text("0") : Text('${y}'))),
                                      const DataCell(VerticalDivider(
                                        thickness: 3.0,
                                        color: AppColors.blue,
                                      )),
                                      DataCell(Container(
                                          child: (z == null) ? Text("0") : Text("${z}"))),
                                      const DataCell(VerticalDivider(
                                        thickness: 3.0,
                                        color: AppColors.blue,
                                      )),
                                      DataCell(Container(
                                          child: (a == null) ? Text("0") : Text('${a}'))),
                                      const DataCell(VerticalDivider(
                                        thickness: 3.0,
                                        color: AppColors.blue,
                                      )),
                                      DataCell(Container(
                                          child: (b == null) ? Text("0") : Text('${b}'))),
                                      const DataCell(VerticalDivider(
                                        thickness: 3.0,
                                        color: AppColors.blue,
                                      )),
                                      DataCell(Container(
                                          child: IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: AppColors.blue,
                                        ),
                                        onPressed: () {
                                          homecubit
                                              .get(context)
                                              .DeleteGraduatedNumbers(
                                                  id: snapshot
                                                      .data!.data![index]!.id);
                                          graduatednumber =
                                              GetGraduatedNumbers();
                                        },
                                      ))),
                                      const DataCell(VerticalDivider(
                                        thickness: 3.0,
                                        color: AppColors.blue,
                                      )),
                                    ],
                                    onLongPress: () {
                                      // setState(() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddEditGraduatedNumberScreen(
                                                      object: snapshot.data!
                                                          .data![index])));
                                      // });
                                    });
                              }),
                            ),
                          ],
                        )),
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
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddEditGraduatedNumberScreen()));
                // });
              },
              backgroundColor: AppColors.blue,
              child: const Icon(Icons.add),
            ),
          );
        },
        listener: (context, state) {});
  }
}
