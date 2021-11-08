import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_up_button.dart';
import '/data/models/user.dart';
import '/constants/contants.dart';
import '/ui/utils/validations.dart';
import '/bloc/sign_up/sign_up_bloc.dart';

class SignUpFields extends StatelessWidget {
  SignUpFields({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  static final _fullNameController = TextEditingController();
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
            controller: _fullNameController,
            validator: (value) => validateFullName(value),
            textCapitalization: TextCapitalization.words,
            style: Theme.of(context).textTheme.headline1,
            decoration: InputDecoration(
              hintText: Constants.fullName,
              prefixIcon: LineIcon(LineIcons.user),
              border: Theme.of(context).inputDecorationTheme.border,
              focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder
            ),
          ),
          const SizedBox( height: 15 ),
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
            textCapitalization: TextCapitalization.characters,
            style: Theme.of(context).textTheme.headline1,
            decoration: InputDecoration(
              hintText: Constants.rfc,
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
          SignUpButton(
            onPressed: () => _onValidate(context),
          ),
        ],
      )
    );
  }

  void _onValidate( BuildContext context ) {
    if ( _formKey.currentState!.validate() ) {
      final user = UserModel(
        fullName: _fullNameController.text,
        email: _emailController.text,
        rfc: _rfcController.text,
        password: _passwordController.text
      );
      BlocProvider.of<SignUpBloc>(context).add(OnSignUp(user));
    }
  }

}