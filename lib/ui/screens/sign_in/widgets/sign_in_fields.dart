import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_in_button.dart';
import '/data/models/user.dart';
import '/constants/contants.dart';
import '/ui/utils/validations.dart';
import '/bloc/sign_in/sign_in_bloc.dart';

class SignInFields extends StatelessWidget {
  SignInFields({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  static final _emailController = TextEditingController();
  static final _rfcController = TextEditingController();
  static final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            validator: (value) => validateEmail(value),
            style: Theme.of(context).textTheme.headline1,
            decoration: InputDecoration(
              hintText: Constants.email,
              prefixIcon: LineIcon(LineIcons.at),
              border: Theme.of(context).inputDecorationTheme.border,
              focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder
            ),
          ),
          const SizedBox( height: 15 ),
          TextFormField(
            controller: _rfcController,
            validator: (value) => validateRfc(value),
            style: Theme.of(context).textTheme.headline1,
            decoration: InputDecoration(
              hintText: Constants.rfc.toUpperCase(),
              prefixIcon: LineIcon(LineIcons.userShield),
              border: Theme.of(context).inputDecorationTheme.border,
              focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder
            ),
          ),
          const SizedBox( height: 15 ),
          TextFormField(
            controller: _passwordController,
            validator: (value) => validatePassword(value),
            obscureText: true,
            style: Theme.of(context).textTheme.headline1,
            decoration: InputDecoration(
              hintText: Constants.password,
              prefixIcon: LineIcon(LineIcons.lock),
              border: Theme.of(context).inputDecorationTheme.border,
              focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder
            ),
          ),
          const SizedBox( height: 30 ),
          SignInButton(
            onPressed: () => _onValidate(context)
          ),
        ],
      )
    );
  }

  void _onValidate( BuildContext context ) {
    if ( _formKey.currentState!.validate() ) {
      final user = UserModel(
        email: _emailController.text,
        rfc: _rfcController.text,
        password: _passwordController.text
      );
      BlocProvider.of<SignInBloc>(context).add(OnSignIn(user));
    }
  }

}