import 'package:design_ui/models/modelMaktba.dart';
import 'package:design_ui/models/studentactivitymodel.dart';
import 'package:design_ui/models/yearsmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../constant/colors.dart';
import '../../../../models/graduatednumbrmodel.dart';
import '../../../../models/labmodel.dart';
import '../../../../models/studentdistribution.dart';
import '../../../../models/studenttransactionmodel.dart';
import '../../../../network/http/HttpGet.dart';


class Homecharts extends StatefulWidget {
  const Homecharts({Key? key}) : super(key: key);

  @override
  State<Homecharts> createState() => _HomechartsState();
}

class _HomechartsState extends State<Homecharts> {
  late Future<GraduatedNumber> graduatednumber;
  late Future<Library> library;
  late Future<Lab> lab;
  late Future<Year> year;
  late Future<StudentDistribution> studentdistrubution;
  late Future<StudentActivity> studentactivity;
  late Future<StudentTransaction> studenttransaction;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    graduatednumber= GetGraduatedNumbers();
    library=GetLibrary();
    lab=GetLab();
    year=GetYears();
    studentdistrubution=GetStudentDistrubtion();
    studentactivity=GetStudentActivity();
    studenttransaction=GetStudentTransaction();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
        future: Future.wait([graduatednumber,library,lab,year,studentactivity,studenttransaction]),
        builder: (context,AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            // List<Datum> data=[];
            // List.generate(snapshot.data!.data!.length, (index) {
            //   final x = snapshot.data!.data![index].attributes!.academicYear!.data!.attributes!.year.toString();
            //   dynamic y = snapshot.data!.data![index].attributes!.cs!.number.toString();
            //
            //   return data;
            // });
            // print(data);
            List<GraduatedNumberData> grad=snapshot.data![0]!.data;
            List<LibraryData> library=snapshot.data![1]!.data;
            List<LabData> lab=snapshot.data![2]!.data;
            List<YearData> year=snapshot.data![3].data;
            List<StudentActivityData> stuacti=snapshot.data![4]!.data;
            List<StudentTransactionData> stutrans=snapshot.data![5].data;

            return SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [
                  //Initialize the chart widget
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      labelIntersectAction: AxisLabelIntersectAction.multipleRows,


                    ),
                    // Chart title
                    title: ChartTitle(text: ' أعداد الخريجين لاخر اربع سنوات',textStyle:
                        GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,color: AppColors.blue)
                    ),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<GraduatedNumberData, String>>[
                      LineSeries<GraduatedNumberData, String>(
                          dataSource: grad,
                          xValueMapper: (GraduatedNumberData num, _) => (num.attributes?.academicYear?.data?.attributes?.Year==null)? '0':num.attributes?.academicYear?.data?.attributes?.Year,
                          yValueMapper: (GraduatedNumberData num, _) => (num.attributes?.CS?.Number==null)? 0:int.parse(num.attributes!.CS!.Number.toString()),

                          name: 'CS student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<GraduatedNumberData, String>(
                          dataSource: grad,
                          xValueMapper: (GraduatedNumberData num, _) => (num.attributes?.academicYear?.data?.attributes?.Year==null)? '0':num.attributes!.academicYear!.data!.attributes!.Year,
                          yValueMapper: (GraduatedNumberData num, _) => (num.attributes?.IS?.Number==null)? 0:int.parse(num.attributes!.IS!.Number.toString()),

                          name: 'IS student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<GraduatedNumberData, String>(
                          dataSource: grad,
                          xValueMapper: (GraduatedNumberData num, _) => (num.attributes?.academicYear?.data?.attributes?.Year==null)? '0':num.attributes!.academicYear!.data!.attributes!.Year,
                          yValueMapper: (GraduatedNumberData num, _) => (num.attributes?.AI?.Number==null)? 0:int.parse(num.attributes!.AI!.Number.toString()),

                          name: 'AI student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<GraduatedNumberData, String>(
                          dataSource: grad,
                          xValueMapper: (GraduatedNumberData num, _) => (num.attributes?.academicYear?.data?.attributes?.Year==null)? '0':num.attributes!.academicYear!.data!.attributes!.Year,
                          yValueMapper: (GraduatedNumberData num, _) => (num.attributes?.NI?.Number==null)? 0:int.parse(num.attributes!.NI!.Number.toString()),

                          name: 'NI student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),

                    ],
                  ),
                  Divider(thickness: 2,color: AppColors.orange,),
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      labelIntersectAction: AxisLabelIntersectAction.hide,
                      maximumLabelWidth: 80,

                      //labelRotation: 280

                    ),
                    // Chart title
                    title: ChartTitle(text: ' أعداد الكتب لأخر اربع سنوات',
                    textStyle:
                        GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,color: AppColors.blue)
                    ),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<LibraryData, String>>[
                      BarSeries<LibraryData, String>(
                          dataSource: library,
                          xValueMapper: (LibraryData num, _) => (num.attributes?.bookType?.data?.attributes?.Type==null)? '_':num.attributes?.bookType?.data?.attributes?.Type,
                          yValueMapper: (LibraryData num, _) => (num.attributes?.Number?.toString()==null)? 0:int.parse(num.attributes!.Number!.toString()),

                          name: '',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),

                    ],
                  ),
                  Divider(thickness: 2,color: AppColors.orange,),
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                        labelIntersectAction: AxisLabelIntersectAction.multipleRows,
                        labelRotation: 280

                    ),
                    // Chart title
                    title: ChartTitle(text: ' أعداد ألاجهزة فى المعامل',
                        textStyle:
                        GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,color: AppColors.blue)),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<LabData, String>>[
                      LineSeries<LabData, String>(
                          dataSource: lab,
                          xValueMapper: (LabData num, _) => num.attributes!.LabNumber,
                          yValueMapper: (LabData num, _) => int.parse(num.attributes!.PCnumber.toString()),

                          name: 'PC Numbers',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),

                    ],
                  ),
                  Divider(thickness: 2,color: AppColors.orange,),
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                        labelIntersectAction: AxisLabelIntersectAction.multipleRows,
                        labelRotation: 280

                    ),
                    // Chart title
                    title: ChartTitle(text: 'أعداد الابحاث لأخر اربع سنوات',
                        textStyle:
                        GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,color: AppColors.blue)
                    ),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<YearData, String>>[
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => num.attributes!.Year,
                          yValueMapper: (YearData num, _) => int.parse(num.attributes!.research!.data!.length.toString()),

                          name: 'Research Numbers',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),

                    ],
                  ),
                  Divider(thickness: 2,color: AppColors.orange,),
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      labelIntersectAction: AxisLabelIntersectAction.multipleRows,


                    ),
                    // Chart title
                    title: ChartTitle(text: '  توزيع طلاب الفرقة الاولى لأخر اربع سنوات',
                        textStyle:
                        GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,color: AppColors.blue)),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<YearData, String>>[
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes?.Year.toString(),
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![0]!.attributes!.Male!.toString()),

                          name: 'male student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes?.Year.toString(),
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![0]!.attributes!.Female!.toString()),

                          name: 'female student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes?.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![0]!.attributes!.CS!.Number.toString()),

                          name: 'CS student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes?.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![0]!.attributes!.IS!.Number.toString()),

                          name: 'IS student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) =>(num.attributes?.Year==null)? '0' : num.attributes!.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![0]!.attributes!.AI!.Number.toString()),

                          name: 'AI student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes?.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![0]!.attributes!.NI!.Number.toString()),

                          name: 'NI student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes?.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![0]!.attributes!.General!.Number.toString()),

                          name: 'General student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),



                    ],
                  ),
                  Divider(thickness: 2,color: AppColors.orange,),
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      labelIntersectAction: AxisLabelIntersectAction.multipleRows,


                    ),
                    // Chart title
                    title: ChartTitle(text: '  توزيع طلاب الفرقة الثانية لأخر اربع سنوات',
                        textStyle:
                        GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,color: AppColors.blue)),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<YearData, String>>[
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes?.Year.toString(),
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![1]!.attributes!.Male.toString()),

                          name: 'male student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year.toString(),
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![1]!.attributes!.Female!.toString()),

                          name: 'female student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![1]!.attributes!.CS!.Number.toString()),

                          name: 'CS student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![1]!.attributes!.IS!.Number.toString()),

                          name: 'IS student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![1]!.attributes!.AI!.Number.toString()),

                          name: 'AI student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![1]!.attributes!.NI!.Number.toString()),

                          name: 'NI student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![1]!.attributes!.General!.Number.toString()),

                          name: 'General student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),



                    ],
                  ),
                  Divider(thickness: 2,color: AppColors.orange,),
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      labelIntersectAction: AxisLabelIntersectAction.multipleRows,


                    ),
                    // Chart title
                    title: ChartTitle(text: '  توزيع طلاب الفرقة الثالثة لأخر اربع سنوات',textStyle:
                    GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,color: AppColors.blue)),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<YearData, String>>[
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year.toString(),
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![2]!.attributes!.Male.toString()),

                          name: 'male student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year.toString(),
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![2]!.attributes!.Female!.toString()),

                          name: 'female student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![2]!.attributes!.CS!.Number.toString()),

                          name: 'CS student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![2]!.attributes!.IS!.Number.toString()),

                          name: 'IS student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![2]!.attributes!.AI!.Number.toString()),

                          name: 'AI student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![2]!.attributes!.NI!.Number.toString()),

                          name: 'NI student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![2]!.attributes!.General!.Number.toString()),

                          name: 'General student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),



                    ],
                  ),
                  Divider(thickness: 2,color: AppColors.orange,),
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      labelIntersectAction: AxisLabelIntersectAction.multipleRows,


                    ),
                    // Chart title
                    title: ChartTitle(text: '  توزيع طلاب الفرقة الرابعه لأخر اربع سنوات',textStyle:
                    GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,color: AppColors.blue)),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<YearData, String>>[
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes?.Year.toString(),
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![3]!.attributes!.Male.toString()),

                          name: 'male student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes?.Year.toString(),
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![3]!.attributes!.Female!.toString()),

                          name: 'female student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![3]!.attributes!.CS!.Number.toString()),

                          name: 'CS student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![3]!.attributes!.IS!.Number.toString()),

                          name: 'IS student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![3]!.attributes!.AI!.Number.toString()),

                          name: 'AI student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![3]!.attributes!.NI!.Number.toString()),

                          name: 'NI student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),
                      LineSeries<YearData, String>(
                          dataSource: year,
                          xValueMapper: (YearData num, _) => (num.attributes?.Year==null)? '0' :num.attributes!.Year,
                          yValueMapper: (YearData num, _) => (num.attributes?.studentDistributions?.data?.isEmpty==true)? 0 :int.parse(num.attributes!.studentDistributions!.data![3]!.attributes!.General!.Number.toString()),

                          name: 'General student',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),



                    ],
                  ),
                  Divider(thickness: 2,color: AppColors.orange,),
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      labelIntersectAction: AxisLabelIntersectAction.hide,
                      maximumLabelWidth: 80,

                      //labelRotation: 280

                    ),
                    // Chart title
                    title: ChartTitle(text: 'الأنشطة لأخر اربع سنوات',textStyle:
                    GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,color: AppColors.blue)),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<StudentActivityData, String>>[
                      BarSeries<StudentActivityData, String>(
                          dataSource: stuacti,
                          xValueMapper: (StudentActivityData num, _) => num.attributes!.Year!.data!.attributes!.Year,
                          yValueMapper: (StudentActivityData num, _) => int.parse(num.attributes!.Total.toString()),

                          name: '',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),

                    ],
                  ),
                  Divider(thickness: 2,color: AppColors.orange,),
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      labelIntersectAction: AxisLabelIntersectAction.hide,
                      maximumLabelWidth: 80,

                      //labelRotation: 280

                    ),
                    // Chart title
                    title: ChartTitle(text: 'معاملات الطلاب لأخر اربع السنوات',
                        textStyle:
                        GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,color: AppColors.blue)
                    ),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<StudentTransactionData, String>>[
                      BarSeries<StudentTransactionData, String>(
                          dataSource: stutrans,
                          xValueMapper: (StudentTransactionData num, _) => (num.attributes?.surveyItem?.data?.attributes?.Description==null)? '_':num.attributes?.surveyItem?.data?.attributes?.Description.toString(),
                          yValueMapper: (StudentTransactionData num, _) => (num.attributes?.Percentage?.toString()==null)? 0:int.parse(num.attributes!.Percentage.toString()),

                          name: '',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)),

                    ],
                  ),

















                ]),
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
        },
      ),
    );}
}



// class _SalesData {
//   _SalesData(this.year, this.sales);
//
//   final String year;
//   final double sales;
// }