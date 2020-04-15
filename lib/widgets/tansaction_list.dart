import 'package:expenseapp/models/transaction.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransactionHandler;

  TransactionList(this.transactions, this._deleteTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'No transaction added yet.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                // Size box are invisibe but still ocupies space
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  child: Image.asset(
                    'assets/images/shit.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (contex, index) {
                return Card(
                  elevation: 1,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 50,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat().format(transactions[index].date),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey,
                      ),
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          _deleteTransactionHandler(transactions[index].id);
                        }),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
