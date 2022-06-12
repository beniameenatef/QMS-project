
///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class YearMetaPagination {
/*
{
  "page": 1,
  "pageSize": 25,
  "pageCount": 1,
  "total": 4
}
*/

  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  YearMetaPagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });
  YearMetaPagination.fromJson(Map<String, dynamic> json) {
    page = json['page']?.toInt();
    pageSize = json['pageSize']?.toInt();
    pageCount = json['pageCount']?.toInt();
    total = json['total']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    data['pageSize'] = pageSize;
    data['pageCount'] = pageCount;
    data['total'] = total;
    return data;
  }
}

class YearMeta {
/*
{
  "pagination": {
    "page": 1,
    "pageSize": 25,
    "pageCount": 1,
    "total": 4
  }
}
*/

  YearMetaPagination? pagination;

  YearMeta({
    this.pagination,
  });
  YearMeta.fromJson(Map<String, dynamic> json) {
    pagination = (json['pagination'] != null) ? YearMetaPagination.fromJson(json['pagination']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class YearDataAttributesStudentTransactionsDataAttributesSurveyItemDataAttributes {
/*
{
  "Description": "تصدر الكلية كتابا سنويا للخرجين يسهل الحصول عليه",
  "createdAt": "2022-05-24T07:24:31.009Z",
  "updatedAt": "2022-05-24T07:24:32.114Z",
  "publishedAt": "2022-05-24T07:24:32.112Z"
}
*/

  String? Description;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;

  YearDataAttributesStudentTransactionsDataAttributesSurveyItemDataAttributes({
    this.Description,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });
  YearDataAttributesStudentTransactionsDataAttributesSurveyItemDataAttributes.fromJson(Map<String, dynamic> json) {
    Description = json['Description']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    publishedAt = json['publishedAt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Description'] = Description;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['publishedAt'] = publishedAt;
    return data;
  }
}

class YearDataAttributesStudentTransactionsDataAttributesSurveyItemData {
/*
{
  "id": 30,
  "attributes": {
    "Description": "تصدر الكلية كتابا سنويا للخرجين يسهل الحصول عليه",
    "createdAt": "2022-05-24T07:24:31.009Z",
    "updatedAt": "2022-05-24T07:24:32.114Z",
    "publishedAt": "2022-05-24T07:24:32.112Z"
  }
}
*/

  int? id;
  YearDataAttributesStudentTransactionsDataAttributesSurveyItemDataAttributes? attributes;

  YearDataAttributesStudentTransactionsDataAttributesSurveyItemData({
    this.id,
    this.attributes,
  });
  YearDataAttributesStudentTransactionsDataAttributesSurveyItemData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    attributes = (json['attributes'] != null) ? YearDataAttributesStudentTransactionsDataAttributesSurveyItemDataAttributes.fromJson(json['attributes']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class YearDataAttributesStudentTransactionsDataAttributesSurveyItem {
/*
{
  "data": {
    "id": 30,
    "attributes": {
      "Description": "تصدر الكلية كتابا سنويا للخرجين يسهل الحصول عليه",
      "createdAt": "2022-05-24T07:24:31.009Z",
      "updatedAt": "2022-05-24T07:24:32.114Z",
      "publishedAt": "2022-05-24T07:24:32.112Z"
    }
  }
}
*/

  YearDataAttributesStudentTransactionsDataAttributesSurveyItemData? data;

  YearDataAttributesStudentTransactionsDataAttributesSurveyItem({
    this.data,
  });
  YearDataAttributesStudentTransactionsDataAttributesSurveyItem.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? YearDataAttributesStudentTransactionsDataAttributesSurveyItemData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class YearDataAttributesStudentTransactionsDataAttributes {
/*
{
  "Percentage": 72,
  "createdAt": "2022-05-24T11:47:15.638Z",
  "updatedAt": "2022-05-24T11:47:17.195Z",
  "publishedAt": "2022-05-24T11:47:17.192Z",
  "survey_item": {
    "data": {
      "id": 30,
      "attributes": {
        "Description": "تصدر الكلية كتابا سنويا للخرجين يسهل الحصول عليه",
        "createdAt": "2022-05-24T07:24:31.009Z",
        "updatedAt": "2022-05-24T07:24:32.114Z",
        "publishedAt": "2022-05-24T07:24:32.112Z"
      }
    }
  }
}
*/

  int? Percentage;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  YearDataAttributesStudentTransactionsDataAttributesSurveyItem? surveyItem;

  YearDataAttributesStudentTransactionsDataAttributes({
    this.Percentage,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.surveyItem,
  });
  YearDataAttributesStudentTransactionsDataAttributes.fromJson(Map<String, dynamic> json) {
    Percentage = json['Percentage']?.toInt();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    publishedAt = json['publishedAt']?.toString();
    surveyItem = (json['survey_item'] != null) ? YearDataAttributesStudentTransactionsDataAttributesSurveyItem.fromJson(json['survey_item']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Percentage'] = Percentage;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['publishedAt'] = publishedAt;
    if (surveyItem != null) {
      data['survey_item'] = surveyItem!.toJson();
    }
    return data;
  }
}

class YearDataAttributesStudentTransactionsData {
/*
{
  "id": 73,
  "attributes": {
    "Percentage": 72,
    "createdAt": "2022-05-24T11:47:15.638Z",
    "updatedAt": "2022-05-24T11:47:17.195Z",
    "publishedAt": "2022-05-24T11:47:17.192Z",
    "survey_item": {
      "data": {
        "id": 30,
        "attributes": {
          "Description": "تصدر الكلية كتابا سنويا للخرجين يسهل الحصول عليه",
          "createdAt": "2022-05-24T07:24:31.009Z",
          "updatedAt": "2022-05-24T07:24:32.114Z",
          "publishedAt": "2022-05-24T07:24:32.112Z"
        }
      }
    }
  }
}
*/

  int? id;
  YearDataAttributesStudentTransactionsDataAttributes? attributes;

  YearDataAttributesStudentTransactionsData({
    this.id,
    this.attributes,
  });
  YearDataAttributesStudentTransactionsData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    attributes = (json['attributes'] != null) ? YearDataAttributesStudentTransactionsDataAttributes.fromJson(json['attributes']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class YearDataAttributesStudentTransactions {
/*
{
  "data": [
    {
      "id": 73,
      "attributes": {
        "Percentage": 72,
        "createdAt": "2022-05-24T11:47:15.638Z",
        "updatedAt": "2022-05-24T11:47:17.195Z",
        "publishedAt": "2022-05-24T11:47:17.192Z",
        "survey_item": {
          "data": {
            "id": 30,
            "attributes": {
              "Description": "تصدر الكلية كتابا سنويا للخرجين يسهل الحصول عليه",
              "createdAt": "2022-05-24T07:24:31.009Z",
              "updatedAt": "2022-05-24T07:24:32.114Z",
              "publishedAt": "2022-05-24T07:24:32.112Z"
            }
          }
        }
      }
    }
  ]
}
*/

  List<YearDataAttributesStudentTransactionsData?>? data;

  YearDataAttributesStudentTransactions({
    this.data,
  });
  YearDataAttributesStudentTransactions.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <YearDataAttributesStudentTransactionsData>[];
      v.forEach((v) {
        arr0.add(YearDataAttributesStudentTransactionsData.fromJson(v));
      });
      this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['data'] = arr0;
    }
    return data;
  }
}

class YearDataAttributesStudentDistributionsDataAttributes {
/*
{
  "Level": 1,
  "Male": "392",
  "Female": "69",
  "createdAt": "2022-05-23T23:45:09.237Z",
  "updatedAt": "2022-05-23T23:45:10.286Z",
  "publishedAt": "2022-05-23T23:45:10.282Z",
  "CS": null,
  "IS": null,
  "AI": null,
  "NI": null,
  "General": null
}
*/

  int? Level;
  String? Male;
  String? Female;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? CS;
  String? IS;
  String? AI;
  String? NI;
  String? General;

  YearDataAttributesStudentDistributionsDataAttributes({
    this.Level,
    this.Male,
    this.Female,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.CS,
    this.IS,
    this.AI,
    this.NI,
    this.General,
  });
  YearDataAttributesStudentDistributionsDataAttributes.fromJson(Map<String, dynamic> json) {
    Level = json['Level']?.toInt();
    Male = json['Male']?.toString();
    Female = json['Female']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    publishedAt = json['publishedAt']?.toString();
    CS = json['CS']?.toString();
    IS = json['IS']?.toString();
    AI = json['AI']?.toString();
    NI = json['NI']?.toString();
    General = json['General']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Level'] = Level;
    data['Male'] = Male;
    data['Female'] = Female;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['publishedAt'] = publishedAt;
    data['CS'] = CS;
    data['IS'] = IS;
    data['AI'] = AI;
    data['NI'] = NI;
    data['General'] = General;
    return data;
  }
}

class YearDataAttributesStudentDistributionsData {
/*
{
  "id": 9,
  "attributes": {
    "Level": 1,
    "Male": "392",
    "Female": "69",
    "createdAt": "2022-05-23T23:45:09.237Z",
    "updatedAt": "2022-05-23T23:45:10.286Z",
    "publishedAt": "2022-05-23T23:45:10.282Z",
    "CS": null,
    "IS": null,
    "AI": null,
    "NI": null,
    "General": null
  }
}
*/

  int? id;
  YearDataAttributesStudentDistributionsDataAttributes? attributes;

  YearDataAttributesStudentDistributionsData({
    this.id,
    this.attributes,
  });
  YearDataAttributesStudentDistributionsData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    attributes = (json['attributes'] != null) ? YearDataAttributesStudentDistributionsDataAttributes.fromJson(json['attributes']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class YearDataAttributesStudentDistributions {
/*
{
  "data": [
    {
      "id": 9,
      "attributes": {
        "Level": 1,
        "Male": "392",
        "Female": "69",
        "createdAt": "2022-05-23T23:45:09.237Z",
        "updatedAt": "2022-05-23T23:45:10.286Z",
        "publishedAt": "2022-05-23T23:45:10.282Z",
        "CS": null,
        "IS": null,
        "AI": null,
        "NI": null,
        "General": null
      }
    }
  ]
}
*/

  List<YearDataAttributesStudentDistributionsData?>? data;

  YearDataAttributesStudentDistributions({
    this.data,
  });
  YearDataAttributesStudentDistributions.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <YearDataAttributesStudentDistributionsData>[];
      v.forEach((v) {
        arr0.add(YearDataAttributesStudentDistributionsData.fromJson(v));
      });
      this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['data'] = arr0;
    }
    return data;
  }
}

class YearDataAttributesResearchDataAttributesMajorOfResearch {
/*
{
  "data": null
}
*/

  String? data;

  YearDataAttributesResearchDataAttributesMajorOfResearch({
    this.data,
  });
  YearDataAttributesResearchDataAttributesMajorOfResearch.fromJson(Map<String, dynamic> json) {
    data = json['data']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = this.data;
    return data;
  }
}

class YearDataAttributesResearchDataAttributesAStaff {
/*
{
  "data": null
}
*/

  String? data;

  YearDataAttributesResearchDataAttributesAStaff({
    this.data,
  });
  YearDataAttributesResearchDataAttributesAStaff.fromJson(Map<String, dynamic> json) {
    data = json['data']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = this.data;
    return data;
  }
}

class YearDataAttributesResearchDataAttributes {
/*
{
  "JournalName": null,
  "createdAt": "2022-05-24T19:15:55.924Z",
  "updatedAt": "2022-05-24T19:15:57.387Z",
  "publishedAt": "2022-05-24T19:15:57.383Z",
  "RName": "Ahmed Refaat Ragab \" A New Approach for Unmanned Aerial Vehicle for Sterilizing Cities from Covid-19 Virus\" International Journal on Emerging Technologies",
  "Impact": null,
  "a_staff": {
    "data": null
  },
  "major_of_research": {
    "data": null
  }
}
*/

  String? JournalName;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? RName;
  String? Impact;
  YearDataAttributesResearchDataAttributesAStaff? aStaff;
  YearDataAttributesResearchDataAttributesMajorOfResearch? majorOfResearch;

  YearDataAttributesResearchDataAttributes({
    this.JournalName,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.RName,
    this.Impact,
    this.aStaff,
    this.majorOfResearch,
  });
  YearDataAttributesResearchDataAttributes.fromJson(Map<String, dynamic> json) {
    JournalName = json['JournalName']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    publishedAt = json['publishedAt']?.toString();
    RName = json['RName']?.toString();
    Impact = json['Impact']?.toString();
    aStaff = (json['a_staff'] != null) ? YearDataAttributesResearchDataAttributesAStaff.fromJson(json['a_staff']) : null;
    majorOfResearch = (json['major_of_research'] != null) ? YearDataAttributesResearchDataAttributesMajorOfResearch.fromJson(json['major_of_research']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['JournalName'] = JournalName;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['publishedAt'] = publishedAt;
    data['RName'] = RName;
    data['Impact'] = Impact;
    if (aStaff != null) {
      data['a_staff'] = aStaff!.toJson();
    }
    if (majorOfResearch != null) {
      data['major_of_research'] = majorOfResearch!.toJson();
    }
    return data;
  }
}

class YearDataAttributesResearchData {
/*
{
  "id": 21,
  "attributes": {
    "JournalName": null,
    "createdAt": "2022-05-24T19:15:55.924Z",
    "updatedAt": "2022-05-24T19:15:57.387Z",
    "publishedAt": "2022-05-24T19:15:57.383Z",
    "RName": "Ahmed Refaat Ragab \" A New Approach for Unmanned Aerial Vehicle for Sterilizing Cities from Covid-19 Virus\" International Journal on Emerging Technologies",
    "Impact": null,
    "a_staff": {
      "data": null
    },
    "major_of_research": {
      "data": null
    }
  }
}
*/

  int? id;
  YearDataAttributesResearchDataAttributes? attributes;

  YearDataAttributesResearchData({
    this.id,
    this.attributes,
  });
  YearDataAttributesResearchData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    attributes = (json['attributes'] != null) ? YearDataAttributesResearchDataAttributes.fromJson(json['attributes']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class YearDataAttributesResearch {
/*
{
  "data": [
    {
      "id": 21,
      "attributes": {
        "JournalName": null,
        "createdAt": "2022-05-24T19:15:55.924Z",
        "updatedAt": "2022-05-24T19:15:57.387Z",
        "publishedAt": "2022-05-24T19:15:57.383Z",
        "RName": "Ahmed Refaat Ragab \" A New Approach for Unmanned Aerial Vehicle for Sterilizing Cities from Covid-19 Virus\" International Journal on Emerging Technologies",
        "Impact": null,
        "a_staff": {
          "data": null
        },
        "major_of_research": {
          "data": null
        }
      }
    }
  ]
}
*/

  List<YearDataAttributesResearchData?>? data;

  YearDataAttributesResearch({
    this.data,
  });
  YearDataAttributesResearch.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <YearDataAttributesResearchData>[];
      v.forEach((v) {
        arr0.add(YearDataAttributesResearchData.fromJson(v));
      });
      this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['data'] = arr0;
    }
    return data;
  }
}

class YearDataAttributesGraduatedNumberDataAttributesIS {
/*
{
  "id": 2,
  "Number": "53"
}
*/

  int? id;
  String? Number;

  YearDataAttributesGraduatedNumberDataAttributesIS({
    this.id,
    this.Number,
  });
  YearDataAttributesGraduatedNumberDataAttributesIS.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    Number = json['Number']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['Number'] = Number;
    return data;
  }
}

class YearDataAttributesGraduatedNumberDataAttributesCS {
/*
{
  "id": 2,
  "Number": "91"
}
*/

  int? id;
  String? Number;

  YearDataAttributesGraduatedNumberDataAttributesCS({
    this.id,
    this.Number,
  });
  YearDataAttributesGraduatedNumberDataAttributesCS.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    Number = json['Number']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['Number'] = Number;
    return data;
  }
}

class YearDataAttributesGraduatedNumberDataAttributes {
/*
{
  "createdAt": "2022-05-21T17:12:59.966Z",
  "updatedAt": "2022-05-24T01:12:07.970Z",
  "publishedAt": "2022-05-21T17:13:01.564Z",
  "CS": {
    "id": 2,
    "Number": "91"
  },
  "IS": {
    "id": 2,
    "Number": "53"
  },
  "AI": null,
  "NI": null
}
*/

  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  YearDataAttributesGraduatedNumberDataAttributesCS? CS;
  YearDataAttributesGraduatedNumberDataAttributesIS? IS;
  String? AI;
  String? NI;

  YearDataAttributesGraduatedNumberDataAttributes({
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.CS,
    this.IS,
    this.AI,
    this.NI,
  });
  YearDataAttributesGraduatedNumberDataAttributes.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    publishedAt = json['publishedAt']?.toString();
    CS = (json['CS'] != null) ? YearDataAttributesGraduatedNumberDataAttributesCS.fromJson(json['CS']) : null;
    IS = (json['IS'] != null) ? YearDataAttributesGraduatedNumberDataAttributesIS.fromJson(json['IS']) : null;
    AI = json['AI']?.toString();
    NI = json['NI']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['publishedAt'] = publishedAt;
    if (CS != null) {
      data['CS'] = CS!.toJson();
    }
    if (IS != null) {
      data['IS'] = IS!.toJson();
    }
    data['AI'] = AI;
    data['NI'] = NI;
    return data;
  }
}

class YearDataAttributesGraduatedNumberData {
/*
{
  "id": 2,
  "attributes": {
    "createdAt": "2022-05-21T17:12:59.966Z",
    "updatedAt": "2022-05-24T01:12:07.970Z",
    "publishedAt": "2022-05-21T17:13:01.564Z",
    "CS": {
      "id": 2,
      "Number": "91"
    },
    "IS": {
      "id": 2,
      "Number": "53"
    },
    "AI": null,
    "NI": null
  }
}
*/

  int? id;
  YearDataAttributesGraduatedNumberDataAttributes? attributes;

  YearDataAttributesGraduatedNumberData({
    this.id,
    this.attributes,
  });
  YearDataAttributesGraduatedNumberData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    attributes = (json['attributes'] != null) ? YearDataAttributesGraduatedNumberDataAttributes.fromJson(json['attributes']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class YearDataAttributesGraduatedNumber {
/*
{
  "data": {
    "id": 2,
    "attributes": {
      "createdAt": "2022-05-21T17:12:59.966Z",
      "updatedAt": "2022-05-24T01:12:07.970Z",
      "publishedAt": "2022-05-21T17:13:01.564Z",
      "CS": {
        "id": 2,
        "Number": "91"
      },
      "IS": {
        "id": 2,
        "Number": "53"
      },
      "AI": null,
      "NI": null
    }
  }
}
*/

  YearDataAttributesGraduatedNumberData? data;

  YearDataAttributesGraduatedNumber({
    this.data,
  });
  YearDataAttributesGraduatedNumber.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? YearDataAttributesGraduatedNumberData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class YearDataAttributes {
/*
{
  "Year": "2019/2020",
  "createdAt": "2022-05-21T14:58:59.207Z",
  "updatedAt": "2022-05-23T21:20:45.372Z",
  "publishedAt": "2022-05-21T14:59:00.714Z",
  "graduated_number": {
    "data": {
      "id": 2,
      "attributes": {
        "createdAt": "2022-05-21T17:12:59.966Z",
        "updatedAt": "2022-05-24T01:12:07.970Z",
        "publishedAt": "2022-05-21T17:13:01.564Z",
        "CS": {
          "id": 2,
          "Number": "91"
        },
        "IS": {
          "id": 2,
          "Number": "53"
        },
        "AI": null,
        "NI": null
      }
    }
  },
  "research": {
    "data": [
      {
        "id": 21,
        "attributes": {
          "JournalName": null,
          "createdAt": "2022-05-24T19:15:55.924Z",
          "updatedAt": "2022-05-24T19:15:57.387Z",
          "publishedAt": "2022-05-24T19:15:57.383Z",
          "RName": "Ahmed Refaat Ragab \" A New Approach for Unmanned Aerial Vehicle for Sterilizing Cities from Covid-19 Virus\" International Journal on Emerging Technologies",
          "Impact": null,
          "a_staff": {
            "data": null
          },
          "major_of_research": {
            "data": null
          }
        }
      }
    ]
  },
  "student_distributions": {
    "data": [
      {
        "id": 9,
        "attributes": {
          "Level": 1,
          "Male": "392",
          "Female": "69",
          "createdAt": "2022-05-23T23:45:09.237Z",
          "updatedAt": "2022-05-23T23:45:10.286Z",
          "publishedAt": "2022-05-23T23:45:10.282Z",
          "CS": null,
          "IS": null,
          "AI": null,
          "NI": null,
          "General": null
        }
      }
    ]
  },
  "student_transactions": {
    "data": [
      {
        "id": 73,
        "attributes": {
          "Percentage": 72,
          "createdAt": "2022-05-24T11:47:15.638Z",
          "updatedAt": "2022-05-24T11:47:17.195Z",
          "publishedAt": "2022-05-24T11:47:17.192Z",
          "survey_item": {
            "data": {
              "id": 30,
              "attributes": {
                "Description": "تصدر الكلية كتابا سنويا للخرجين يسهل الحصول عليه",
                "createdAt": "2022-05-24T07:24:31.009Z",
                "updatedAt": "2022-05-24T07:24:32.114Z",
                "publishedAt": "2022-05-24T07:24:32.112Z"
              }
            }
          }
        }
      }
    ]
  }
}
*/

  String? Year;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  YearDataAttributesGraduatedNumber? graduatedNumber;
  YearDataAttributesResearch? research;
  YearDataAttributesStudentDistributions? studentDistributions;
  YearDataAttributesStudentTransactions? studentTransactions;

  YearDataAttributes({
    this.Year,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.graduatedNumber,
    this.research,
    this.studentDistributions,
    this.studentTransactions,
  });
  YearDataAttributes.fromJson(Map<String, dynamic> json) {
    Year = json['Year']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    publishedAt = json['publishedAt']?.toString();
    graduatedNumber = (json['graduated_number'] != null) ? YearDataAttributesGraduatedNumber.fromJson(json['graduated_number']) : null;
    research = (json['research'] != null) ? YearDataAttributesResearch.fromJson(json['research']) : null;
    studentDistributions = (json['student_distributions'] != null) ? YearDataAttributesStudentDistributions.fromJson(json['student_distributions']) : null;
    studentTransactions = (json['student_transactions'] != null) ? YearDataAttributesStudentTransactions.fromJson(json['student_transactions']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Year'] = Year;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['publishedAt'] = publishedAt;
    if (graduatedNumber != null) {
      data['graduated_number'] = graduatedNumber!.toJson();
    }
    if (research != null) {
      data['research'] = research!.toJson();
    }
    if (studentDistributions != null) {
      data['student_distributions'] = studentDistributions!.toJson();
    }
    if (studentTransactions != null) {
      data['student_transactions'] = studentTransactions!.toJson();
    }
    return data;
  }
}

class YearData {
/*
{
  "id": 2,
  "attributes": {
    "Year": "2019/2020",
    "createdAt": "2022-05-21T14:58:59.207Z",
    "updatedAt": "2022-05-23T21:20:45.372Z",
    "publishedAt": "2022-05-21T14:59:00.714Z",
    "graduated_number": {
      "data": {
        "id": 2,
        "attributes": {
          "createdAt": "2022-05-21T17:12:59.966Z",
          "updatedAt": "2022-05-24T01:12:07.970Z",
          "publishedAt": "2022-05-21T17:13:01.564Z",
          "CS": {
            "id": 2,
            "Number": "91"
          },
          "IS": {
            "id": 2,
            "Number": "53"
          },
          "AI": null,
          "NI": null
        }
      }
    },
    "research": {
      "data": [
        {
          "id": 21,
          "attributes": {
            "JournalName": null,
            "createdAt": "2022-05-24T19:15:55.924Z",
            "updatedAt": "2022-05-24T19:15:57.387Z",
            "publishedAt": "2022-05-24T19:15:57.383Z",
            "RName": "Ahmed Refaat Ragab \" A New Approach for Unmanned Aerial Vehicle for Sterilizing Cities from Covid-19 Virus\" International Journal on Emerging Technologies",
            "Impact": null,
            "a_staff": {
              "data": null
            },
            "major_of_research": {
              "data": null
            }
          }
        }
      ]
    },
    "student_distributions": {
      "data": [
        {
          "id": 9,
          "attributes": {
            "Level": 1,
            "Male": "392",
            "Female": "69",
            "createdAt": "2022-05-23T23:45:09.237Z",
            "updatedAt": "2022-05-23T23:45:10.286Z",
            "publishedAt": "2022-05-23T23:45:10.282Z",
            "CS": null,
            "IS": null,
            "AI": null,
            "NI": null,
            "General": null
          }
        }
      ]
    },
    "student_transactions": {
      "data": [
        {
          "id": 73,
          "attributes": {
            "Percentage": 72,
            "createdAt": "2022-05-24T11:47:15.638Z",
            "updatedAt": "2022-05-24T11:47:17.195Z",
            "publishedAt": "2022-05-24T11:47:17.192Z",
            "survey_item": {
              "data": {
                "id": 30,
                "attributes": {
                  "Description": "تصدر الكلية كتابا سنويا للخرجين يسهل الحصول عليه",
                  "createdAt": "2022-05-24T07:24:31.009Z",
                  "updatedAt": "2022-05-24T07:24:32.114Z",
                  "publishedAt": "2022-05-24T07:24:32.112Z"
                }
              }
            }
          }
        }
      ]
    }
  }
}
*/

  int? id;
  YearDataAttributes? attributes;

  YearData({
    this.id,
    this.attributes,
  });
  YearData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    attributes = (json['attributes'] != null) ? YearDataAttributes.fromJson(json['attributes']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class Year {
/*
{
  "data": [
    {
      "id": 2,
      "attributes": {
        "Year": "2019/2020",
        "createdAt": "2022-05-21T14:58:59.207Z",
        "updatedAt": "2022-05-23T21:20:45.372Z",
        "publishedAt": "2022-05-21T14:59:00.714Z",
        "graduated_number": {
          "data": {
            "id": 2,
            "attributes": {
              "createdAt": "2022-05-21T17:12:59.966Z",
              "updatedAt": "2022-05-24T01:12:07.970Z",
              "publishedAt": "2022-05-21T17:13:01.564Z",
              "CS": {
                "id": 2,
                "Number": "91"
              },
              "IS": {
                "id": 2,
                "Number": "53"
              },
              "AI": null,
              "NI": null
            }
          }
        },
        "research": {
          "data": [
            {
              "id": 21,
              "attributes": {
                "JournalName": null,
                "createdAt": "2022-05-24T19:15:55.924Z",
                "updatedAt": "2022-05-24T19:15:57.387Z",
                "publishedAt": "2022-05-24T19:15:57.383Z",
                "RName": "Ahmed Refaat Ragab \" A New Approach for Unmanned Aerial Vehicle for Sterilizing Cities from Covid-19 Virus\" International Journal on Emerging Technologies",
                "Impact": null,
                "a_staff": {
                  "data": null
                },
                "major_of_research": {
                  "data": null
                }
              }
            }
          ]
        },
        "student_distributions": {
          "data": [
            {
              "id": 9,
              "attributes": {
                "Level": 1,
                "Male": "392",
                "Female": "69",
                "createdAt": "2022-05-23T23:45:09.237Z",
                "updatedAt": "2022-05-23T23:45:10.286Z",
                "publishedAt": "2022-05-23T23:45:10.282Z",
                "CS": null,
                "IS": null,
                "AI": null,
                "NI": null,
                "General": null
              }
            }
          ]
        },
        "student_transactions": {
          "data": [
            {
              "id": 73,
              "attributes": {
                "Percentage": 72,
                "createdAt": "2022-05-24T11:47:15.638Z",
                "updatedAt": "2022-05-24T11:47:17.195Z",
                "publishedAt": "2022-05-24T11:47:17.192Z",
                "survey_item": {
                  "data": {
                    "id": 30,
                    "attributes": {
                      "Description": "تصدر الكلية كتابا سنويا للخرجين يسهل الحصول عليه",
                      "createdAt": "2022-05-24T07:24:31.009Z",
                      "updatedAt": "2022-05-24T07:24:32.114Z",
                      "publishedAt": "2022-05-24T07:24:32.112Z"
                    }
                  }
                }
              }
            }
          ]
        }
      }
    }
  ],
  "meta": {
    "pagination": {
      "page": 1,
      "pageSize": 25,
      "pageCount": 1,
      "total": 4
    }
  }
}
*/

  List<YearData?>? data;
  YearMeta? meta;

  Year({
    this.data,
    this.meta,
  });
  Year.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <YearData>[];
      v.forEach((v) {
        arr0.add(YearData.fromJson(v));
      });
      this.data = arr0;

    }
    meta = (json['meta'] != null) ? YearMeta.fromJson(json['meta']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['data'] = arr0;
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}