import 'package:flutter/material.dart';
import 'package:percobaan_apps/getData.dart';
import 'package:percobaan_apps/repository.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Repository repository = Repository();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _namaController = TextEditingController();
  final _confirmPassword = TextEditingController();

  sendData() async {
    if (_usernameController.text == '' ||
        _usernameController.text == null ||
        _namaController.text == '' ||
        _namaController.text == null) {
      print('data tidak boleh kosong');
      return false;
    }
    if(_passwordController.text != _confirmPassword.text){
      print('password tidak sesuai');
      return false;
    }
    bool register = await repository.postData(_usernameController.text,
        _passwordController.text, _namaController.text);
    register
        ? Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AmbilData();
          }))
        : print('error');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(children: [
                    TextField(
                      controller: _namaController,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan Nama Lengkap',
                        labelText: 'Nama Lengkap',
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'Masukkan Username',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan Password',
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _confirmPassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                        labelText: 'Confirm Password',
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(child: Text('Daftar'), onPressed: sendData),
                    SizedBox(height: 16),
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
