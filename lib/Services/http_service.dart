import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:employee_details/Models/employee_model.dart';

class HTTPService {
  HTTPService();

  List<UserModel> userList = [];

  Future<List<UserModel>> getUserList() async {
    userList.clear();
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }
}
