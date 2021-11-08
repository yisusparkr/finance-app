import 'package:finance_app/ui/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class FinanceTypesBackButton extends StatelessWidget {
  const FinanceTypesBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: RawMaterialButton(
        shape: const CircleBorder(),
        child: LineIcon(LineIcons.arrowLeft),
        onPressed: () => navigateBack(context)
      ),
    );
  }
}