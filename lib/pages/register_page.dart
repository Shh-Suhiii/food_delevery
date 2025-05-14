import 'package:flutter/material.dart';
import 'package:fooddelivery2/components/My_button.dart';
import 'package:fooddelivery2/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? ontap;
  const RegisterPage({super.key, this.ontap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // textediting controller
  final TextEditingController emailController = TextEditingController();

  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
              "Lets create a accont for you",
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

            // confrim password textfield
            MyTextfield(
              controller: confirmPasswordController,
              hintText: 'ConfirmPassword',
              obsecureText: true,
            ),
            SizedBox(height: 10),

            // sign in button
            MyButton(text: 'signUp', onTap: () {}),

            SizedBox(height: 25),

            // already have a account? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'already have a account?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.ontap,
                  child: Text(
                    'Login Now',
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
