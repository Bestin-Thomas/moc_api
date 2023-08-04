import 'package:flutter/material.dart';
import 'package:moc_api/providerservice.dart';
import 'package:moc_api/screen/employee_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmployeeProvider(),
      child: MaterialApp(
        title: 'Employee Directory',
        home: EmployeeListScreen(),
      ),
    );
  }
}