part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class OnSignIn extends SignInEvent {
  OnSignIn(this.user);
  final UserModel user;
}
