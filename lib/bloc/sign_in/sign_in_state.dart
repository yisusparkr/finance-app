part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();
  
  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SigningIn extends SignInState {}

class SignedIn extends SignInState {
  const SignedIn(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class SignInError extends SignInState {
  const SignInError(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];

}
