import 'package:flutter/material.dart';

class FinanceDataTitle extends StatelessWidget {
  const FinanceDataTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '3.141 NSDQ',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox( height: 5 ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).focusColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Text(
            '06/11/2021',
            style: Theme.of(context).textTheme.headline2?.copyWith(
              fontSize: 16
            ),
          ),
        ),
      ],
    );
  }
}
