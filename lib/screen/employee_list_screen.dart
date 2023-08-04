// employee_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providerservice.dart';
import 'employee_detials_screen.dart';
// import 'employee_provider.dart';
// import 'employee_model.dart';

class EmployeeListScreen extends StatefulWidget {
  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final employeeProvider = Provider.of<EmployeeProvider>(context, listen: false);
    employeeProvider.fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    final employeeProvider = Provider.of<EmployeeProvider>(context);
    final employees = employeeProvider.employees;
    final filteredEmployees = employeeProvider.searchEmployees(_searchController.text);
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Directory'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (_) => employeeProvider.notifyListeners(),
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEmployees.length,
              itemBuilder: (context, index) {
                final employee = filteredEmployees[index];
                return ListTile(
                  leading: Image.network('${employee.profileImage}'),
                  title: Text(employee.name),
                  subtitle: Text('${employee.company?.name}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmployeeDetailsScreen(employee: employee)),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}