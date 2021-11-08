import 'package:flutter/material.dart';

import 'ui/theme/theme.dart';
import 'ui/screens/sign_in/sign_in.dart';
import '/constants/contants.dart';

/* 
  [MyApp] is the widget that wraps the
  entire app, using [MaterialApp].
*/
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.financeApp,
      theme: theme,
      home: const SignInScreen()
    );
  }
}