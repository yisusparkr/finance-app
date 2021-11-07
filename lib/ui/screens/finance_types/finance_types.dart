import 'package:flutter/material.dart';

import 'finance_types_menu.dart';
import 'finance_types_back_button.dart';

class FinanceTypesScreen extends StatelessWidget {
  const FinanceTypesScreen({ 
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FinanceTypesBackButton(),
              Spacer(),
              FinanceTypesMenu(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}


