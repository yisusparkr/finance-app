import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'package:finance_app/ui/helpers/helpers.dart';

class SignUpBackButton extends StatelessWidget {
  const SignUpBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      child: LineIcon(LineIcons.arrowLeft),
      onPressed: () => navigateBack(context)
    );
  }
}