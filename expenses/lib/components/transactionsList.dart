import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;
  const TransactionList({
    required this.transactions,
    required this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    _onDelete(String id) {
      onRemove(id);
    }

    return Container(
      height: 610,
      width: double.infinity,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return Card(
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _Value(transaction: tr),
                _TextData(transaction: tr),
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: IconButton(
                    onPressed: () => _onDelete(tr.id),
                    icon: const Icon(Icons.delete_outline),
                    color: Theme.of(context).iconTheme.color,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Value extends StatelessWidget {
  final Transaction transaction;
  const _Value({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
          border: Border.all(
        color: Theme.of(context).primaryColor,
        width: 2,
      )),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Text(
        "R\$ ${transaction.value.toStringAsFixed(2)}",
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _TextData extends StatelessWidget {
  final Transaction transaction;
  const _TextData({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          DateFormat('dd MMM yyyy').format(transaction.date),
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}
