import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '/constants/contants.dart';
import '/ui/helpers/helpers.dart';
import '/ui/screens/finance_data/finance_data.dart';
import '/ui/screens/widgets/custom_material_button.dart';

class FinanceTypesMenu extends StatelessWidget {
  const FinanceTypesMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMaterialButton(
          color: Colors.indigo,
          label: Constants.nasdaq,
          icon: LineIcon(LineIcons.shekelSign),
          onPressed: () => navigateTo(
            context, 
            const FinanceDataScreen()
          ),
        ),
        const SizedBox( height: 10 ),
        CustomMaterialButton(
          color: Colors.deepPurple,
          label: Constants.nikkei,
          icon: LineIcon(LineIcons.dollarSign),
          onPressed: () {},
        ),
        const SizedBox( height: 10 ),
        CustomMaterialButton(
          color: Colors.teal,
          label: Constants.dax,
          icon: LineIcon(LineIcons.coins),
          onPressed: () {},
        ),
      ],
    );
  }
}
