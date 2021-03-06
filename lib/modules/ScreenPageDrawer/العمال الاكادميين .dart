import 'package:design_ui/bloc/home/homecubit.dart';
import 'package:design_ui/bloc/home/homestate.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constant/colors.dart';
import '../../models/modelStaff.dart';
import '../Edit/AddEditAstaffScreen.dart';

class AL3omal extends StatelessWidget {
  AL3omal({Key? key}) : super(key: key);

  late Future<Astaff> astaff;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        astaff = GetAstaff();

        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF054978),
            leadingWidth: 40,
            leading: Padding(
              padding: const EdgeInsetsDirectional.only(start: 10),
              child: IconButton(
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
                  color: Color(0xFFF1770D),
                ),
              ),
            ),
            titleSpacing: 0,
            title: const Text(
              'أعضاء هيئة التدريس',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: const Color(0xFFF1770D)),
            ),
          ),
          body: FutureBuilder<Astaff>(
            future: astaff,
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
                            dataRowHeight: 50,
                            showBottomBorder: true,
                            columns: const [
                              DataColumn(label: Text('العدد',style: TextStyle(
                                color: AppColors.orange,
                              ),)),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('الأسم',style: TextStyle(
                                color: AppColors.orange,
                              ),)),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('المسمى الوظيفى',style: TextStyle(
                                color: AppColors.orange,
                              ),)),
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
                                  .data?.data?[index].attributes?.name
                                  .toString();
                              final x = snapshot
                                  .data?.data?[index].attributes?.job
                                  .toString();
                              final z = index + 1;

                              return DataRow(
                                  cells: [
                                    DataCell(Container(child: Text('${z}'))),
                                    const DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(child: (y == null) ? Text("0") :Text("${y}")),
                                        onTap: () {}),
                                    const DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(child:(x == null) ? Text("0") : Text('${x}'))),
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
                                                  .DeleteAstaff(
                                                      id: snapshot.data!
                                                          .data![index].id);
                                              astaff = GetAstaff();

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
                                                AddEditAstaffScreen(
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
                      builder: (context) => const AddEditAstaffScreen()));
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
