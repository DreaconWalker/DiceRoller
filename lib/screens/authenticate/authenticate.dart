import 'package:dice_roller/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn(),
    );
  }
}
