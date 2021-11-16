import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/test.mocks.dart';
import 'package:finance_app/data/models/user.dart';
import 'package:finance_app/bloc/sign_in/sign_in_bloc.dart';

void main() {
  group('SignInBloc', (){

    final authRepository = MockAuthRepository();
    final firestoreRepository = MockFirestoreRepository();
    final rfcRepository = MockRfcRepository();
    final user = UserModel(
      email: 'email@email.com',
      rfc: 'example'
    );
    late SignInBloc bloc;

    setUpAll((){      
      bloc = SignInBloc(
        authRepository, 
        firestoreRepository, 
        rfcRepository
      );
      registerFallbackValue(UserModel());
    });

    tearDownAll(() async => await bloc.close());

    test('auth fake user', () async {
      when(() => authRepository.signIn(any()))
        .thenAnswer((_) async => 'error');
      // act
      bloc.add(OnSignIn(user));
      // expect
      await expectLater(bloc.stream, emitsInOrder([
        SigningIn(), 
        const SignInError('error')]
      ));
    });

    test('auth real user with fake RFC', () async {
      when(() => authRepository.signIn(any()))
        .thenAnswer((_) async => null);
      when(() => rfcRepository.validateRfc(any()))
        .thenAnswer((_) async => false);
      // act
      bloc.add(OnSignIn(user));
      // expect
      await expectLater(bloc.stream, emitsInOrder([
        SigningIn(), 
        const SignInError('Invalid RFC')]
      ));
    });

    test('auth real user but not registered in frestore', () async {
      when(() => authRepository.signIn(any()))
        .thenAnswer((_) async => null);
      when(() => rfcRepository.validateRfc(any()))
        .thenAnswer((_) async => true);
      when(() => firestoreRepository.getUserName(any()))
        .thenAnswer((_) async => null);
      // act
      bloc.add(OnSignIn(user));
      // expect
      await expectLater(bloc.stream, emitsInOrder([
        SigningIn(), 
        const SignInError('Cannot find the account')
      ]));
    });

    test('auth real user', () async {
      when(() => authRepository.signIn(any()))
        .thenAnswer((_) async => null);
      when(() => rfcRepository.validateRfc(any()))
        .thenAnswer((_) async => true);
      when(() => firestoreRepository.getUserName(any()))
        .thenAnswer((_) async => 'Jesus');
      // act
      bloc.add(OnSignIn(user));
      // expect
      await expectLater(bloc.stream, emitsInOrder([
        SigningIn(),
        SignedIn(user)
      ]));
    });
    
  });

}
