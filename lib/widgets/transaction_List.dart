import 'package:flutter/material.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  final Function deleteTx;
  TransactionList(this.userTransaction,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: userTransaction.isEmpty
          ? Column(
              children: [
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child:
                                  Text('\₹${userTransaction[index].amount}'))),
                    ),
                    title: Text(
                      userTransaction[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(userTransaction[index].date),
                    ),
                    trailing: IconButton(
                      onPressed: () =>  deleteTx(userTransaction[index].id),
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).primaryColor),
                      
                  ),
                );
              },
              itemCount: userTransaction.length,
            ),
    );
  }
}
