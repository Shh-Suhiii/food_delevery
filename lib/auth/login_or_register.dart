import 'package:flutter/material.dart';
import 'package:fooddelivery2/pages/login_page.dart';
import 'package:fooddelivery2/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initially login page
  bool showLoginPage = true;
  void togglesPages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  //toggle betwen login and register
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(ontap: togglesPages);
    } else {
      return RegisterPage(ontap: togglesPages);
    }
  }
}
