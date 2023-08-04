
import 'Address.dart';
import 'Company.dart';

class Employee {
  Employee({
      required this.id,
      required this.name,
      required this.username,
      required this.email,
      this.profileImage,
      required this.address,
      this.phone,
      this.website,
      this.company,});

  Employee.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    profileImage = json['profile_image'];
    address = (json['address'] != null ? Address.fromJson(json['address']) : null)!;
    phone = json['phone'];
    website = json['website'];
    company = json['company'] != null ? Company.fromJson(json['company']) : null;
  }
  late int id;
  late String name;
  late String username;
  late String email;
    String? profileImage;
  late Address address;
  dynamic? phone;
  String? website;
  Company? company;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['username'] = username;
    map['email'] = email;
    map['profile_image'] = profileImage;
    if (address != null) {
      map['address'] = address.toJson();
    }
    map['phone'] = phone;
    map['website'] = website;
    if (company != null) {
      map['company'] = company!.toJson();
    }
    return map;
  }

  Map<String, dynamic> toMap() {

      final map = <String, dynamic>{};
      map['id'] = id;
      map['name'] = name;
      map['username'] = username;
      map['email'] = email;
      map['profile_image'] = profileImage;
      if (address != null) {
        map['address'] = address.toJson();
      }
      map['phone'] = phone;
      map['website'] = website;
      if (company != null) {
        map['company'] = company!.toJson();
      }
      return map;
  }

}