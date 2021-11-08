import 'package:flutter/material.dart';

import '/constants/contants.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    required this.onPressed
  }) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      height: 50,
      minWidth: 150,
      shape: const StadiumBorder(),
      color: Theme.of(context).colorScheme.secondary,
      child: Text(
        Constants.signUp,
        style: Theme.of(context).textTheme.headline2,
      ),
      onPressed: onPressed
    );
  }
}
