import 'package:finance_app/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*
  [AuthRepository] is a class that interact as
  our authentication repository, it help us to
  contact to Firebase Auth and return a response.
*/
class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<String?> signIn(UserModel user) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: user.email!, 
        password: user.password!
      );
    } on FirebaseAuthException catch(error) {
      return error.code;
    }
  }

  Future<String?> signUp(UserModel user) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email!, 
        password: user.password!
      );
    } on FirebaseAuthException catch(error) {
      return error.code;
    }
  }

}