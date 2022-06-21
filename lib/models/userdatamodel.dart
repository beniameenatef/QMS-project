// ///
// /// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
// ///
//
//
// class Userdatalogin {
//
//   String? jwt;
//   Userdata? user;
//
//   Userdatalogin({
//     this.jwt,
//     this.user,
//   });
//   Userdatalogin.fromJson(Map<String, dynamic> json) {
//     jwt = json['jwt']?.toString();
//     user = (json['user'] != null) ? Userdata.fromJson(json['user']) : null;
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['jwt'] = jwt;
//     if (user != null) {
//       data['user'] = user!.toJson();
//     }
//     return data;
//   }
// }
//
// class Userdata {
// /*
// {
//   "id": 6,
//   "username": "alyaa osama",
//   "email": "alyaaosama@gmail.com",
//   "provider": "local",
//   "confirmed": true,
//   "blocked": false,
//   "createdAt": "2022-06-10T15:17:02.192Z",
//   "updatedAt": "2022-06-10T15:17:02.192Z"
// }
// */
//
//   int? id;
//   String? username;
//   String? email;
//   String? provider;
//   bool? confirmed;
//   bool? blocked;
//   String? createdAt;
//   String? updatedAt;
//   String? message;
//
//
//
//   Userdata({
//     this.id,
//     this.username,
//     this.email,
//     this.provider,
//     this.confirmed,
//     this.blocked,
//     this.createdAt,
//     this.updatedAt,
//     this.message,
//
//   });
//   Userdata.fromJson(Map<String, dynamic> json) {
//     id = json['id']?.toInt();
//     username = json['username']?.toString();
//     email = json['email']?.toString();
//     provider = json['provider']?.toString();
//     confirmed = json['confirmed'];
//     blocked = json['blocked'];
//     createdAt = json['createdAt']?.toString();
//     updatedAt = json['updatedAt']?.toString();
//     message = json['message']?.toString();
//
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['username'] = username;
//     data['email'] = email;
//     data['provider'] = provider;
//     data['confirmed'] = confirmed;
//     data['blocked'] = blocked;
//     data['createdAt'] = createdAt;
//     data['updatedAt'] = updatedAt;
//     data['message'] = message;
//     return data;
//   }
// }
//
//
// // class shoploginmodel
// // {
// //   bool ?status;
// //   String? message;
// //   userdata? data;
// //
// //   // int? id;
// //   // String? username;
// //   // String? email;
// //   // String? provider;
// //   // bool? confirmed;
// //   // bool? blocked;
// //   // String? createdAt;
// //   // String? updatedAt;
// //
// //   shoploginmodel.fromjson(Map<String, dynamic> json)
// //   {
// //     status = json['status'];
// //     message = json['message'];
// //     data = json['data'] != null ? userdata.fromjson(json['data']) : null;
// //
// //   }
// // }
// //
// // class userdata
// // {
// //   int ?id;
// //   String? name;
// //   String? email;
// //   // String? phone;
// //   // String? image;
// //   // int? points;
// //   // int? credit;
// //   String? token;
// //
// //   // UserData({
// //   //   this.id,
// //   //   this.name,
// //   //   this.email,
// //   //   this.phone,
// //   //   this.image,
// //   //   this.points,
// //   //   this.credit,
// //   //   this.token,
// //   // });
// //
// //   // named constructor
// //   userdata.fromjson(Map<String, dynamic> json)
// //   {
// //     id = json['id'];
// //     name = json['username'];
// //     email = json['email'];
// //     // phone = json['phone'];
// //     // image = json['image'];
// //     // points = json['points'];
// //     // credit = json['credit'];
// //     token = json['token'];
// //   }
// // }


///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class Users {
/*
{
  "id": 7,
  "username": "alaa osama zaki",
  "email": "alaaosamazaki@gmail.com",
  "provider": "local",
  "confirmed": true,
  "blocked": false,
  "createdAt": "2022-06-10T18:51:43.594Z",
  "updatedAt": "2022-06-20T04:07:09.822Z",
  "gradnumber": true,
  "academicyear": true,
  "Astaff": true,
  "Mstaff": true,
  "lab": true,
  "studDistribution": true,
  "studActivity": true,
  "bookType": true,
  "library": true,
  "survey": true,
  "surveyItem": true,
  "studTransaction": true,
  "research": true,
  "protocol": true,
  "visible": "admin"
}
*/

  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  String? createdAt;
  String? updatedAt;
  bool? gradnumber;
  bool? academicyear;
  bool? Astaff;
  bool? Mstaff;
  bool? lab;
  bool? studDistribution;
  bool? studActivity;
  bool? bookType;
  bool? theLibrary;
  bool? survey;
  bool? surveyItem;
  bool? studTransaction;
  bool? research;
  bool? protocol;
  String? visible;

  Users({
    this.id,
    this.username,
    this.email,
    this.provider,
    this.confirmed,
    this.blocked,
    this.createdAt,
    this.updatedAt,
    this.gradnumber,
    this.academicyear,
    this.Astaff,
    this.Mstaff,
    this.lab,
    this.studDistribution,
    this.studActivity,
    this.bookType,
    this.theLibrary,
    this.survey,
    this.surveyItem,
    this.studTransaction,
    this.research,
    this.protocol,
    this.visible,
  });
  Users.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    username = json['username']?.toString();
    email = json['email']?.toString();
    provider = json['provider']?.toString();
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    gradnumber = json['gradnumber'];
    academicyear = json['academicyear'];
    Astaff = json['Astaff'];
    Mstaff = json['Mstaff'];
    lab = json['lab'];
    studDistribution = json['studDistribution'];
    studActivity = json['studActivity'];
    bookType = json['bookType'];
    theLibrary = json['library'];
    survey = json['survey'];
    surveyItem = json['surveyItem'];
    studTransaction = json['studTransaction'];
    research = json['research'];
    protocol = json['protocol'];
    visible = json['visible']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['provider'] = provider;
    data['confirmed'] = confirmed;
    data['blocked'] = blocked;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['gradnumber'] = gradnumber;
    data['academicyear'] = academicyear;
    data['Astaff'] = Astaff;
    data['Mstaff'] = Mstaff;
    data['lab'] = lab;
    data['studDistribution'] = studDistribution;
    data['studActivity'] = studActivity;
    data['bookType'] = bookType;
    data['library'] = theLibrary;
    data['survey'] = survey;
    data['surveyItem'] = surveyItem;
    data['studTransaction'] = studTransaction;
    data['research'] = research;
    data['protocol'] = protocol;
    data['visible'] = visible;
    return data;
  }
}
