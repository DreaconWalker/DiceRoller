import 'package:dice_roller/screens/homescreen/home.dart';
import 'package:dice_roller/utility/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                dynamic result = await _authService.signInAnony();
                if (result != null) {
                  print('error signed in');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(title: 'Dice Roller'),
                    ),
                  );
                }
              },
              child: Text('Sign in as guest'))
        ],
      ),
    );
  }
}
