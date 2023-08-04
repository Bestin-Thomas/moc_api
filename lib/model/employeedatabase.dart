
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'jsn/Employee.dart';

class EmployeeDatabase {
  static const _tableName = 'employees';

  Future<Database> _openDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'employees.db');
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE $_tableName (id INTEGER PRIMARY KEY,profileImage TEXT,name TEXT,username TEXT,email TEXT,address TEXT,phone TEXT,website TEXT,company TEXT)');
        });
  }

  Future<void> saveEmployees(List<Employee> employees) async {
    final db = await _openDatabase();
    final batch = db.batch();
    employees.forEach((employee) {
      batch.insert(_tableName, employee.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
    await batch.commit();
    await db.close();
  }

  Future<List<Employee>> getEmployees() async {
    final db = await _openDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    await db.close();
    return List.generate(maps.length, (index) {
      return Employee(
        id: maps[index]['id'],
        profileImage: maps[index]['profileImage'],
        name: maps[index]['name'],
        username: maps[index]['username'],
        email: maps[index]['email'],
        address: maps[index]['address'],
        phone: maps[index]['phone'],
        website: maps[index]['website'],
        company: maps[index]['company'],
      );
    });
  }
}