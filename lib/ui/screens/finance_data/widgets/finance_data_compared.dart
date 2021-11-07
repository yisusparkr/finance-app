import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '/constants/contants.dart';

class FinanceDataCompared extends StatelessWidget {
  const FinanceDataCompared({ 
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Constants.winning,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
            fontSize: 22
          ),
        ),
        const SizedBox( height: 10 ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '3.010',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                fontSize: 20
              ),
            ),
            const SizedBox( width: 10 ),
            LineIcon(
              LineIcons.arrowUp,
              color: Colors.green,
            ),
            const SizedBox( width: 10 ),
            Text(
              '3.141',
              style: Theme.of(context).textTheme.headline2?.copyWith(
                fontSize: 20
              ),
            ),
          ],
        )
      ],
    );
  }
}