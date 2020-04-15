import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spentAmount;
  final double spendingPercentageTotal;

  ChartBar({this.label, this.spendingPercentageTotal, this.spentAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
              fit: BoxFit.contain,
              child: Text("\$${spentAmount.toStringAsFixed(0)}")),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, .6),
                    borderRadius: BorderRadius.circular(2)),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentageTotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(2)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
