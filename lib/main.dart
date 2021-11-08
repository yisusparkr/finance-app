import 'package:flutter/material.dart' show runApp, WidgetsFlutterBinding;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app.dart';
import 'bloc/sign_up/sign_up_bloc.dart';
import '/bloc/sign_in/sign_in_bloc.dart';
import '/bloc/currency/currency_bloc.dart';
import '/data/repositories/remote/rfc_repository.dart';
import '/data/repositories/remote/auth_repository.dart';
import '/data/repositories/remote/yahoo_repository.dart';
import '/data/repositories/remote/firestore_repository.dart';

/* 
  In the main process is where the program start,
  inside we need to ensure thath the widgets are
  initialized before initializing Firebase,
  then the app is launched.
*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    /*
      MultiBlocProvider is used to register
      the blocs that are used in the entire
      app as sate management.
    */
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SignInBloc(
            AuthRepository(),
            FirestoreRepository(),
            RfcRepository()
          )
        ),
        BlocProvider(
          create: (_) => SignUpBloc(
            AuthRepository(),
            FirestoreRepository(),
            RfcRepository()
          )
        ),
        BlocProvider(
          create: (_) => CurrencyBloc(
            YahooRepository()
          ),
        )
      ],
      child: const MyApp()
    )
  );
}