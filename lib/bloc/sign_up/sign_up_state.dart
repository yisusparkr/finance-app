part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
  
  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SigningUp extends SignUpState {}

class SignedUp extends SignUpState {
  const SignedUp(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class SignUpError extends SignUpState {
  const SignUpError(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];

}
