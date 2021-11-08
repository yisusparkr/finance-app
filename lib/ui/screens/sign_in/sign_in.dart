import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/helpers/helpers.dart';
import '/ui/screens/home/home.dart';
import 'widgets/sign_in_title.dart';
import 'widgets/sign_in_image.dart';
import 'widgets/sign_in_fields.dart';
import '/bloc/sign_in/sign_in_bloc.dart';
import 'widgets/sign_up_bottom_text.dart';
import '../widgets/fields_container.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if ( state is SigningIn ) {
            showLoadingDialog(context, 'Signin in');
          } else if ( state is SignedIn ) {
            navigateTo(
              context, 
              HomeScreen(user: state.user, isNew: false), 
              true
            );
          } else if ( state is SignInError ) {
            navigateBack(context);
            showError(context, state.errorMessage);
          }
        },
        child: SingleChildScrollView(
          child: Center(
            child: FieldsContainer(
              children: [
                const SignInImage(),
                const SignInTitle(),
                const SizedBox(height: 30),
                SignInFields(),
                const SizedBox(height: 50),
                const SignUpBottomText(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      )
    );
  }
}
