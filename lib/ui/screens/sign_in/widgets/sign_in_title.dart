import 'package:flutter/material.dart';

import '/constants/contants.dart';

class SignInTitle extends StatelessWidget {
  const SignInTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
          text: Constants.welcomeTo,
          style: Theme.of(context).textTheme.bodyText2,
          children: [
            TextSpan(
              text: Constants.financeApp.toUpperCase(),
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: Theme.of(context).colorScheme.secondary
              )
            )
          ]
        ),
      ),
    );
  }
}