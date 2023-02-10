import 'package:http/http.dart' as http;
import 'dart:convert';

import '../moduls/user.dart';

class UserApi{

  List<User> users = [];

  Future getData(String url) async {
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final result = data as List<dynamic>;
      print(result);
      users = result.map((j) {
        return User.fromJson(j);
      }).toList();
      return users;
    } else {
      print("Error");
    }
  }
}