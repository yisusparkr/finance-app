import 'package:flutter/material.dart';

import 'widgets/finance_data_chart.dart';
import 'widgets/finance_data_title.dart';
import 'widgets/finance_data_top_bar.dart';
import 'widgets/finance_data_compared.dart';

class FinanceDataScreen extends StatelessWidget {
  const FinanceDataScreen({ 
    Key? key,
    required this.currency,
    required this.icon
  }) : super(key: key);

  final String currency;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FinanceDataTopBar( 
                currency: currency, 
                icon: icon 
              ),
              const SizedBox( height: 20 ),
              const FinanceDataTitle(),
              const SizedBox( height: 50 ),
              const LinearChart(),
              const SizedBox( height: 50 ),
              const FinanceDataCompared(),
              const SizedBox( height: 20 ),
            ],
          ),
        ),
      ),
    );
  }
}


