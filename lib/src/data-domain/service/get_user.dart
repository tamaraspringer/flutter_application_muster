import 'dart:convert';

import 'package:flutter_application_muster/src/data-domain/models/user.dart';
import 'package:http/http.dart' as http;

Future<List<UserModel>> getUsers() async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/users");
  final response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    var usersList = <UserModel>[];
    for (var u in jsonData) {
      print(u);
      UserModel user = UserModel(u["id"], u["name"], u["email"]);
      usersList.add(user);
    }
    print(usersList.length);
    return usersList;
  } else {
    throw Exception('Failed to load Users list');
  }
}
