import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final myController = TextEditingController();
  final mycontrollerPassword = TextEditingController();
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    mycontrollerPassword.dispose();
    super.dispose();
  }

  var text = '';
  var password = '';
  tambahdata() {
    setState(() {
      text = myController.text;
      password = mycontrollerPassword.text;
      // number = number + 1;
    });
  }

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
                      controller: myController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'Masukkan Username',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: mycontrollerPassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan Password',
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      child: Text('Masukan'),
                      onPressed: tambahdata,
                    ),
                    SizedBox(height: 16),
                    Text(text),
                    Text(password)
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
