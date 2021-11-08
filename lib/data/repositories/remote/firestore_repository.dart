import 'package:cloud_firestore/cloud_firestore.dart';

import '/data/models/user.dart';

/*
  [FirestoreRepository] is a class that interact as
  our database repository, it help us to
  contact to Firebase Firestore and return a response.
*/
class FirestoreRepository {

  final _firestore = FirebaseFirestore.instance.collection('users');

  Future<bool> registerUser( UserModel user ) async {
    try {
      await _firestore.doc(user.email).set({
        'full_name': user.fullName,
        'email': user.email,
        'rfc': user.rfc
      });
      return true;
    } catch(error) {
      return false;
    }
  }

  Future<String?> getUserName( String email ) async {
    try {
      final response = await _firestore.doc(email).get();
      final data = response.data();
      final String name = data!['full_name'];
      return name;
    } catch(error) {
      return null;
    }
  }

}