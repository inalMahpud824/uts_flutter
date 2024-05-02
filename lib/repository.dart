import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:percobaan_apps/profile.dart';

class Repository {
  final _BaseUrl = 'http://10.0.2.2:8000';
  // final _BaseUrl = 'http://localhost:8000';

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
      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postDataLogin(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(_BaseUrl + '/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future getDataProfile() async {
    try {
      final response = await http.get(Uri.parse(_BaseUrl + '/profile'));

      // print(response.statusCode);

      if (response.statusCode == 200) {
        // print(response.body);
        Iterable it = jsonDecode(response.body);
        // print(it);
        List<Profile> profile = it.map((e) => Profile.fromJson(e)).toList();
        print('ini adalah profile: ');
        return profile;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postDataProfile(File imageFile, double latitude, double longitude,
      String name, String provinsi, String kabupaten) async {
    try {
      print('$name $provinsi $kabupaten');
      final request =
          http.MultipartRequest('post', Uri.parse(_BaseUrl + '/profile'));
      request.files
          .add(await http.MultipartFile.fromPath('file', imageFile.path));

      request.fields['name'] = name.toString(); // Contoh data nama
      request.fields['provinsi'] = provinsi.toString(); // Contoh data nama
      request.fields['kabupaten'] = kabupaten.toString(); // Contoh data nama
      request.fields['latitude'] = latitude.toString(); // Contoh data nama
      request.fields['latitude'] = latitude.toString(); // Contoh data nama
      request.fields['longtitude'] = longitude.toString(); // Contoh data umur
      final response = await request.send();
      print(response);

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteProfile(dynamic id) async {
    print(id);
    try {
      final response = await http.delete(Uri.parse(_BaseUrl + '/profile/$id'));
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future updateDataProfile(dynamic id, File imageFile, double latitude, double longitude,
      String name, String provinsi, String kabupaten) async {
    try {
      print('$name $provinsi $kabupaten $latitude $longitude $imageFile');
      final request =
          http.MultipartRequest('put', Uri.parse(_BaseUrl + '/profile/${id}'));
      request.files
          .add(await http.MultipartFile.fromPath('file', imageFile.path));

      request.fields['name'] = name.toString(); // Contoh data nama
      request.fields['provinsi'] = provinsi.toString(); // Contoh data nama
      request.fields['kabupaten'] = kabupaten.toString(); // Contoh data nama
      request.fields['latitude'] = latitude.toString(); // Contoh data nama
      request.fields['latitude'] = latitude.toString(); // Contoh data nama
      request.fields['longtitude'] = longitude.toString(); // Contoh data umur
      final response = await request.send();
      print(response);

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
