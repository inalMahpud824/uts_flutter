import 'package:flutter/material.dart';
import 'package:percobaan_apps/constans.dart';
import 'package:percobaan_apps/home.dart';
import 'package:percobaan_apps/register.dart';
import 'package:percobaan_apps/repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Repository repository = Repository();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  sendDataLogin() async {
    if (_usernameController.text == '' || _usernameController.text == null) {
      print('data tidak boleh kosong');
      return false;
    }
    bool register = await repository.postDataLogin(_usernameController.text,
        _passwordController.text);
    
    register
        ? Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Home();
          }))
        : print('error');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome Back",
                style: textTextStyle.copyWith(fontSize: 30, fontWeight: bold),
              ),
              SizedBox(height: 11),
              Text(
                "Di aplikasi mobile",
                style: secondaryTextStyle.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 64,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Username",
                    style: textTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                    ),
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "masukan username",
                          hintStyle: textTextStyle.copyWith(
                              fontSize: 12, color: textColor.withOpacity(0.6)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Password",
                    style: textTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: whiteColor,
                    ),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 17),
                          suffixIcon: Icon(Icons.visibility_off)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        "remember me",
                        style: greyTextStyle.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  Text(
                    "Forgot Password?",
                    style: textTextStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  onPressed: sendDataLogin,
                  child: Text(
                    "LOGIN",
                    style: whiteTextStyle.copyWith(fontWeight: bold),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 19),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://tse2.mm.bing.net/th?id=OIP.HG6XtzIxf4Nbo_vZt8T3EAHaHa&pid=Api&P=0&h=180",
                        height: 20,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "SIGN IN WITH GOOGLE",
                        style: textTextStyle.copyWith(fontWeight: bold),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You don't have an account yet?",
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigasi ke halaman pendaftaran di sini
                      // Misalnya:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text(
                      "Sign up",
                      style: tncTextStyle.copyWith(fontSize: 12),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
