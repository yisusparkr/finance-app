import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/test.mocks.dart';
import 'package:finance_app/data/models/user.dart';
import 'package:finance_app/bloc/sign_up/sign_up_bloc.dart';


void  main() {
  group('SignUpBloc', () {

    final authRepository = MockAuthRepository();
    final rfcRepository = MockRfcRepository();
    final firestoreRepository = MockFirestoreRepository();
    final user = UserModel(
      fullName: 'Jesus Coronado',
      email: 'email@email.com',
      rfc: 'example'
    );
    late SignUpBloc bloc;

    setUpAll(() {
      bloc = SignUpBloc(
        authRepository,
        firestoreRepository,
        rfcRepository
      );

      registerFallbackValue(user);
    });

    tearDownAll(() async => await bloc.close());

    test('sign up with invalid RFC', () async {
      when(() => rfcRepository.validateRfc(any()))
        .thenAnswer((_) async => false);
      // act
      bloc.add(OnSignUp(user));
      // expect
      await expectLater(bloc.stream, emitsInOrder([
        SigningUp(),
        const SignUpError('Invalid RFC')
      ]));
    });

    test('sign up with email already in use', () async {
      when(() => rfcRepository.validateRfc(any()))
        .thenAnswer((_) async => true);
      when(() => authRepository.signUp(any()))
        .thenAnswer((_) async => 'email-already-in-use');
      // act
      bloc.add(OnSignUp(user));
      // expect
      await expectLater(bloc.stream, emitsInOrder([
        SigningUp(),
        const SignUpError('This email is already registered')
      ]));
    });

    test('sign up with error in firestore ', () async {
      when(() => rfcRepository.validateRfc(any()))
        .thenAnswer((_) async => true);
      when(() => authRepository.signUp(any()))
        .thenAnswer((_) async => null);
      when(() => firestoreRepository.registerUser(any()))
        .thenAnswer((_) async => false);
      // act
      bloc.add(OnSignUp(user));
      // expect
      await expectLater(bloc.stream, emitsInOrder([
        SigningUp(),
        const SignUpError('Cannot creat the account')
      ]));
    });

    test('sign up without errors', () async {
      when(() => rfcRepository.validateRfc(any()))
        .thenAnswer((_) async => true);
      when(() => authRepository.signUp(any()))
        .thenAnswer((_) async => null);
      when(() => firestoreRepository.registerUser(any()))
        .thenAnswer((_) async => true);
      // act
      bloc.add(OnSignUp(user));
      // expect
      await expectLater(bloc.stream, emitsInOrder([
        SigningUp(),
        SignedUp(user)
      ]));
    });

  });
}