
import 'package:flutter/material.dart';
import 'package:moc_api/service/apiservice.dart';
import 'model/employeedatabase.dart';
import 'model/jsn/Employee.dart';


class EmployeeProvider extends ChangeNotifier {
  final EmployeeDatabase _employeeDatabase = EmployeeDatabase();
  ApiService apiService=ApiService();
  List<Employee> _employees = [];

  List<Employee> get employees => _employees;

  Future<void> fetchEmployees() async {
    if (_employees.isEmpty) {
      _employees = await _employeeDatabase.getEmployees();
      notifyListeners();
    }

    if(_employees.length==0){
      _employees=await apiService.getUsers();
      print("updated");
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