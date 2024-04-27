import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:percobaan_apps/model.dart';

class Repository {
  final _BaseUrl = 'http://localhost:8000';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_BaseUrl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Akun> akun = it.map((e) => Akun.fromJson(e)).toList();
        return akun;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postDataRegister(String username, String password, String nama) async {
    print('$username dan $password');
    try {
      final response = await http.post(
        Uri.parse(_BaseUrl + '/auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
          'nama': nama
        }),
      );
      if(response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
