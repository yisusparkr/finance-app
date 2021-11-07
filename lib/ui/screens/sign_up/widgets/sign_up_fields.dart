import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '/constants/contants.dart';


class SignUpFields extends StatelessWidget {
  const SignUpFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
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
            obscureText: true,
            style: Theme.of(context).textTheme.headline1,
            decoration: InputDecoration(
              hintText: Constants.password,
              prefixIcon: LineIcon(LineIcons.lock),
              border: Theme.of(context).inputDecorationTheme.border,
              focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder
            ),
          ),
        ],
      )
    );
  }
}