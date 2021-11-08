import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/currency/currency_bloc.dart';

class LinearChart extends StatelessWidget {
  const LinearChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only( left: 5, right: 25 ),
      constraints: const BoxConstraints(
        maxHeight: 300,
        maxWidth: 600
      ),
      child: BlocBuilder<CurrencyBloc, CurrencyState>(
        builder: ( context, state ) {
          return LineChart(
          LineChartData(
            minX: 1,
            maxX: 10,
            minY: 0,
            gridData: FlGridData(
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2)
                );
              },
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2)
                );
              }
            ),
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                colors: [
                  Theme.of(context).focusColor,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary
                ],
                barWidth: 5,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
                spots: ( state is CurrencyLoaded ) 
                ? List.generate(
                  state.currency.close.length, 
                  (index) => FlSpot(index.toDouble() +1, state.currency.close[index])
                )
                : const [
                  FlSpot(1, 0),
                  FlSpot(3, 1.5),
                  FlSpot(5, 1.4),
                  FlSpot(7, 3.4),
                  FlSpot(10, 2),
                ]
              )
            ],
            lineTouchData: LineTouchData(
              enabled: true,
              handleBuiltInTouches: true,
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: Theme.of(context).colorScheme.primary,
                tooltipRoundedRadius: 20
              )
            ),
            titlesData: FlTitlesData(
              leftTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context, value) {
                  return Theme.of(context).textTheme.headline2;
                },
              ),
              topTitles: SideTitles(
                showTitles: false
              ),
              rightTitles: SideTitles(
                showTitles: false
              ),
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context, value) {
                  return Theme.of(context).textTheme.headline2;
                },
              )
            ),
          ),
          swapAnimationDuration: const Duration( seconds: 3 ),
        );
        }
      ),
    );
  }
}
