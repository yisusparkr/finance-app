import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/currency/currency_bloc.dart';

class FinanceDataTitle extends StatefulWidget {
  const FinanceDataTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<FinanceDataTitle> createState() => _FinanceDataTitleState();
}

class _FinanceDataTitleState extends State<FinanceDataTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController currentValueController;
  late Animation animation;
  final date = DateTime.now();

  @override
  void initState() {
    currentValueController = AnimationController(
      vsync: this, 
      duration: const Duration(seconds: 3)
    );
    animation = Tween<double>(
      begin: 0.0,
      end: 10
    ).animate(currentValueController);
    super.initState();
  }

  @override
  void dispose() {
    currentValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<CurrencyBloc, CurrencyState>(
          builder: (context, state) {
            if ( state is CurrencyLoaded ) {
              animation = Tween<double>(
                begin: 0.0,
                end: state.currency.close.last
              ).animate(CurvedAnimation(
                parent: currentValueController, 
                curve: Curves.ease
              ));
              currentValueController.forward();
              return AnimatedBuilder(
                animation: animation, 
                builder: (context, child) {
                  return Text(
                    '${animation.value.toStringAsFixed(2)} ${state.currency.symbol}',
                    style: Theme.of(context).textTheme.bodyText1,
                  );
                },
              );
            } else {
              return Text(
                '${animation.value.toStringAsFixed(2)} Currency',
                style: Theme.of(context).textTheme.bodyText1,
              );
            }
          },
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).focusColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Text(
            '${date.day}/${date.month}/${date.year}',
            style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
