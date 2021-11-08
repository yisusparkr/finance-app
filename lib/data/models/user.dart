/*
  [UserModel] is a class used to store
  the user data.
*/
class UserModel {
  UserModel({
    this.fullName, 
    this.email, 
    this.rfc, 
    this.password
  });

  String? fullName;
  String? email;
  String? rfc;
  String? password;

}