import 'package:expenseapp/models/transaction.dart';
import 'package:expenseapp/widgets/chart_bars.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {"day": DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  double get totalSpendingPerWeek {
    return groupedTransactionValues.fold(0.0, (summed, tranx) {
      return summed + tranx['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactionValues.map((singleTranx) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: singleTranx['day'],
                spendingPercentageTotal: totalSpendingPerWeek == 0.0
                    ? 0.0
                    : (singleTranx['amount'] as double) / totalSpendingPerWeek,
                spentAmount: singleTranx['amount'],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
