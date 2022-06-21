///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class ResearchesMetaPagination {
/*
{
  "page": 1,
  "pageSize": 100,
  "pageCount": 1,
  "total": 45
}
*/

  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  ResearchesMetaPagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });
  ResearchesMetaPagination.fromJson(Map<String, dynamic> json) {
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

class ResearchesMeta {
/*
{
  "pagination": {
    "page": 1,
    "pageSize": 100,
    "pageCount": 1,
    "total": 45
  }
}
*/

  ResearchesMetaPagination? pagination;

  ResearchesMeta({
    this.pagination,
  });
  ResearchesMeta.fromJson(Map<String, dynamic> json) {
    pagination = (json['pagination'] != null) ? ResearchesMetaPagination.fromJson(json['pagination']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class ResearchesDataAttributesYearDataAttributes {
/*
{
  "Year": "2019/2020",
  "createdAt": "2022-05-21T14:58:59.207Z",
  "updatedAt": "2022-05-23T21:20:45.372Z",
  "publishedAt": "2022-05-21T14:59:00.714Z"
}
*/

  String? Year;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;

  ResearchesDataAttributesYearDataAttributes({
    this.Year,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });
  ResearchesDataAttributesYearDataAttributes.fromJson(Map<String, dynamic> json) {
    Year = json['Year']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    publishedAt = json['publishedAt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Year'] = Year;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['publishedAt'] = publishedAt;
    return data;
  }
}

class ResearchesDataAttributesYearData {
/*
{
  "id": 2,
  "attributes": {
    "Year": "2019/2020",
    "createdAt": "2022-05-21T14:58:59.207Z",
    "updatedAt": "2022-05-23T21:20:45.372Z",
    "publishedAt": "2022-05-21T14:59:00.714Z"
  }
}
*/

  int? id;
  ResearchesDataAttributesYearDataAttributes? attributes;

  ResearchesDataAttributesYearData({
    this.id,
    this.attributes,
  });
  ResearchesDataAttributesYearData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    attributes = (json['attributes'] != null) ? ResearchesDataAttributesYearDataAttributes.fromJson(json['attributes']) : null;
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

class ResearchesDataAttributesYear {
/*
{
  "data": {
    "id": 2,
    "attributes": {
      "Year": "2019/2020",
      "createdAt": "2022-05-21T14:58:59.207Z",
      "updatedAt": "2022-05-23T21:20:45.372Z",
      "publishedAt": "2022-05-21T14:59:00.714Z"
    }
  }
}
*/

  ResearchesDataAttributesYearData? data;

  ResearchesDataAttributesYear({
    this.data,
  });
  ResearchesDataAttributesYear.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? ResearchesDataAttributesYearData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ResearchesDataAttributesMajorOfResearch {
/*
{
  "data": null
}
*/

  String? data;

  ResearchesDataAttributesMajorOfResearch({
    this.data,
  });
  ResearchesDataAttributesMajorOfResearch.fromJson(Map<String, dynamic> json) {
    data = json['data']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = this.data;
    return data;
  }
}

class ResearchesDataAttributesAStaff {
/*
{
  "data": null
}
*/

  String? data;

  ResearchesDataAttributesAStaff({
    this.data,
  });
  ResearchesDataAttributesAStaff.fromJson(Map<String, dynamic> json) {
    data = json['data']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = this.data;
    return data;
  }
}

class ResearchesDataAttributes {
/*
{
  "JournalName": null,
  "createdAt": "2022-05-24T19:12:00.292Z",
  "updatedAt": "2022-06-20T17:21:28.639Z",
  "publishedAt": "2022-05-24T19:12:01.314Z",
  "RName": "Lamiaa F Ibrahim, Hesham A Salman, Zaki F Taha, Nadine Akkari, Ghadah Aldabbagh, Omayma Bamasak \" A survey on heterogeneous mobile networks planning in indoor dense areas\" Personal and Ubiquitous Computing",
  "Impact": null,
  "ISSN": "5464-4547",
  "a_staff": {
    "data": null
  },
  "major_of_research": {
    "data": null
  },
  "year": {
    "data": {
      "id": 2,
      "attributes": {
        "Year": "2019/2020",
        "createdAt": "2022-05-21T14:58:59.207Z",
        "updatedAt": "2022-05-23T21:20:45.372Z",
        "publishedAt": "2022-05-21T14:59:00.714Z"
      }
    }
  }
}
*/

  String? JournalName;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  String? RName;
  String? Impact;
  String? ISSN;
  ResearchesDataAttributesAStaff? aStaff;
  ResearchesDataAttributesMajorOfResearch? majorOfResearch;
  ResearchesDataAttributesYear? year;

  ResearchesDataAttributes({
    this.JournalName,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.RName,
    this.Impact,
    this.ISSN,
    this.aStaff,
    this.majorOfResearch,
    this.year,
  });
  ResearchesDataAttributes.fromJson(Map<String, dynamic> json) {
    JournalName = json['JournalName']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    publishedAt = json['publishedAt']?.toString();
    RName = json['RName']?.toString();
    Impact = json['Impact']?.toString();
    ISSN = (json['ISSN'] != null) ? json['ISSN']?.toString() : null;
    aStaff = (json['a_staff'] != null) ? ResearchesDataAttributesAStaff.fromJson(json['a_staff']) : null;
    majorOfResearch = (json['major_of_research'] != null) ? ResearchesDataAttributesMajorOfResearch.fromJson(json['major_of_research']) : null;
    year = (json['year'] != null) ? ResearchesDataAttributesYear.fromJson(json['year']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['JournalName'] = JournalName;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['publishedAt'] = publishedAt;
    data['RName'] = RName;
    data['Impact'] = Impact;
    data['ISSN'] = ISSN;
    if (aStaff != null) {
      data['a_staff'] = aStaff!.toJson();
    }
    if (majorOfResearch != null) {
      data['major_of_research'] = majorOfResearch!.toJson();
    }
    if (year != null) {
      data['year'] = year!.toJson();
    }
    return data;
  }
}

class ResearchesData {
/*
{
  "id": 14,
  "attributes": {
    "JournalName": null,
    "createdAt": "2022-05-24T19:12:00.292Z",
    "updatedAt": "2022-06-20T17:21:28.639Z",
    "publishedAt": "2022-05-24T19:12:01.314Z",
    "RName": "Lamiaa F Ibrahim, Hesham A Salman, Zaki F Taha, Nadine Akkari, Ghadah Aldabbagh, Omayma Bamasak \" A survey on heterogeneous mobile networks planning in indoor dense areas\" Personal and Ubiquitous Computing",
    "Impact": null,
    "ISSN": "5464-4547",
    "a_staff": {
      "data": null
    },
    "major_of_research": {
      "data": null
    },
    "year": {
      "data": {
        "id": 2,
        "attributes": {
          "Year": "2019/2020",
          "createdAt": "2022-05-21T14:58:59.207Z",
          "updatedAt": "2022-05-23T21:20:45.372Z",
          "publishedAt": "2022-05-21T14:59:00.714Z"
        }
      }
    }
  }
}
*/

  int? id;
  ResearchesDataAttributes? attributes;

  ResearchesData({
    this.id,
    this.attributes,
  });
  ResearchesData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    attributes = (json['attributes'] != null) ? ResearchesDataAttributes.fromJson(json['attributes']) : null;
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

class Researches {
/*
{
  "data": [
    {
      "id": 14,
      "attributes": {
        "JournalName": null,
        "createdAt": "2022-05-24T19:12:00.292Z",
        "updatedAt": "2022-06-20T17:21:28.639Z",
        "publishedAt": "2022-05-24T19:12:01.314Z",
        "RName": "Lamiaa F Ibrahim, Hesham A Salman, Zaki F Taha, Nadine Akkari, Ghadah Aldabbagh, Omayma Bamasak \" A survey on heterogeneous mobile networks planning in indoor dense areas\" Personal and Ubiquitous Computing",
        "Impact": null,
        "ISSN": "5464-4547",
        "a_staff": {
          "data": null
        },
        "major_of_research": {
          "data": null
        },
        "year": {
          "data": {
            "id": 2,
            "attributes": {
              "Year": "2019/2020",
              "createdAt": "2022-05-21T14:58:59.207Z",
              "updatedAt": "2022-05-23T21:20:45.372Z",
              "publishedAt": "2022-05-21T14:59:00.714Z"
            }
          }
        }
      }
    }
  ],
  "meta": {
    "pagination": {
      "page": 1,
      "pageSize": 100,
      "pageCount": 1,
      "total": 45
    }
  }
}
*/

  List<ResearchesData?>? data;
  ResearchesMeta? meta;

  Researches({
    this.data,
    this.meta,
  });
  Researches.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <ResearchesData>[];
      v.forEach((v) {
        arr0.add(ResearchesData.fromJson(v));
      });
      this.data = arr0;
    }
    meta = (json['meta'] != null) ? ResearchesMeta.fromJson(json['meta']) : null;
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
