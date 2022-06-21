import 'package:design_ui/bloc/home/homecubit.dart';
import 'package:design_ui/bloc/home/homestate.dart';
import 'package:design_ui/models/studentactivitymodel.dart';
import 'package:design_ui/modules/Drawer/drawer.dart';
import 'package:design_ui/modules/datialesHomeScreen/detailshome.dart';
import 'package:design_ui/network/http/HttpDelete.dart';
import 'package:design_ui/network/http/HttpGet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/colors.dart';
import '../Edit/AddEditStudentActivityScreen.dart';

class NashatAtolap extends StatelessWidget {
   NashatAtolap({Key? key}) : super(key: key);

  late Future<StudentActivity> studentactivity;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homecubit,qualityhomestates>(
        listener: (context,state){},
      builder: (context, state) {
        studentactivity = GetStudentActivity();
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
             color: Color(0xFFF1770D),
           ),
         ),
         titleSpacing: 0,
         title: const Text(
           'نشاط الطلاب',
           style:
           TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFF1770D)),
         ),
       ),
       body: FutureBuilder<StudentActivity>(
         future: studentactivity,
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
                         columnSpacing: 50.0,
                         dataRowHeight: 60,
                         showBottomBorder: true,
                         columns: const [
                           DataColumn(label: Text('السنة',style: TextStyle(color: AppColors.orange))),
                           DataColumn(label: Text(' ')),
                           DataColumn(label: Text('العدد',style: TextStyle(color: AppColors.orange))),
                           DataColumn(label: Text(' ')),
                           DataColumn(label: Text('المجموع',style: TextStyle(color: AppColors.orange))),
                           DataColumn(label: Text(' ')),
                           DataColumn(label: Text('النسبة',style: TextStyle(color: AppColors.orange))),
                           DataColumn(label: Text(' ')),
                           DataColumn(
                             label: Text('Delete',style: TextStyle(color: AppColors.orange)),
                           ),
                           DataColumn(label: Text(' ')),
                         ],
                         rows:
                         List.generate(snapshot.data!.data!.length, (index) {
                           final y = snapshot.data?.data?[index]?.attributes?.Year?.data?.attributes?.Year
                               .toString();
                           final x = (snapshot.data?.data?[index]?.attributes?.Number==null)? '0':snapshot.data?.data?[index]?.attributes?.Number
                               .toString();
                           final z = (snapshot.data?.data?[index]?.attributes?.Total ==null)? '0':snapshot.data?.data?[index]?.attributes?.Total.toString();
                           final a =( snapshot.data?.data?[index]?.attributes?.Percentage ==null)?'0': snapshot.data?.data?[index]?.attributes?.Percentage.toString();

                           return DataRow(
                               cells: [
                                 DataCell(Container(child: (y == null) ? Text("0") :Text('${y}'))),
                                 const DataCell(VerticalDivider(
                                   thickness: 3.0,
                                   color: AppColors.blue,
                                 )),
                                 DataCell(Container(child: (x == null) ? Text("0") :Text("${x}"))),
                                 const DataCell(VerticalDivider(
                                   thickness: 3.0,
                                   color: AppColors.blue,
                                 )),
                                 DataCell(Container(child: Text('${z}'))),
                                 const DataCell( VerticalDivider(
                                   thickness: 3.0,
                                   color: AppColors.blue,
                                 )),
                                 DataCell(Container(child:Text('${a}%'))),
                                 const DataCell( VerticalDivider(
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
                                            homecubit.get(context).DeleteStudentActivity(
                                                 id: snapshot.data!.data![index]?.id);
                                             studentactivity =
                                                 GetStudentActivity();
                                           // });
                                         }))),
                                 const DataCell( VerticalDivider(
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
                                               AddEditStudentActivityScreen(
                                                   object: snapshot
                                                       .data!.data![index])));
                                 });
                               // });
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
                     builder: (context) => const AddEditStudentActivityScreen()));
           // });
         },
         backgroundColor: AppColors.blue,
         child: const Icon(Icons.add),
       ),
     );
    },);
  }
}
