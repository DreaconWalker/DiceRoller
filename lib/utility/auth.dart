import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool? _success;
  String _userEmail = '';

  //sign in anonymously
  Future signInAnony() async {
    try {
      var result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
    }
  }
//sign in with email and password

//register with email and password
  // Future<void> _register() async {
  //   final User? user = (await _auth.createUserWithEmailAndPassword(
  //     email: _emailController.text,
  //     password: _passwordController.text,
  //   ))
  //       .user;
  //   if (user != null) {
  //     _success = true;
  //     _userEmail = user.email ?? '';
  //   } else {
  //     _success = false;
  //   }
  // }
//signout

}
