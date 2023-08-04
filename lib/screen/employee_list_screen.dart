
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providerservice.dart';
import 'employee_detials_screen.dart';

class EmployeeListScreen extends StatefulWidget {
  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {

    super.initState();
    print("init state");
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
                  leading: employee.profileImage==null?CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.brown.shade800,
                    child: Center(child: Icon(Icons.person)),
                  ):CircleAvatar(
                    backgroundImage: NetworkImage(
                        '${employee.profileImage}'),
                    radius: 30,
                  ),
                  // Image.network('${employee.profileImage}'),
                  title: Text(employee.name),
                  subtitle: Text('${employee.company?.name}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileApp(employee: employee)),
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