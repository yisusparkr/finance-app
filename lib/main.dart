import 'package:finance_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'ui/screens/sign_in/sign_in.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance App',
      theme: theme,
      home: const SignInScreen()
    );
  }
}