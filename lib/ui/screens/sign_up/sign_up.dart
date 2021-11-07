import 'package:flutter/material.dart';

import 'widgets/sign_up_title.dart';
import 'widgets/sign_up_button.dart';
import 'widgets/sign_up_fields.dart';
import 'widgets/sign_up_back_button.dart';
import '/ui/screens/widgets/fields_container.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SignUpBackButton(),
              Center(
                child: FieldsContainer(
                  children: [
                    SignUpTitle(),
                    SizedBox( height: 30 ),
                    SignUpFields(),
                    SizedBox( height: 30 ),
                    SignUpButton(),
                    SizedBox( height: 10 ),
                  ]
                ),
              )
            ],
          )
        ),
      )
    );
  }
}