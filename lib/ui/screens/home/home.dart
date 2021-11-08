import 'package:flutter/material.dart';

import '/data/models/user.dart';
import 'widgets/home_menu.dart';
import 'widgets/home_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ 
    Key? key,
    required this.user,
    required this.isNew,
  }) : super(key: key);

  final UserModel user;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 600
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox( height: 30 ),
                HomeTitle(
                  name: user.fullName!,
                  isNew: isNew,
                ),
                const Spacer(),
                const HomeMenu(),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




