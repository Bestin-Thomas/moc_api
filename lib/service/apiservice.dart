import 'dart:convert';
import 'package:http/http.dart' as http;

// import '../model/employeeJson.dart';
import '../model/jsn/Employee.dart';

Future<List<Employee>> fetchEmployees() async {
  final response = await http.get(Uri.parse('http://www.mocky.io/v2/5d565297300000680030a986'));
  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    print(jsonData.toString());
    return jsonData.map((data) => Employee(
      id: data['id'],
      profileImage: data['profileImage'],
      name: data['name'],
      username: data['username'],
      email: data['email'],
      address: data['address'],
      phone: data['phone'],
      website: data['website'],
      companyName: data['company']['name'],
    )).toList();
  } else {
    throw Exception('Failed to load employees');
  }
}