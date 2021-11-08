import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/data/models/user.dart';
import '/data/repositories/remote/rfc_repository.dart';
import '/data/repositories/remote/auth_repository.dart';
import '/data/repositories/remote/firestore_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {

  final AuthRepository _authRepository;
  final FirestoreRepository _firestoreRepository;
  final RfcRepository _rfcRepository;

  SignInBloc(
    this._authRepository,
    this._firestoreRepository,
    this._rfcRepository
  ) : super(SignInInitial()) {
    on<OnSignIn>(_onSignIn);
  }

  void _onSignIn( OnSignIn event, Emitter<SignInState> emit ) async {
    emit(SigningIn());
    final response = await _authRepository.signIn(event.user);
    if ( response == null ) {
      final isValid = await _rfcRepository.validateRfc(event.user.rfc!);
      if ( isValid ) {
        final name = await _firestoreRepository.getUserName(event.user.email!);
        if ( name != null ) {
          event.user.fullName = name.split(' ')[0];
          return emit(SignedIn(event.user));
        } else {
          return emit(const SignInError('Cannot find the account'));
        }
      } else {
        return emit(const SignInError('Invalid RFC'));
      }
    }
    switch (response) {
      case 'invalid-email':
        return emit(const SignInError('Invalid email'));
      case 'user-not-found':
        return emit(const SignInError('This account doesn\'t exists'));
      case 'wrong-password':
        return emit(const SignInError('Wrong password'));
      default: 
        return emit(SignInError(response));
    }
  }

}
