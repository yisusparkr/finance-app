import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/helpers/helpers.dart';
import '/ui/screens/home/home.dart';
import 'widgets/sign_up_title.dart';
import 'widgets/sign_up_fields.dart';
import '/bloc/sign_up/sign_up_bloc.dart';
import 'widgets/sign_up_back_button.dart';
import '/ui/screens/widgets/fields_container.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if ( state is SigningUp ) {
            showLoadingDialog(context, 'Signing up');
          } else if ( state is SignedUp ) {
            navigateBack(context);
            navigateTo(
              context, 
              HomeScreen(user: state.user, isNew: true), 
              true
            );
          } else if ( state is SignUpError ) {
            navigateBack(context);
            showError(context, state.errorMessage);
          }
      },
      child: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SignUpBackButton(),
            Center(
              child: FieldsContainer(children: [
                const SignUpTitle(),
                const SizedBox(height: 30),
                SignUpFields(),
                const SizedBox(height: 10),
              ]),
            )
          ],
        )),
      ),
    ));
  }
}
