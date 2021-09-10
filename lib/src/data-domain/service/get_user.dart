import 'dart:convert';

import 'package:flutter_application_muster/src/data-domain/models/user_model.dart';
import 'package:http/http.dart' as http;

Future getUsers() async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/users");
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return UserModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Users list');
  }
}
