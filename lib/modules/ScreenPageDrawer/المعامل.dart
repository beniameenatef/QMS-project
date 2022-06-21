import 'package:design_ui/bloc/home/homecubit.dart';
import 'package:design_ui/bloc/home/homestate.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constant/colors.dart';
import '../../models/labmodel.dart';
import '../../network/http/HttpGet.dart';
import '../Edit/AddEditLabScreen.dart';

class Alma3amel extends StatelessWidget {
  Alma3amel({Key? key}) : super(key: key);

  late Future<Lab> lab;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        lab = GetLab();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF054978),
            leadingWidth: 35,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppDrawer(child: const detailshomePage()),
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
              'المعامل',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFFF1770D)),
            ),
          ),
          body: FutureBuilder<Lab>(
            future: lab,
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
                            showBottomBorder: true,                            columns: const [
                              DataColumn(label: Text('العدد',style: TextStyle(
                                color: AppColors.orange,
                              ))),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('رقم المعمل',style: TextStyle(
                                color: AppColors.orange,
                              ))),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('عدد الاجهزة',style: TextStyle(
                                color: AppColors.orange,
                              ))),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('العامل المسئول',style: TextStyle(
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
                              final y = snapshot
                                  .data?.data?[index]?.attributes?.LabNumber
                                  .toString();
                              final x = snapshot
                                  .data?.data?[index]?.attributes?.PCnumber
                                  .toString();
                              final a = snapshot.data?.data?[index]?.attributes?.MID?.data?.attributes?.Name
                                  .toString();
                              final z = index + 1;

                              return DataRow(
                                  cells: [
                                    DataCell(Container(child: Text('${z}'))),
                                    const DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(child: (y == null) ? Text("0") :Text("${y}")),),
                                    const DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(child: (x == null) ? Text("0") :Text('${x}'))),
                                    const DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(child: (a == null) ? Text("_") :Text('${a}'))),
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
                                              homecubit.get(context).DeleteLab(
                                                  id: snapshot
                                                      .data!.data![index]?.id);
                                              lab = GetLab();

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
                                                AddEditLabScreen(
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddEditLabScreen()));
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
