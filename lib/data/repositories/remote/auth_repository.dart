import 'package:finance_app/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

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