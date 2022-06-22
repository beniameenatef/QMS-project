import 'package:design_ui/constant/colors.dart';
import 'package:design_ui/models/Research.dart';
import 'package:design_ui/models/protocolmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../models/Mstaffmodel.dart';
import '../../../../models/graduatednumbrmodel.dart';
import '../../../../models/labmodel.dart';
import '../../../../models/modelMaktba.dart';
import '../../../../models/modelStaff.dart';
import '../../../../models/studentactivitymodel.dart';
import '../../../../models/studentdistribution.dart';
import '../../../../models/studenttransactionmodel.dart';
import '../../../../models/yearsmodel.dart';
import '../../../../network/http/HttpGet.dart';

class Homeoverview extends StatefulWidget {
  const Homeoverview({Key? key}) : super(key: key);

  @override
  State<Homeoverview> createState() => _HomeoverviewState();
}

class _HomeoverviewState extends State<Homeoverview> {
  late Future<Year> year;
  late Future<Library> library;
  late Future<Astaff> astaff;
  late Future<Mstaff> mstaff;
  late Future<Lab> lab;
  late Future<GraduatedNumber> graduatednumber;
  late Future<StudentDistribution> studentdistriubtion;
  late Future<StudentTransaction> studenttransaction;
  late Future<Researches> research;
  late Future<StudentActivity> studentactivity;
  late Future<Protocol> protocol;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    library = GetLibrary();
    year = GetYears();
    astaff = GetAstaff();
    mstaff = GetMstaff();
    lab = GetLab();
    graduatednumber = GetGraduatedNumbers();
    studentdistriubtion = GetStudentDistrubtion();
    studenttransaction = GetStudentTransaction();
    research=GetResearch();
    studentactivity=GetStudentActivity();
    protocol=Getprotocol();

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        library,
        year,
        astaff,
        mstaff,
        lab,
        studentdistriubtion,
        graduatednumber,
        studenttransaction,
        research,
        studentactivity,
        protocol
      ]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          List<YearData>? Yearinfo = snapshot.data![1].data!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   Container(
                     decoration: BoxDecoration(
                       color: Colors.white10.withOpacity(0.5),
                       borderRadius: BorderRadius.circular(15),
                     ),
                     child: Column(
                       children: [
                         Text(
                          "الخطة الإستراتيجية للكلية ",
                          style: GoogleFonts.cairo(fontWeight:FontWeight.bold,fontSize: 20,color: AppColors.blue ),
                  ),
                         const SizedBox(
                           height: 10,
                         ),
                         Text("متابعة الخطة التنفيذية لتطبيق استراتيجية الكلية ",
                             textAlign: TextAlign.end,
                             style:
                             GoogleFonts.cairo(fontWeight:FontWeight.bold,fontSize: 15,color: AppColors.blue )),
                         Text(
                           "تهتم الكلية بتحقيق الغايات النهائية والأهداف الاستراتيجية حيث شملت الخطة التنفيذية كافة العناصر الأساسية مثل الأهداف الاستراتيجية، وبرامج العمل والأنشطة التى تحققها، مسئولية التنفيذ طبقا للمسئوليات المحددة بالهيكل التنظيمي والتوصيف الوظيفي ، الجدول الزمني للتنفيذ، الميزانية المقترحة، ومؤشرات الأداء لكل نشاط، كما تضمنت أيضا آليات التنفيذ والمتابعة والتقييم لجميع مراحل تنفيذ الخطة ",
                           textAlign: TextAlign.end,
                           style: GoogleFonts.cairo(fontWeight:FontWeight.w500,fontSize: 15, ),
                         ),
                       ],
                     ),
                   ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(height: 1,color: AppColors.orange,thickness: 2,),

                   SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white10.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Text(
                            "القيادة والحوكمة  ",
                            style: GoogleFonts.cairo(fontWeight:FontWeight.bold,fontSize: 20,color: AppColors.blue )
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "تطرح الكلية سنوياً نموذج استطلاع رأي اعضاء هيئه التدريس والهيئه المعاونه عن نمط القياده، كما تطرح نموذج استطلاع رأي الجهاز الاداري عن نمط القياده  ",
                          textAlign: TextAlign.end,
                          style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(height: 1,color: AppColors.orange,thickness: 2,),

                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white10.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "المصداقية والآخلاقيات   ",
                          style: GoogleFonts.cairo(fontSize: 20 ,fontWeight: FontWeight.bold,color: AppColors.blue),
                        ),
                        Text(
                            "فاعلية الإجراءات التى تتبعها الكلية لحماية الملكية الفكرية ",
                            textAlign: TextAlign.end,
                            style:
                            GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,color: AppColors.blue)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            '''
١.إستمرارية التوعية بدليل حقوق الملكية الفكرية الصادر على مستوى الجامعة
٢.عقد ورش عمل عن حقوق الملكيه الفكريه للآطراف المختلفة داخل الكلية 
٣.القياس الدورى لإنطباعات الأطراف المعنية عن فاعلية الإجراءات
 التى تتبعها الكلية لحماية الملكية الفكرية، وذلك عن طريق استبيان رضا أعضاء هيئة التدريس، وقد أظهرت نتائج التحليل أن حوالي(82%) من المشاركين موافقين على فاعلية الإجراءات التى تتبعها الكلية لحماية الملكية الفكرية وأهميتها لديهم. وتتخذ الكلية في ضوء نتائج هذا الاستبيان الإجراءات التصحيحية اللازمة وفق نتائج القياس 
                       ''',
                            textAlign: TextAlign.end,
                            style:
                            GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.w500)
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(height: 1,color: AppColors.orange,thickness: 2,),

                  SizedBox(
                    height: 10,
                  ),
                   Container(
                     decoration: BoxDecoration(
                       color: Colors.white10.withOpacity(0.5),
                       borderRadius: BorderRadius.circular(15),
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                       Text(
                           "المكتبة المركزية بجامعة 6 أكتوبر    ",
                           style: GoogleFonts.cairo(fontSize: 20 ,fontWeight: FontWeight.bold,color: AppColors.blue)
                       ),
                       Text(
                         ":الكتب والمراجع الدورية",
                         textAlign: TextAlign.right,
                         style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold),
                       ),
                       const SizedBox(
                         height: 20,
                       ),
                       DataTable(
                         columnSpacing: 38.0,
                         headingRowColor: MaterialStateColor.resolveWith(
                               (states) {
                             return AppColors.blue;
                           },
                         ),
                         headingRowHeight: 40,
                         dividerThickness: 3,
                         //dataRowHeight: 80,
                         showBottomBorder: true,
                         columns: [
                           const DataColumn(label: Text('Year',style: TextStyle(
                             color: AppColors.orange,
                           ))),
                           const DataColumn(label: Text('Book Type',style: TextStyle(
                             color: AppColors.orange,
                           ))),
                           const DataColumn(label: Text('Number',style: TextStyle(
                             color: AppColors.orange,
                           ))),
                         ],
                         rows: List.generate(snapshot.data![0].data.length, (index) {
                           final y = snapshot.data?[0]?.data?[index].attributes?.academicYear.data.attributes?.Year
                               .toString();
                           dynamic x = snapshot.data?[0]?.data?[index]?.attributes?.bookType?.data?.attributes?.Type.toString();
                           dynamic z = snapshot.data?[0]?.data?[index]?.attributes?.Number;

                           //final z = snapshot.data![2].data[index].attributes.job;

                           return DataRow(cells: [
                             DataCell(Container(width: 75, child: Text("${y}"))),
                             DataCell(Container(child: Text('${x}'))),
                             DataCell(Container(child: Text('${z}')))
                           ]);
                         }),
                       ),
                     ],),
                   ),
                  SizedBox(
                    height: 30,
                  ),
                  Divider(height: 1,color: AppColors.orange,thickness: 2,),

                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white10.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "موقع الكلية الإلكترونى ",
                          style: GoogleFonts.cairo(fontSize: 20 ,fontWeight: FontWeight.bold,color: AppColors.blue),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            ''' للكلية موقع على شبكة الإنترنت باللغتين العربية والإنجليزية
                    تم تحديث كامل محتوى موقعها الإلكتروني وبقالب تصميم عصري حديث يناسب طبيعة عملها ومكانتها الأكاديمية ويشتمل على جميع المعلومات الأساسية والأنشطة والخدمات المقدمة ويغطي الموقع البيانات الأساسية عن الكلية والأنشطة المختلفة، ويتم تحديث هذا الموقع بصفه دورية من خلال مسئول متابعة وتحديث الموقع الإلكتروني بالكلية بالتعاون مع إدارة المعلوماتية بالجامعة.
                      ''',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.w500,)
                        ),
                        Text(
                          "قواعد البيانات  ",
                          style: GoogleFonts.cairo(fontSize: 20 ,fontWeight: FontWeight.bold,color: AppColors.blue),
                        ),
                        Text(
                          "موقع خاص بنظام التسجيل الإلكتروني  ",
                          style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold),

                        ),
                        Text(
                          "يوجد موقع خاص بنظام التسجيل الإلكتروني والإرشاد الأكاديمي للطلاب  ",
                          style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,),
                          textAlign: TextAlign.end,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          ''' 
قواعد بيانات شئون الطلبة- 
قواعد بيانات المكتبه المركزية- 
شبكه اتصالات مركزية للجامعة- 	
قواعد بيانات الكنترول والنتائج- 
نظام حضور وانصراف العاملين- 
قواعد بيانات شئون اعضاء الهيئة التدريسية-
                      
                      
                      ''',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.w500,color: AppColors.blue),

                        ),
                      ],
                    ),
                  ),

                  Divider(height: 1,color: AppColors.orange,thickness: 2,),

                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white10.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(children: [
                      Text(
                        "الجهاز الإدارى  ",
                        style: GoogleFonts.cairo(fontSize: 20 ,fontWeight: FontWeight.bold,color: AppColors.blue),
                      ),
                      Text(
                        "عدد العاملين بالجهاز الإداري حسب المهام الوظيفية   ",
                        style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.w500,color: AppColors.blue),

                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DataTable(
                        columnSpacing: 38.0,
                        headingRowColor: MaterialStateColor.resolveWith(
                              (states) {
                            return AppColors.blue;
                          },
                        ),
                        headingRowHeight: 40,
                        dividerThickness: 3,
                        showBottomBorder: true,
                        columns: [
                          DataColumn(label:  Text('العدد',
                            style: GoogleFonts.cairo(fontSize:12,fontWeight: FontWeight.bold,color: AppColors.orange),
                          )),
                          const DataColumn(label: Text('')),
                          DataColumn(label: Text('عدد العاملين بالجهاز الإداري',
                            style: GoogleFonts.cairo(fontSize:12,fontWeight: FontWeight.bold,color: AppColors.orange),
                          )),
                        ],
                        rows: List.generate(1, (index) {
                          final y = snapshot.data![3]!.data.length;
                          //final z = snapshot.data![2].data[index].attributes.job;

                          return DataRow(cells: [
                            DataCell(Container(child: Text('${y}'))),
                            const DataCell(VerticalDivider(
                              thickness: 3.0,
                              color: AppColors.blue,
                            )),
                            DataCell(Container(
                                width: 75,
                                child: const Text('الفنين وأمناء معامل الحاسب '))),
                          ]);
                        }),
                      ),
                    ],),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Divider(height: 1,color: AppColors.orange,thickness: 2,),

                  SizedBox(
                    height: 10,
                  ),

                   Container(
                     decoration: BoxDecoration(
                       color: Colors.white10.withOpacity(0.5),
                       borderRadius: BorderRadius.circular(15),
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         Text(
                           "الموارد المالية والمادية   ",
                           style: GoogleFonts.cairo(fontSize: 20 ,fontWeight: FontWeight.bold,color: AppColors.blue),
                         ),
                         Text(
                           "الميزانية المالية السنوية للكلية   ",
                           style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold),

                           textAlign: TextAlign.center,
                         ),
                         Text(
                           '''
قد قامت الجامعة على مدى السنوات السابقة بزيادة هذا التمويل الموجه إلى الكلية لدعم قدرتها على تحمل أعباء
التطور والتحديث المستمر ويمكنها دائما بالإلتزام بتنفيذ جميع أنشطتها في شتى المجالات سعيا لتحقيق رسالتها
وأهدافها الاستراتيجية  
                      ''',
                           textAlign: TextAlign.end,
                           style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.w500,),

                         ),

                         Text(
                           ":  التسهيلات المادية الداعة للعملية التعليمية    ",
                           style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,color: AppColors.blue),

                           textAlign: TextAlign.center,
                         ),
                         const SizedBox(
                           height: 10,
                         ),
                         Text(
                           '''
.تراعى الكلية التقدم التكنولوجي السريع في مجال نظم المعلومات وعلوم الحاسب (طبيعة الدراسة بالكلية) وزيادة أعداد الطلاب بالكلية سنويا 
تقوم الكلية وبصفة دورية بتجديد وتحديث معامل الحاسب بها ضمن خطتها السنوية لدعم وصيانة البنية التحتية والمرافق لضمان استمرارية تحقيق فرص التعلم والتطبيق العملي لمخرجات التعلم المستهدفة بالمقررات الدراسية.
                      ''',
                           textAlign: TextAlign.end,
                           style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.w500),

                         ),

                         Text(
                           "بيان بعدد أجهزة الحاسب الآلي في الكلية    ",
                           style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,color: AppColors.blue),

                           textAlign: TextAlign.center,
                         ),
                         SizedBox(height: 10,),
                         DataTable(
                           columnSpacing: 60.0,
                           headingRowColor: MaterialStateColor.resolveWith(
                                 (states) {
                               return AppColors.blue;
                             },
                           ),
                           headingRowHeight: 40,
                           dividerThickness: 3,
                           showBottomBorder: true,
                           columns:  [
                             DataColumn(label: Text('رقم المعمل',
                                 style: GoogleFonts.cairo(fontSize:12,fontWeight: FontWeight.bold,color: AppColors.orange))),
                             DataColumn(label: Text(' ')),
                             DataColumn(label: Text('عدد الاجهزة',
                                 style: GoogleFonts.cairo(fontSize:12,fontWeight: FontWeight.bold,color: AppColors.orange))),
                           ],
                           rows:
                           List.generate(snapshot.data![4]!.data!.length, (index) {
                             final y = snapshot
                                 .data![4]!.data![index].attributes!.LabNumber
                                 .toString();
                             final x = snapshot
                                 .data![4].data![index].attributes!.PCnumber
                                 .toString();

                             return DataRow(
                               cells: [
                                 DataCell(Container(child: Text("${y}"))),
                                 const DataCell(VerticalDivider(
                                   thickness: 3.0,
                                   color: AppColors.blue,
                                 )),
                                 DataCell(Container(child: Text('${x}'))),
                               ],
                             );
                           }),
                         ),
                       ],
                     ),
                   ),
                  SizedBox(
                    height: 30,
                  ),
                  Divider(height: 1,color: AppColors.orange,thickness: 2,),

                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white10.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "الطلاب والخريجون     ",
                          style: GoogleFonts.cairo(fontSize: 20 ,fontWeight: FontWeight.bold,color: AppColors.blue),

                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "قواعد القبول والتحويل ونظام الدراسة، والخدمات الجامعية المقدمة     ",
                          style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,),

                          textAlign: TextAlign.end,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '''
تم  إدراج هذه القواعد ضمن محتويات دليل الطالب، والذي يتضمن التعريف بالكلية وأقسامها والفرق بين هذه
 الأقسام في كل تخصص ورؤية ورسالة وغايات الكلية والميثاق الأخلاقي للطالب بالكلية، وقواعد القبول والتحويل 
 ونظام الدراسة، والخدمات الجامعية المقدمة للطلاب. ويتم توزيع الدليل على الطلاب الجدد في بداية العام الجامعي، 
 كما يتم نشره على موقع الكلية الإلكتروني
                      ''',
                          textAlign: TextAlign.end,
                          style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.w500,),

                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "إجمالي الطلاب بالمستويات الدراسية     ",
                          style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,color: AppColors.blue),

                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 10,),
                        DataTable(
                          columnSpacing: 20.0,
                          headingRowColor: MaterialStateColor.resolveWith(
                                (states) {
                              return AppColors.blue;
                            },
                          ),
                          headingRowHeight: 40,
                          dividerThickness: 3,
                          showBottomBorder: true,
                          columns:  [
                            DataColumn(label: Text('اجمالى',
                                style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange))),
                            DataColumn(label: Text(' ')),
                            DataColumn(label: Text('طالبة',
                                style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange))),
                            DataColumn(label: Text(' ')),
                            DataColumn(label: Text('طالب',
                                style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange))),
                            DataColumn(label: Text(' ')),
                            DataColumn(label: Text('المستوى',
                                style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange))),
                          ],
                          rows: List.generate(4, (index) {
                            final b =
                                snapshot.data![5].data![index].attributes!.Level;
                            final h = int.parse(
                                snapshot.data![5].data![index].attributes!.Male);
                            final i = int.parse(
                                snapshot.data![5].data![index].attributes!.Female);

                            return DataRow(
                              cells: [
                                DataCell(Container(child: Text('${h + i}'))),
                                const DataCell(VerticalDivider(
                                  thickness: 3.0,
                                  color: AppColors.blue,
                                )),
                                DataCell(Container(child: Text("${i}"))),
                                const DataCell(VerticalDivider(
                                  thickness: 3.0,
                                  color: AppColors.blue,
                                )),
                                DataCell(Container(child: Text('${h}'))),
                                const DataCell(VerticalDivider(
                                  thickness: 3.0,
                                  color: AppColors.blue,
                                )),
                                DataCell(Container(child: Text('${b}'))),
                              ],
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Divider(height: 1,color: AppColors.orange,thickness: 2,),

                  SizedBox(
                    height: 20,
                  ),
                   Container(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                       Text(
                         "تطور اعداد الخريجين      ",
                         style: GoogleFonts.cairo(fontSize: 20 ,fontWeight: FontWeight.bold,color: AppColors.blue),

                         textAlign: TextAlign.center,
                       ),
                       Text(
                         "إحصائية تطور أعداد الخريجين خلال خمس سنوات     ",
                         style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,),

                         textAlign: TextAlign.justify,
                       ),
                       const SizedBox(
                         height: 10,
                       ),
                       DataTable(
                         columnSpacing: 0.0,
                         headingRowColor: MaterialStateColor.resolveWith(
                               (states) {
                             return AppColors.blue;
                           },
                         ),
                         headingRowHeight: 40,
                         dividerThickness: 1,
                         showBottomBorder: true,
                         columns:  [
                           DataColumn(label: Text('الاجمالى',
                               style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange))),
                           DataColumn(label: Text(' ')),
                           DataColumn(
                               label: Text(
                                   'علوم الحاسب',
                                   overflow: TextOverflow.ellipsis,
                                   style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange)
                               )),
                           DataColumn(label: Text(' ')),
                           DataColumn(
                               label: Text(
                                   'نظم المعلومات',
                                   overflow: TextOverflow.ellipsis,
                                   style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange)
                               )),
                           DataColumn(label: Text(' ')),
                           DataColumn(label: Text('العام الجامعي',style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange))),
                         ],
                         rows:
                         List.generate(snapshot.data![6].data!.length, (index) {
                           final x = snapshot.data![6].data?[index]?.attributes
                               ?.academicYear?.data?.attributes?.Year
                               .toString();
                           dynamic y = int.parse(snapshot
                               .data?[6]?.data?[index]?.attributes?.CS?.Number);
                           dynamic z = int.parse(snapshot
                               .data?[6]?.data?[index]?.attributes?.IS?.Number);

                           return DataRow(
                             cells: [
                               DataCell(Container(child: Text("${y + z}"))),
                               const DataCell(VerticalDivider(
                                 thickness: 3.0,
                                 color: AppColors.blue,
                               )),
                               DataCell(Container(child: Text("${y}"))),
                               const DataCell(VerticalDivider(
                                 thickness: 3.0,
                                 color: AppColors.blue,
                               )),
                               DataCell(Container(child: Text('${z}'))),
                               const DataCell(VerticalDivider(
                                 thickness: 3.0,
                                 color: AppColors.blue,
                               )),
                               DataCell(Container(child: Text("${x}"))),
                             ],
                           );
                         }),
                       ),
                       SizedBox(
                         height: 30,
                       ),
                     ],),
                   ),
                  Divider(height: 1,color: AppColors.orange,thickness: 2,),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "تعاملات الطلاب     ",
                          style: GoogleFonts.cairo(fontSize: 20 ,fontWeight: FontWeight.bold,color: AppColors.blue),

                          textAlign: TextAlign.center,
                        ),
                        Text(
                          ":نسب الاستطلاع      ",
                          style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,),

                          textAlign: TextAlign.end,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              //height: 300,
                              child: DataTable(
                                columnSpacing: 0.0,
                                headingRowColor: MaterialStateColor.resolveWith(
                                      (states) {
                                    return AppColors.blue;
                                  },
                                ),
                                headingRowHeight: 40,
                                dividerThickness: 1,
                                showBottomBorder: true,
                                columns:  [
                                  DataColumn(label: Text('النسبة',
                                      style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange))),
                                  DataColumn(label: Text(' ')),
                                  DataColumn(
                                      label: Text(
                                          'الاستطلاع',
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange)
                                      )),
                                ],
                                rows:
                                List.generate(snapshot.data![7].data!.length, (index) {
                                  final x = snapshot.data?[7]?.data?[index]?.attributes?.surveyItem?.data?.attributes?.Description
                                      .toString();
                                  dynamic y = snapshot.data?[7]?.data?[index]?.attributes?.Percentage
                                      .toString();


                                  return DataRow(
                                    cells: [
                                      DataCell(Container(child: Text("${y}%"))),
                                      const DataCell(VerticalDivider(
                                        thickness: 3.0,
                                        color: AppColors.blue,
                                      )),
                                      DataCell(Container(child: Text("${x}"))),

                                    ],
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Divider(height: 1,color: AppColors.orange,thickness: 2,),

                        SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Divider(height: 1,color: AppColors.orange,thickness: 2,),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white10.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "الابحاث     ",
                          style: GoogleFonts.cairo(fontSize: 20 ,fontWeight: FontWeight.bold,color: AppColors.blue),

                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "الابحاث لأخر اربع سنين      ",
                          style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,),

                          textAlign: TextAlign.right,
                        ),
                        DataTable(
                          columnSpacing: 60.0,
                          headingRowColor: MaterialStateColor.resolveWith(
                                (states) {
                              return AppColors.blue;
                            },
                          ),
                          headingRowHeight: 40,
                          dividerThickness: 1,
                          showBottomBorder: true,
                          columns:  [
                            DataColumn(label: Text('ISSN',
                                style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange))),
                            DataColumn(label: Text(' ')),
                            DataColumn(
                                label: Text(
                                    'السنة',
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange)
                                )),
                          ],
                          rows:
                          List.generate(snapshot.data![8].data!.length, (index) {
                            final a = snapshot.data?[8].data?[index]?.attributes?.year?.data?.attributes?.Year.toString();
                            dynamic c = (snapshot.data?[8].data?[index]?.attributes?.ISSN == null)? '0': snapshot.data?[8].data?[index]?.attributes?.ISSN.toString();



                            return DataRow(
                              cells: [
                                DataCell(Container(child: Text("${c}"))),
                                const DataCell(VerticalDivider(
                                  thickness: 3.0,
                                  color: AppColors.blue,
                                )),
                                DataCell(Container(child: Text("${a}"))),

                              ],
                            );
                          }),
                        ),


                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Divider(height: 1,color: AppColors.orange,thickness: 2,),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "الأنشطة      ",
                          style: GoogleFonts.cairo(fontSize: 20 ,fontWeight: FontWeight.bold,color: AppColors.blue),

                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "إحصائية تطور الأنشطة خلال أربع سنوات     ",
                          style: GoogleFonts.cairo(fontSize: 15 ,fontWeight: FontWeight.bold,),

                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DataTable(
                          columnSpacing: 10.0,
                          headingRowColor: MaterialStateColor.resolveWith(
                                (states) {
                              return AppColors.blue;
                            },
                          ),
                          headingRowHeight: 40,
                          dividerThickness: 1,
                          showBottomBorder: true,
                          columns:  [
                            DataColumn(label: Text('الاجمالى',
                                style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange))),
                            DataColumn(label: Text(' ')),
                            DataColumn(
                                label: Text(
                                    'العدد',
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange)
                                )),
                            DataColumn(label: Text(' ')),
                            DataColumn(
                                label: Text(
                                    'النسبة',
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange)
                                )),
                            DataColumn(label: Text(' ')),
                            DataColumn(label: Text('العام الجامعي',style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange))),
                          ],
                          rows:
                          List.generate(snapshot.data![9].data!.length, (index) {
                            final y = snapshot.data?[9].data?[index]?.attributes?.Year?.data?.attributes?.Year
                                .toString();
                            final x = (snapshot.data?[9].data?[index]?.attributes?.Number==null)? '0':snapshot.data?[9].data?[index]?.attributes?.Number
                                .toString();
                            final z = (snapshot.data?[9].data?[index]?.attributes?.Total ==null)? '0':snapshot.data?[9].data?[index]?.attributes?.Total.toString();
                            final a =( snapshot.data?[9].data?[index]?.attributes?.Percentage ==null)?'0': snapshot.data?[9].data?[index]?.attributes?.Percentage.toString();


                            return DataRow(
                              cells: [
                                DataCell(Container(child: Text("${z}"))),
                                const DataCell(VerticalDivider(
                                  thickness: 3.0,
                                  color: AppColors.blue,
                                )),
                                DataCell(Container(child: Text("${x}"))),
                                const DataCell(VerticalDivider(
                                  thickness: 3.0,
                                  color: AppColors.blue,
                                )),
                                DataCell(Container(child: Text('${a}'))),
                                const DataCell(VerticalDivider(
                                  thickness: 3.0,
                                  color: AppColors.blue,
                                )),
                                DataCell(Container(child: Text("${y}"))),
                              ],
                            );
                          }),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Divider(height: 1,color: AppColors.orange,thickness: 2,),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "البرتوكول      ",
                          style: GoogleFonts.cairo(fontSize: 20 ,fontWeight: FontWeight.bold,color: AppColors.blue),

                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        DataTable(
                          columnSpacing: 10.0,
                          headingRowColor: MaterialStateColor.resolveWith(
                                (states) {
                              return AppColors.blue;
                            },
                          ),
                          headingRowHeight: 40,
                          dividerThickness: 1,
                          showBottomBorder: true,
                          columns:  [
                            DataColumn(label: Text('النوع',
                                style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange))),
                            DataColumn(label: Text(' ')),
                            DataColumn(
                                label: Text(
                                    'البرتوكول',
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.cairo(fontSize:10,fontWeight: FontWeight.bold,color: AppColors.orange)
                                )),

                          ],
                          rows:
                          List.generate(snapshot.data![10].data!.length, (index) {
                            final a = snapshot
                                .data?[10].data?[index]?.attributes?.Name
                                .toString();
                            final b = snapshot.data?[10].data?[index]?.attributes?.protocolType?.data?.attributes?.pType
                                .toString();
                            return DataRow(
                              cells: [
                                DataCell(Container(child: Text("${b}"))),
                                const DataCell(VerticalDivider(
                                  thickness: 3.0,
                                  color: AppColors.blue,
                                )),
                                DataCell(Container(child: Text("${a}"))),
                                
                              ],
                            );
                          }),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],),
                  ),


                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(
                  color: AppColors.blue,
                ),
                const Text('تحميل'),
              ],
            ),
          );
      },
    );
  }
}
