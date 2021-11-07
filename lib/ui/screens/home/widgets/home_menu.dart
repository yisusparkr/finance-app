import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '/ui/helpers/helpers.dart';
import '/constants/contants.dart';
import '/ui/screens/sign_in/sign_in.dart';
import '/ui/screens/finance_types/finance_types.dart';
import '/ui/screens/widgets/custom_material_button.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({ 
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMaterialButton(
          label: Constants.check,
          icon: LineIcon(
            LineIcons.lineChart,
            size: 26,
          ),
          onPressed: () => navigateTo(
            context, 
            const FinanceTypesScreen()
          ),
        ),
        const SizedBox( height: 15 ),
        CustomMaterialButton(
          color: Colors.red,
          splashColor: Colors.white.withOpacity(0.5),
          highlightColor: Colors.redAccent,
          label: Constants.signOut,
          icon: LineIcon(
            LineIcons.alternateSignOut,
            size: 26,
          ),
          onPressed: () => navigateTo(
            context, 
            const SignInScreen(), 
            true
          ),
        ),
      ],
    );
  }
}