import 'package:design_ui/bloc/home/homecubit.dart';
import 'package:design_ui/bloc/home/homestate.dart';
import 'package:design_ui/models/studentdistribution.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/network/http/HttpDelete.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/colors.dart';
import '../Edit/AddEditStudentDistributionScreen.dart';

class Tawzee3Altolap extends StatelessWidget {
  Tawzee3Altolap({Key? key}) : super(key: key);

  late Future<StudentDistribution> studentdistriubtion;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        studentdistriubtion = GetStudentDistrubtion();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF054978),
            leadingWidth: 35,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AppDrawer(child: const detailshomePage()),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: const Color(0xFFF1770D),
              ),
            ),
            titleSpacing: 0,
            title: const Text(
              'توزيع الطلاب',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFFF1770D)),
            ),
          ),
          body: FutureBuilder<StudentDistribution>(
            future: studentdistriubtion,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return InteractiveViewer(
                  constrained: false,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
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
                              DataColumn(label: Text('السنة',style: TextStyle(
                                color: AppColors.orange,
                              ))),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('المستوى',style: TextStyle(
                                color: AppColors.orange,
                              ))),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('بنين',style: TextStyle(
                                color: AppColors.orange,
                              ))),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('بنات',style: TextStyle(
                                color: AppColors.orange,
                              ))),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('CS',style: TextStyle(
                                color: AppColors.orange,
                              ))),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('IS',style: TextStyle(
                                color: AppColors.orange,
                              ))),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('AI',style: TextStyle(
                                color: AppColors.orange,
                              ))),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('NI',style: TextStyle(
                                color: AppColors.orange,
                              ))),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('General',style: TextStyle(
                                color: AppColors.orange,
                              ))),
                              DataColumn(label: Text(' ')),
                              DataColumn(
                                label: Text('Delete',style: TextStyle(
                                  color: AppColors.orange,
                                )),
                              ),
                              DataColumn(label: Text(' ')),
                            ],
                            rows: List.generate(snapshot.data!.data!.length,
                                (index) {
                              final a = snapshot.data?.data?[index]?.attributes?.year?.data?.attributes?.Year.toString();
                              final b = snapshot.data?.data?[index]?.attributes?.Level.toString();
                              final c = snapshot.data?.data?[index]?.attributes?.CS?.Number.toString();
                              final d = snapshot.data?.data?[index]?.attributes?.IS?.Number.toString();
                              final e = snapshot.data?.data?[index]?.attributes?.AI?.Number.toString();
                              final f = snapshot.data?.data?[index]?.attributes?.NI?.Number.toString();
                              final g = snapshot.data?.data?[index]?.attributes?.General?.Number.toString();
                              final h = snapshot.data?.data?[index]?.attributes?.Male.toString();
                              final i = snapshot.data?.data?[index]?.attributes?.Female.toString();

                              return DataRow(
                                  cells: [
                                    DataCell(Container(child: (a == null) ? Text("0") :Text('${a}'))),
                                    const DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(child: (b == null) ? Text("0") :Text("${b}")),
                                        onTap: () {}),
                                    const DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(child:(h == null) ? Text("0") : Text('${h}'))),
                                    const DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(child: (i == null) ? Text("0") :Text('${i}'))),
                                    const DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(child: (c == null) ? Text("0") :Text('${c}'))),
                                    const DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(child: (d == null) ? Text("0") :Text('${d}'))),
                                    const DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(child: (e == null) ? Text("0") :Text('${e}'))),
                                    const DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(child: (f == null) ? Text("0") :Text('${f}'))),
                                    const DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(child: (g == null) ? Text("0") :Text('${g}'))),
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
                                              // setState(() {
                                              homecubit
                                                  .get(context)
                                                  .DeleteStudentDistrubtion(
                                                      id: snapshot.data!
                                                          .data![index]?.id);
                                              studentdistriubtion =
                                                  GetStudentDistrubtion();
                                              // });
                                            }))),
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
                                                AddEditStudentDistributionScreen(
                                                    object: snapshot
                                                        .data!.data![index])));
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
                      builder: (context) =>
                          const AddEditStudentDistributionScreen()));
              // });
            },
            backgroundColor: AppColors.blue,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
