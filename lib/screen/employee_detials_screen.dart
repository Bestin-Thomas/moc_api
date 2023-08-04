// employee_details_screen.dart
import 'package:flutter/material.dart';

import '../model/jsn/Employee.dart';
// import '../model/employeeJson.dart';
// import 'employee_model.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final Employee employee;

  EmployeeDetailsScreen({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network('${employee.profileImage}'),
            Text('Name: ${employee.name}'),
            Text('User Name: ${employee.username}'),
            Text('Email: ${employee.email}'),
            Text('Address: ${employee.address}'),
            Text('Phone: ${employee.phone}'),
            Text('Website: ${employee.website}'),
            Text('Company: ${employee.company?.name}'),
          ],
        ),
      ),
    );
  }
}