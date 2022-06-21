import 'package:design_ui/bloc/home/homecubit.dart';
import 'package:design_ui/bloc/home/homestate.dart';
import 'package:design_ui/constant/colors.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/network/http/HttpDelete.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/modelMaktba.dart';
import '../../models/yearsmodel.dart';
import '../Edit/AddEditLibraryScreen.dart';

class Almaktba extends StatelessWidget {
  TextEditingController edit = TextEditingController();

  late Future<Year> year;
  late Future<Library>? library;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit, qualityhomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        library = GetLibrary();
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
              title: const Text(
                'المكتبة',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFFF1770D)),
              ),

                // InkWell(
                //   onTap: ()
                //   {
                //
                //   },
                //   child: Column(children: [
                //     Icon(Icons.edit),
                //     Text('Edit'),
                //
                //   ],),
                // )

            ),
            body: FutureBuilder<Library>(
              future: library,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //List<?>? Yearinfo = snapshot.data!.data!;
                  return InteractiveViewer(
                    constrained: false,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 20,
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
                            columns: [
                              DataColumn(label: Text('Year',style: TextStyle(
                                color: AppColors.orange,
                              ))),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('Book Type',style: TextStyle(
                                color: AppColors.orange,
                              ))),
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text('Number',style: TextStyle(
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
                              dynamic y = snapshot.data?.data?[index]?.attributes?.academicYear?.data?.attributes?.Year.toString();
                              dynamic x = snapshot.data?.data?[index]?.attributes?.bookType?.data?.attributes?.Type.toString();
                              dynamic z = snapshot.data?.data?[index]?.attributes?.Number;

                              return DataRow(
                                  cells: [
                                    DataCell(Container(
                                        child: (y == null) ? Text("0") :Text('${y}'))),
                                    DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(
                                        child: (x == null) ? Text("_") :Text('${x}'))),
                                    DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(
                                        child:(z == null) ? Text("0") : Text('${z}'))),
                                    DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                    DataCell(Container(
                                        child: IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              color: AppColors.blue,
                                            ),
                                            onPressed: () {
                                              // setState(() {
                                              homecubit
                                                  .get(context)
                                                  .DeleteLibrary(snapshot
                                                      .data!.data![index]?.id);
                                              // homecubit.get(context).GetLibrary();
                                              library = GetLibrary();

                                              // });
                                            }))),
                                    DataCell(VerticalDivider(
                                      thickness: 3.0,
                                      color: AppColors.blue,
                                    )),
                                  ],
                                  onLongPress: () {
                                    // setState(() {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>
                                            AddEditLibraryScreen(
                                                object:snapshot.data!.data![index])));
                                    // });
                                  });
                            }),
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
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // setState(() {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddEditLibraryScreen()));
                // MaterialPageRoute(builder: (context) => AddEditLibraryScreen()));
                // });
              },
              backgroundColor: AppColors.blue,
              child: const Icon(Icons.add),
            ));
      },
    );
  }
}
