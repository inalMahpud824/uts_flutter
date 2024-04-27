import 'package:flutter/material.dart';
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

  sendData() async {
    if (_usernameController.text == '' ||
        _usernameController.text == null ||
        _namaController.text == '' ||
        _namaController.text == null) {
      return false;
    }
    bool register = await repository.postData(_usernameController.text,
        _passwordController.text, _namaController.text);
  }

  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   mycontrollerPassword.dispose();
  //   super.dispose();
  // }

  // var text = '';
  // var password = '';
  // tambahdata() {
  //   setState(() {
  //     text = myController.text;
  //     password = mycontrollerPassword.text;
  //     // number = number + 1;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Sederhana'),
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

                    SizedBox(height: 16),
                    ElevatedButton(
                      child: Text('Masukan'),
                      onPressed: sendData
                    ),
                    SizedBox(height: 16),
                    // Text(text),
                    // Text(password)
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
