import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/jsn/Employee.dart';

class ApiService {
  Future<List<Employee>> getUsers()  async {
    final response = await http.get(Uri.parse('http://www.mocky.io/v2/5d565297300000680030a986'));
    if (response.statusCode == 200) {
      var reslist = json.decode(response.body.toString()) as List;
      var listUsers = reslist.map((reslist_item) => Employee.fromJson(reslist_item)).toList();
      return listUsers;
    } else {
      throw Exception('Failed to load users');
    }
  }

}