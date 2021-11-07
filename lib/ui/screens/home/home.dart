import 'package:flutter/material.dart';

import 'widgets/home_menu.dart';
import 'widgets/home_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

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
              children: const [
                SizedBox( height: 30 ),
                HomeTitle(),
                Spacer(),
                HomeMenu(),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




