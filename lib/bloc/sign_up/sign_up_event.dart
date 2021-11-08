part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class OnSignUp extends SignUpEvent {
  OnSignUp(this.user);
  final UserModel user;
}
