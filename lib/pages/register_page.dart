import 'package:flutter/material.dart';
import 'package:flutter_textmsg_fb_app/components/my_button.dart';
import 'package:flutter_textmsg_fb_app/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final void Function()? onTap;
  RegisterPage({super.key, this.onTap});

  //Register Method for user can register their ac
  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo...........
            Icon(
              Icons.chat,
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),
            //welcome message.........
            Text(
              'You can create an account for You',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            //email textfield...........
            MyTextField(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 15),
            //password textfield..........
            MyTextField(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 20),
            //Forget password textfield..........
            MyTextField(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _confirmPasswordController,
            ),
            const SizedBox(height: 20),
            //login button............
            MyButton(
              text: ('Register'),
              onTap: register,
            ),
            const SizedBox(
              height: 20,
            ),
            //register now............
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already Registerd? please -->',
                  style: TextStyle(color: Colors.red),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'LogIn Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
