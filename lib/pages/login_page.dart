import 'package:flutter/material.dart';
import 'package:flutter_textmsg_fb_app/auth/auth_service.dart';
import 'package:flutter_textmsg_fb_app/components/my_button.dart';
import 'package:flutter_textmsg_fb_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //for tap the Register Now Text
  final void Function()? onTap;

  LoginPage({super.key, this.onTap});

  // login method for login button
  void logIn(BuildContext context) {
    //get auth service
    final _authService = AuthService();
    //try to login
    if (_passwordController.text == _passwordController.text) {
      try {
        _authService.signInWithemailAndPassword(
            _emailController.text, _passwordController.text);
      }
      //catch the errors
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => (AlertDialog(
            title: Text(e.toString()),
          )),
        );
      }
    }
    //Password Not match, show the error
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password Not Match"),
        ),
      );
    }
  }

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
              'Welcome to Message Chatting App, let"s chat',
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
            //login button............
            MyButton(
              text: ('LogIn'),
              onTap: () => logIn(context),
            ),
            const SizedBox(
              height: 20,
            ),
            //register now............
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Not registerd user? please -->',
                  style: TextStyle(color: Colors.red),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Register Now',
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
