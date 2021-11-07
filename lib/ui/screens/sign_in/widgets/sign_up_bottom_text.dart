import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '/ui/helpers/helpers.dart';
import '/ui/screens/sign_up/sign_up.dart';
import '/constants/contants.dart';

class SignUpBottomText extends StatelessWidget {
  const SignUpBottomText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: Constants.withoutAccount,
        style: Theme.of(context).textTheme.subtitle2,
        children: [
          TextSpan(
            text: Constants.signUp,
            style: Theme.of(context).textTheme.subtitle2?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.secondary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => navigateTo(
                context, 
                const SingUpScreen()
              )
          )
        ]
      )
    );
  }
}