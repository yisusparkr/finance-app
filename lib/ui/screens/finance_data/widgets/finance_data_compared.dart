import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:animate_do/animate_do.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/constants/contants.dart';
import '/bloc/currency/currency_bloc.dart';

class FinanceDataCompared extends StatelessWidget {
  const FinanceDataCompared({ 
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: ( context, state ) {
        if ( state is CurrencyLoaded ) {
          return FadeIn(
            child: Column(
              children: [
                Text(
                  ( state.currency.close.first < state.currency.close.last ) 
                    ? Constants.winning
                    : Constants.losing,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 22
                  ),
                ),
                const SizedBox( height: 10 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${state.currency.close.first}',
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                        fontSize: 20
                      ),
                    ),
                    const SizedBox( width: 10 ),
                    ( state.currency.close.first < state.currency.close.last ) 
                      ? LineIcon(
                        LineIcons.arrowUp,
                        color: Colors.green,
                      )
                      : LineIcon(
                        LineIcons.arrowDown,
                        color: Colors.red,
                      ),
                    const SizedBox( width: 10 ),
                    Text(
                      '${state.currency.close.last}',
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                        fontSize: 20
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }
        return const SizedBox();
      }
    );
  }
}