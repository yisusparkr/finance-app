import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/constants/contants.dart';
import '/ui/helpers/helpers.dart';
import '/bloc/currency/currency_bloc.dart';
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
          heroTag: Constants.nasdaq,
          color: Colors.indigo,
          label: Constants.nasdaq,
          icon: LineIcon(LineIcons.shekelSign),
          onPressed: () {
            BlocProvider.of<CurrencyBloc>(context)
              .add(OnLoadCurrency(Constants.nasdaq));
            navigateTo(
              context, 
              const FinanceDataScreen(
                currency: Constants.nasdaq,
                icon: LineIcons.shekelSign,
              )
            );
          },
        ),
        const SizedBox( height: 10 ),
        CustomMaterialButton(
          color: Colors.deepPurple,
          label: Constants.nikkei,
          icon: LineIcon(LineIcons.dollarSign),
          onPressed: () {
            BlocProvider.of<CurrencyBloc>(context)
              .add(OnLoadCurrency(Constants.nikkei));
            navigateTo(
              context, 
              const FinanceDataScreen(
                currency: Constants.nikkei,
                icon: LineIcons.dollarSign
              )
            );
          },
        ),
        const SizedBox( height: 10 ),
        CustomMaterialButton(
          color: Colors.teal,
          label: Constants.dax,
          icon: LineIcon(LineIcons.coins),
          onPressed: () {
            BlocProvider.of<CurrencyBloc>(context)
              .add(OnLoadCurrency(Constants.dax));
            navigateTo(
              context, 
              const FinanceDataScreen(
                currency: Constants.dax,
                icon: LineIcons.coins,
              )
            );
          },
        ),
      ],
    );
  }
}
