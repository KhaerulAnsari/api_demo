import 'dart:convert';
import 'package:http/http.dart' as http;

class Users {
  String id;
  String name;

  Users({this.id, this.name});

  factory Users.createUsers(Map<String, dynamic> object) {
    return Users(
      id: object['id'].toString(),
      name: object['first_name'] + " " + object['last_name'],
    );
  }

  static Future<List<Users>> getUsers(String page) async {
    String apiURL = "https://reqres.in/api/users?page=" + page;

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)['data'];

    List<Users> userss = [];
    for (int i = 0; i < listUser.length; i++)
      userss.add(Users.createUsers(listUser[i]));

    return userss;
  }
}
