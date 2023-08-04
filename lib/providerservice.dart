// employee_provider.dart
import 'package:flutter/material.dart';
// import 'employee_database.dart';
// import 'employee_model.dart';
// import 'model/employeeJson.dart';
import 'model/employeedatabase.dart';
import 'model/jsn/Employee.dart';

class EmployeeProvider extends ChangeNotifier {
  final EmployeeDatabase _employeeDatabase = EmployeeDatabase();
  List<Employee> _employees = [];

  List<Employee> get employees => _employees;

  Future<void> fetchEmployees() async {
    if (_employees.isEmpty) {
      _employees = await _employeeDatabase.getEmployees();
      notifyListeners();
    }
  }

  List<Employee> searchEmployees(String query) {
    if (query.isEmpty) {
      return _employees;
    } else {
      return _employees.where((employee) =>
      employee.name.toLowerCase().contains(query.toLowerCase()) ||
          employee.email.toLowerCase().contains(query.toLowerCase())).toList();
    }
  }
}