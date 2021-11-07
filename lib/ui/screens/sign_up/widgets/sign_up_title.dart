import 'package:flutter/material.dart';

import '/constants/contants.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Constants.createAccount,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox( height: 5 ),
          Text(
            Constants.sayHello,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.secondary
            ),
          ),
        ],
      )
    );
  }
}
