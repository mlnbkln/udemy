import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemy_2/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletTx;

  TransactionList(this.transactions, this.deletTx);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
      child: transactions.isEmpty
          ? Column(
        children: [
          Text(
            'No transacions added yet!',
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/waiting.png'),
                  fit: BoxFit.contain,
            ),
              ),
          ),
        ],
      )
      : ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 5
        ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child:FittedBox(
                    child: Text('\$${transactions[index].amount}'),
                  ),
                ),
              ),
              title: Text(
                transactions[index].title,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(transactions[index].date),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deletTx(
                  transactions[index].id
                ),
              ),
            ),
        );
        },
        itemCount: transactions.length,
    ),
    );
  }
}

