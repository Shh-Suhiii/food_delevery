import 'package:flutter/material.dart';
import 'package:fooddelivery2/components/My_button.dart';
import 'package:fooddelivery2/components/my_textfield.dart';
import 'package:fooddelivery2/pages/Home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? ontap;

  LoginPage({super.key, this.ontap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // textediting controller
  final TextEditingController emailController = TextEditingController();

  final TextEditingController PasswordController = TextEditingController();

  // login method
  void login() {
    /*
           fill out he authentication here 
    */

    // nasvigate to the homepage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(height: 25),

            // msg app slogan
            Text(
              "Food delievery app",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            SizedBox(height: 25),

            // email textfeild
            MyTextfield(
              controller: emailController,
              hintText: 'email',
              obsecureText: false,
            ),
            SizedBox(height: 10),

            // password textfield
            MyTextfield(
              controller: PasswordController,
              hintText: 'Password',
              obsecureText: true,
            ),
            SizedBox(height: 10),

            // sign in button
            MyButton(text: 'signIn', onTap: login),

            SizedBox(height: 25),

            // not a member / register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'not a Member?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.ontap,
                  child: Text(
                    'Register Now',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
