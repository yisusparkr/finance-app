import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '/constants/contants.dart';

class SignInImage extends StatelessWidget {
  const SignInImage({ 
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      Constants.signInLottie,
      height: 150,
      width: 200,
    );
  }
}