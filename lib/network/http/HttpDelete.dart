import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/protocoltype.dart';
import '../../models/yearsmodel.dart';

Future<Year> DeleteYears(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/academic-years/${id}?populate=deep,3'));

  if(response.statusCode==200){
    print(response.body);
    return Year.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete years data');
  }
}


Future<ProtocolType> DeleteprotocolType(int? id) async {
  final response = await http.delete(Uri.parse('https://qms-application.herokuapp.com/api/protocol-types/${id}'));

  if(response.statusCode==200){
    print(response.body);
    return ProtocolType.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('failed to delete protocol type data');
  }
}
