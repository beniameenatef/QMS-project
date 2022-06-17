import 'package:design_ui/constant/colors.dart';
import 'package:flutter/material.dart';

import '../../../../models/Mstaffmodel.dart';
import '../../../../models/graduatednumbrmodel.dart';
import '../../../../models/labmodel.dart';
import '../../../../models/modelMaktba.dart';
import '../../../../models/modelStaff.dart';
import '../../../../models/studentdistribution.dart';
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
        graduatednumber
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
                  const Text(
                    "الخطة الإستراتيجية للكلية ",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("متابعة الخطة التنفيذية لتطبيق استراتيجية الكلية ",
                      style:
                          const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const Text(
                    "تهتم الكلية بتحقيق الغايات النهائية والأهداف الاستراتيجية حيث شملت الخطة التنفيذية كافة العناصر الأساسية مثل الأهداف الاستراتيجية، وبرامج العمل والأنشطة التى تحققها، مسئولية التنفيذ طبقا للمسئوليات المحددة بالهيكل التنظيمي والتوصيف الوظيفي ، الجدول الزمني للتنفيذ، الميزانية المقترحة، ومؤشرات الأداء لكل نشاط، كما تضمنت أيضا آليات التنفيذ والمتابعة والتقييم لجميع مراحل تنفيذ الخطة ",
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "القيادة والحوكمة  ",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "تطرح الكلية سنوياً نموذج استطلاع رأي اعضاء هيئه التدريس والهيئه المعاونه عن نمط القياده، كما تطرح نموذج استطلاع رأي الجهاز الاداري عن نمط القياده  ",
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "المصداقية والآخلاقيات   ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                      "فاعلية الإجراءات التى تتبعها الكلية لحماية الملكية الفكرية ",
                      style:
                          const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '''
١.إستمرارية التوعية بدليل حقوق الملكية الفكرية الصادر على مستوى الجامعة
٢.عقد ورش عمل عن حقوق الملكيه الفكريه للآطراف المختلفة داخل الكلية 
٣.القياس الدورى لإنطباعات الأطراف المعنية عن فاعلية الإجراءات
 التى تتبعها الكلية لحماية الملكية الفكرية، وذلك عن طريق استبيان رضا أعضاء هيئة التدريس، وقد أظهرت نتائج التحليل أن حوالي(82%) من المشاركين موافقين على فاعلية الإجراءات التى تتبعها الكلية لحماية الملكية الفكرية وأهميتها لديهم. وتتخذ الكلية في ضوء نتائج هذا الاستبيان الإجراءات التصحيحية اللازمة وفق نتائج القياس 
                     ''',
                    textAlign: TextAlign.end,
                  ),
                  const Text(
                    "المكتبة المركزية بجامعة 6 أكتوبر    ",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    ":الكتب والمراجع الدورية",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DataTable(
                    columnSpacing: 38.0,
                    columns: [
                      const DataColumn(label: Text('Year')),
                      const DataColumn(label: Text('Book Type')),
                      const DataColumn(label: Text('Number')),
                    ],
                    rows: List.generate(snapshot.data![0].data.length, (index) {
                      final y = snapshot.data![0]!.data![index].attributes!
                          .academicYear!.data!.attributes!.year
                          .toString();
                      final x = snapshot.data![0].data![index].attributes!
                          .bookType!.data!.attributes!.type
                          .toString();
                      final z =
                          snapshot.data![0].data![index].attributes!.number;
                      //final z = snapshot.data![2].data[index].attributes.job;

                      return DataRow(cells: [
                        DataCell(Container(width: 75, child: Text("${y}"))),
                        DataCell(Container(child: Text('${x}'))),
                        DataCell(Container(child: Text('${z}')))
                      ]);
                    }),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "موقع الكلية الإلكترونى ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    ''' للكلية موقع على شبكة الإنترنت باللغتين العربية والإنجليزية
                  تم تحديث كامل محتوى موقعها الإلكتروني وبقالب تصميم عصري حديث يناسب طبيعة عملها ومكانتها الأكاديمية ويشتمل على جميع المعلومات الأساسية والأنشطة والخدمات المقدمة ويغطي الموقع البيانات الأساسية عن الكلية والأنشطة المختلفة، ويتم تحديث هذا الموقع بصفه دورية من خلال مسئول متابعة وتحديث الموقع الإلكتروني بالكلية بالتعاون مع إدارة المعلوماتية بالجامعة.
                    ''',
                    textAlign: TextAlign.end,
                  ),
                  const Text(
                    "قواعد البيانات  ",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "موقع خاص بنظام التسجيل الإلكتروني  ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "يوجد موقع خاص بنظام التسجيل الإلكتروني والإرشاد الأكاديمي للطلاب  ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    ''' 
قواعد بيانات شئون الطلبة- 
قواعد بيانات المكتبه المركزية- 
شبكه اتصالات مركزية للجامعة- 	
قواعد بيانات الكنترول والنتائج- 
نظام حضور وانصراف العاملين- 
قواعد بيانات شئون اعضاء الهيئة التدريسية-
                    
                    
                    ''',
                    textAlign: TextAlign.end,
                  ),
                  const Text(
                    "الجهاز الإدارى  ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "عدد العاملين بالجهاز الإداري حسب المهام الوظيفية   ",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DataTable(
                    columnSpacing: 38.0,
                    columns: [
                      const DataColumn(label: const Text('العدد')),
                      const DataColumn(label: Text('')),
                      const DataColumn(label: Text('عدد العاملين بالجهاز الإداري')),
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "الموارد المالية والمادية   ",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "الميزانية المالية السنوية للكلية   ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    '''
قد قامت الجامعة على مدى السنوات السابقة بزيادة هذا التمويل الموجه إلى الكلية لدعم قدرتها على تحمل أعباء
التطور والتحديث المستمر ويمكنها دائما بالإلتزام بتنفيذ جميع أنشطتها في شتى المجالات سعيا لتحقيق رسالتها
وأهدافها الاستراتيجية  
                    ''',
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    ":  التسهيلات المادية الداعة للعملية التعليمية    ",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '''
.تراعى الكلية التقدم التكنولوجي السريع في مجال نظم المعلومات وعلوم الحاسب (طبيعة الدراسة بالكلية) وزيادة أعداد الطلاب بالكلية سنويا 
تقوم الكلية وبصفة دورية بتجديد وتحديث معامل الحاسب بها ضمن خطتها السنوية لدعم وصيانة البنية التحتية والمرافق لضمان استمرارية تحقيق فرص التعلم والتطبيق العملي لمخرجات التعلم المستهدفة بالمقررات الدراسية.
  
                    ''',
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "بيان بعدد أجهزة الحاسب الآلي في الكلية    ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue),
                    textAlign: TextAlign.center,
                  ),
                  DataTable(
                    columnSpacing: 50.0,
                    columns: const [
                      DataColumn(label: Text('رقم المعمل')),
                      DataColumn(label: Text(' ')),
                      DataColumn(label: Text('عدد الاجهزة')),
                    ],
                    rows:
                        List.generate(snapshot.data![4]!.data!.length, (index) {
                      final y = snapshot
                          .data![4]!.data![index].attributes!.labNumber
                          .toString();
                      final x = snapshot
                          .data![4].data![index].attributes!.pCnumber
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
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(),
                  const Text(
                    "الطلاب والخريجون     ",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "قواعد القبول والتحويل ونظام الدراسة، والخدمات الجامعية المقدمة     ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue),
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '''
تم  إدراج هذه القواعد ضمن محتويات دليل الطالب، والذي يتضمن التعريف بالكلية وأقسامها والفرق بين هذه
 الأقسام في كل تخصص ورؤية ورسالة وغايات الكلية والميثاق الأخلاقي للطالب بالكلية، وقواعد القبول والتحويل 
 ونظام الدراسة، والخدمات الجامعية المقدمة للطلاب. ويتم توزيع الدليل على الطلاب الجدد في بداية العام الجامعي، 
 كما يتم نشره على موقع الكلية الإلكتروني
  
                    ''',
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "إجمالي الطلاب بالمستويات الدراسية     ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue),
                    textAlign: TextAlign.justify,
                  ),
                  DataTable(
                    columnSpacing: 20.0,
                    columns: const [
                      DataColumn(label: Text('اجمالى')),
                      DataColumn(label: Text(' ')),
                      DataColumn(label: Text('طالبة')),
                      DataColumn(label: Text(' ')),
                      DataColumn(label: Text('طالب')),
                      DataColumn(label: Text(' ')),
                      DataColumn(label: Text('المستوى')),
                    ],
                    rows: List.generate(4, (index) {
                      final b =
                          snapshot.data![5].data![index].attributes!.level;
                      final h = int.parse(
                          snapshot.data![5].data![index].attributes!.male);
                      final i = int.parse(
                          snapshot.data![5].data![index].attributes!.female);

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
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "تطور اعداد الخريجين      ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "إحصائية تطور أعداد الخريجين خلال خمس سنوات     ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blue),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DataTable(
                    columnSpacing: 0.0,
                    columns: const [
                      DataColumn(label: Text('الاجمالى')),
                      DataColumn(label: Text(' ')),
                      DataColumn(
                          label: Text(
                        'علوم الحاسب',
                        overflow: TextOverflow.ellipsis,
                      )),
                      DataColumn(label: Text(' ')),
                      DataColumn(
                          label: Text(
                        'نظم المعلومات',
                        overflow: TextOverflow.ellipsis,
                      )),
                      DataColumn(label: Text(' ')),
                      DataColumn(label: Text('العام الجامعي')),
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
