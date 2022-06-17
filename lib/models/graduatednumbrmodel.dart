// // To parse this JSON data, do
// //
// //     final graduatedNumber = graduatedNumberFromJson(jsonString);
//
// import 'dart:convert';
//
// GraduatedNumber graduatedNumberFromJson(String str) => GraduatedNumber.fromJson(json.decode(str));
//
// String graduatedNumberToJson(GraduatedNumber data) => json.encode(data.toJson());
//
// class GraduatedNumber {
//   GraduatedNumber({
//     this.data,
//     this.meta,
//   });
//
//   List<DatumG>? data;
//   Meta? meta;
//
//   factory GraduatedNumber.fromJson(Map<String, dynamic> json) => GraduatedNumber(
//     data: List<DatumG>.from(json["data"].map((x) => DatumG.fromJson(x))),
//     meta: Meta.fromJson(json["meta"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//     "meta": meta?.toJson(),
//   };
// }
//
// class DatumG {
//   DatumG({
//     this.id,
//     this.attributes,
//   });
//
//   int? id;
//   DatumAttributes? attributes;
//
//   factory DatumG.fromJson(Map<String, dynamic> json) => DatumG(
//     id: json["id"],
//     attributes: DatumAttributes.fromJson(json["attributes"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "attributes": attributes?.toJson(),
//   };
// }
//
// class DatumAttributes {
//   DatumAttributes({
//     this.createdAt,
//     this.updatedAt,
//     this.publishedAt,
//     this.cs,
//     this.attributesIs,
//     this.ai,
//     this.ni,
//     this.academicYear,
//   });
//
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   DateTime? publishedAt;
//   Cs? cs;
//   Cs? attributesIs;
//   Cs? ai;
//   Cs? ni;
//   AcademicYear? academicYear;
//
//   factory DatumAttributes.fromJson(Map<String, dynamic> json) => DatumAttributes(
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     publishedAt: DateTime.parse(json["publishedAt"]),
//     cs: Cs.fromJson(json["CS"]),
//     attributesIs: Cs.fromJson(json["IS"]),
//     ai: Cs.fromJson(json["AI"]),
//     ni: Cs.fromJson(json["AI"]),
//     academicYear: AcademicYear.fromJson(json["academic_year"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "publishedAt": publishedAt?.toIso8601String(),
//     "CS": cs?.toJson(),
//     "IS": attributesIs?.toJson(),
//     "AI": ai?.toJson(),
//     "NI": ni?.toJson(),
//     "academic_year": academicYear?.toJson(),
//   };
// }
//
// class AcademicYear {
//   AcademicYear({
//     this.data,
//   });
//
//   Data? data;
//
//   factory AcademicYear.fromJson(Map<String, dynamic> json) => AcademicYear(
//     data: Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": data?.toJson(),
//   };
// }
//
// class Data {
//   Data({
//     this.id,
//     this.attributes,
//   });
//
//   int? id;
//   DataAttributes? attributes;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     id: json["id"],
//     attributes: DataAttributes.fromJson(json["attributes"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "attributes": attributes?.toJson(),
//   };
// }
//
// class DataAttributes {
//   DataAttributes({
//     this.year,
//     this.createdAt,
//     this.updatedAt,
//     this.publishedAt,
//   });
//
//   String? year;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   DateTime? publishedAt;
//
//   factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
//     year: json["Year"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     publishedAt: DateTime.parse(json["publishedAt"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Year": year,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "publishedAt": publishedAt?.toIso8601String(),
//   };
// }
//
// class Cs {
//   Cs({
//     this.id,
//     this.number,
//   });
//
//   int? id;
//   String? number;
//
//   factory Cs.fromJson(Map<String, dynamic> json) => Cs(
//     id: json["id"],
//     number: json["Number"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "Number": number,
//   };
// }
//
// class Meta {
//   Meta({
//     this.pagination,
//   });
//
//   Pagination? pagination;
//
//   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//     pagination: Pagination.fromJson(json["pagination"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "pagination": pagination?.toJson(),
//   };
// }
//
// class Pagination {
//   Pagination({
//     this.page,
//     this.pageSize,
//     this.pageCount,
//     this.total,
//   });
//
//   int? page;
//   int? pageSize;
//   int? pageCount;
//   int? total;
//
//   factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//     page: json["page"],
//     pageSize: json["pageSize"],
//     pageCount: json["pageCount"],
//     total: json["total"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "page": page,
//     "pageSize": pageSize,
//     "pageCount": pageCount,
//     "total": total,
//   };
// }

class GraduatedNumberMetaPagination {
/*
{
  "page": 1,
  "pageSize": 100,
  "pageCount": 1,
  "total": 3
}
*/

  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  GraduatedNumberMetaPagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  GraduatedNumberMetaPagination.fromJson(Map<String, dynamic> json) {
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

class GraduatedNumberMeta {
/*
{
  "pagination": {
    "page": 1,
    "pageSize": 100,
    "pageCount": 1,
    "total": 3
  }
}
*/

  GraduatedNumberMetaPagination? pagination;

  GraduatedNumberMeta({
    this.pagination,
  });

  GraduatedNumberMeta.fromJson(Map<String, dynamic> json) {
    pagination = (json['pagination'] != null)
        ? GraduatedNumberMetaPagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class GraduatedNumberDataAttributesAcademicYearDataAttributes {
/*
{
  "Year": "2018/2019",
  "createdAt": "2022-05-21T16:50:27.812Z",
  "updatedAt": "2022-05-23T21:20:29.882Z",
  "publishedAt": "2022-05-21T16:50:33.930Z"
}
*/

  String? Year;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;

  GraduatedNumberDataAttributesAcademicYearDataAttributes({
    this.Year,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  GraduatedNumberDataAttributesAcademicYearDataAttributes.fromJson(
      Map<String, dynamic> json) {
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

class GraduatedNumberDataAttributesAcademicYearData {
/*
{
  "id": 1,
  "attributes": {
    "Year": "2018/2019",
    "createdAt": "2022-05-21T16:50:27.812Z",
    "updatedAt": "2022-05-23T21:20:29.882Z",
    "publishedAt": "2022-05-21T16:50:33.930Z"
  }
}
*/

  int? id;
  GraduatedNumberDataAttributesAcademicYearDataAttributes? attributes;

  GraduatedNumberDataAttributesAcademicYearData({
    this.id,
    this.attributes,
  });

  GraduatedNumberDataAttributesAcademicYearData.fromJson(
      Map<String, dynamic> json) {
    id = json['id']?.toInt();
    attributes = (json['attributes'] != null)
        ? GraduatedNumberDataAttributesAcademicYearDataAttributes.fromJson(
            json['attributes'])
        : null;
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

class GraduatedNumberDataAttributesAcademicYear {
/*
{
  "data": {
    "id": 1,
    "attributes": {
      "Year": "2018/2019",
      "createdAt": "2022-05-21T16:50:27.812Z",
      "updatedAt": "2022-05-23T21:20:29.882Z",
      "publishedAt": "2022-05-21T16:50:33.930Z"
    }
  }
}
*/

  GraduatedNumberDataAttributesAcademicYearData? data;

  GraduatedNumberDataAttributesAcademicYear({
    this.data,
  });

  GraduatedNumberDataAttributesAcademicYear.fromJson(
      Map<String, dynamic> json) {
    data = (json['data'] != null)
        ? GraduatedNumberDataAttributesAcademicYearData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GraduatedNumberDataAttributesNI {
/*
{
  "id": 30,
  "Number": "0"
}
*/

  int? id;
  String? Number;

  GraduatedNumberDataAttributesNI({
    this.id,
    this.Number,
  });

  GraduatedNumberDataAttributesNI.fromJson(Map<String, dynamic> json) {
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

class GraduatedNumberDataAttributesAI {
/*
{
  "id": 30,
  "Number": "0"
}
*/

  int? id;
  String? Number;

  GraduatedNumberDataAttributesAI({
    this.id,
    this.Number,
  });

  GraduatedNumberDataAttributesAI.fromJson(Map<String, dynamic> json) {
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

class GraduatedNumberDataAttributesIS {
/*
{
  "id": 1,
  "Number": "36"
}
*/

  int? id;
  String? Number;

  GraduatedNumberDataAttributesIS({
    this.id,
    this.Number,
  });

  GraduatedNumberDataAttributesIS.fromJson(Map<String, dynamic> json) {
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

class GraduatedNumberDataAttributesCS {
/*
{
  "id": 1,
  "Number": "101"
}
*/

  int? id;
  String? Number;

  GraduatedNumberDataAttributesCS({
    this.id,
    this.Number,
  });

  GraduatedNumberDataAttributesCS.fromJson(Map<String, dynamic> json) {
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

class GraduatedNumberDataAttributes {
/*
{
  "createdAt": "2022-05-21T17:12:37.559Z",
  "updatedAt": "2022-06-16T16:29:52.489Z",
  "publishedAt": "2022-05-21T17:12:39.002Z",
  "CS": {
    "id": 1,
    "Number": "101"
  },
  "IS": {
    "id": 1,
    "Number": "36"
  },
  "AI": {
    "id": 30,
    "Number": "0"
  },
  "NI": {
    "id": 30,
    "Number": "0"
  },
  "academic_year": {
    "data": {
      "id": 1,
      "attributes": {
        "Year": "2018/2019",
        "createdAt": "2022-05-21T16:50:27.812Z",
        "updatedAt": "2022-05-23T21:20:29.882Z",
        "publishedAt": "2022-05-21T16:50:33.930Z"
      }
    }
  }
}
*/

  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  GraduatedNumberDataAttributesCS? CS;
  GraduatedNumberDataAttributesIS? IS;
  GraduatedNumberDataAttributesAI? AI;
  GraduatedNumberDataAttributesNI? NI;
  GraduatedNumberDataAttributesAcademicYear? academicYear;

  GraduatedNumberDataAttributes({
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.CS,
    this.IS,
    this.AI,
    this.NI,
    this.academicYear,
  });

  GraduatedNumberDataAttributes.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    publishedAt = json['publishedAt']?.toString();
    CS = (json['CS'] != null)
        ? GraduatedNumberDataAttributesCS.fromJson(json['CS'])
        : null;
    IS = (json['IS'] != null)
        ? GraduatedNumberDataAttributesIS.fromJson(json['IS'])
        : null;
    AI = (json['AI'] != null)
        ? GraduatedNumberDataAttributesAI.fromJson(json['AI'])
        : null;
    NI = (json['NI'] != null)
        ? GraduatedNumberDataAttributesNI.fromJson(json['NI'])
        : null;
    academicYear = (json['academic_year'] != null)
        ? GraduatedNumberDataAttributesAcademicYear.fromJson(
            json['academic_year'])
        : null;
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
    if (AI != null) {
      data['AI'] = AI!.toJson();
    }
    if (NI != null) {
      data['NI'] = NI!.toJson();
    }
    if (academicYear != null) {
      data['academic_year'] = academicYear!.toJson();
    }
    return data;
  }
}

class GraduatedNumberData {
/*
{
  "id": 1,
  "attributes": {
    "createdAt": "2022-05-21T17:12:37.559Z",
    "updatedAt": "2022-06-16T16:29:52.489Z",
    "publishedAt": "2022-05-21T17:12:39.002Z",
    "CS": {
      "id": 1,
      "Number": "101"
    },
    "IS": {
      "id": 1,
      "Number": "36"
    },
    "AI": {
      "id": 30,
      "Number": "0"
    },
    "NI": {
      "id": 30,
      "Number": "0"
    },
    "academic_year": {
      "data": {
        "id": 1,
        "attributes": {
          "Year": "2018/2019",
          "createdAt": "2022-05-21T16:50:27.812Z",
          "updatedAt": "2022-05-23T21:20:29.882Z",
          "publishedAt": "2022-05-21T16:50:33.930Z"
        }
      }
    }
  }
}
*/

  int? id;
  GraduatedNumberDataAttributes? attributes;

  GraduatedNumberData({
    this.id,
    this.attributes,
  });

  GraduatedNumberData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    attributes = (json['attributes'] != null)
        ? GraduatedNumberDataAttributes.fromJson(json['attributes'])
        : null;
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

class GraduatedNumber {
/*
{
  "data": [
    {
      "id": 1,
      "attributes": {
        "createdAt": "2022-05-21T17:12:37.559Z",
        "updatedAt": "2022-06-16T16:29:52.489Z",
        "publishedAt": "2022-05-21T17:12:39.002Z",
        "CS": {
          "id": 1,
          "Number": "101"
        },
        "IS": {
          "id": 1,
          "Number": "36"
        },
        "AI": {
          "id": 30,
          "Number": "0"
        },
        "NI": {
          "id": 30,
          "Number": "0"
        },
        "academic_year": {
          "data": {
            "id": 1,
            "attributes": {
              "Year": "2018/2019",
              "createdAt": "2022-05-21T16:50:27.812Z",
              "updatedAt": "2022-05-23T21:20:29.882Z",
              "publishedAt": "2022-05-21T16:50:33.930Z"
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
      "total": 3
    }
  }
}
*/

  List<GraduatedNumberData?>? data;
  GraduatedNumberMeta? meta;

  GraduatedNumber({
    this.data,
    this.meta,
  });

  GraduatedNumber.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <GraduatedNumberData>[];
      v.forEach((v) {
        arr0.add(GraduatedNumberData.fromJson(v));
      });
      this.data = arr0;
    }
    meta = (json['meta'] != null)
        ? GraduatedNumberMeta.fromJson(json['meta'])
        : null;
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
