import 'package:flutter/material.dart';

import 'widgets/finance_data_chart.dart';
import 'widgets/finance_data_title.dart';
import 'widgets/finance_data_top_bar.dart';
import 'widgets/finance_data_compared.dart';

class FinanceDataScreen extends StatelessWidget {
  const FinanceDataScreen({ 
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              FinanceDataTopBar(),
              SizedBox( height: 20 ),
              FinanceDataTitle(),
              SizedBox( height: 50 ),
              LinearChart(),
              SizedBox( height: 50 ),
              FinanceDataCompared()
            ],
          ),
        ),
      ),
    );
  }
}


