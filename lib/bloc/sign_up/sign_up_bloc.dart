import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/data/models/user.dart';
import '/data/repositories/remote/rfc_repository.dart';
import '/data/repositories/remote/auth_repository.dart';
import '/data/repositories/remote/firestore_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

/*
  [SignUpBloc] is a class that help us to
  manage the state when the user try to
  Sign Up, contacting with [AuthRepository],
  [FirestoreRepository] and [RfcRepository], and
  depending of the repositories response it
  updates the state.
*/
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  final AuthRepository _authRepository;
  final FirestoreRepository _firestoreRepository;
  final RfcRepository _rfcRepository;

  SignUpBloc(
    this._authRepository,
    this._firestoreRepository,
    this._rfcRepository
  ) : super(SignUpInitial()) {
    on<OnSignUp>(_onSignUp);
  }

  void _onSignUp( OnSignUp event, Emitter emit ) async {
    emit(SigningUp());
    final isValid = await _rfcRepository.validateRfc(event.user.rfc!);
    if ( isValid ) {
      final response = await _authRepository.signUp(event.user);
      if ( response == null ) {
        final created = await _firestoreRepository.registerUser(event.user);
        if ( created ) {
          event.user.fullName = event.user.fullName!.split(' ')[0];
          return emit(SignedUp(event.user));
        } else {
          return emit(const SignUpError('Cannot creat the account'));
        }
      }
      switch (response) {
        case 'invalid-email':
          return emit(const SignUpError('Invalid email'));
        case 'email-already-in-use':
          return emit(const SignUpError('This email is already registered'));
        default: 
          return emit(SignUpError(response));
      }
    } else {
      return emit(const SignUpError('Invalid RFC'));
    }

  }

}
