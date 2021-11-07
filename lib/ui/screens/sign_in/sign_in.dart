import 'package:flutter/material.dart';

import 'widgets/sign_in_button.dart';
import 'widgets/sign_in_title.dart';
import 'widgets/sign_in_image.dart';
import 'widgets/sign_in_fields.dart';
import 'widgets/sign_up_bottom_text.dart';
import '../widgets/fields_container.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: FieldsContainer(
            children: [
              SignInImage(),
              SignInTitle(),
              SizedBox( height: 30 ),
              SignInFields(),
              SizedBox( height: 30 ),
              SignInButton(),
              SizedBox( height: 50 ),
              SignUpBottomText(),
              SizedBox( height: 10 ),
            ],
          ),
        ),
      ),
    );
  }
}

