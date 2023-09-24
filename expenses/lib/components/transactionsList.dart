import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;
  final void Function(String) onEdit;
  const TransactionList({
    required this.transactions,
    required this.onRemove,
    required this.onEdit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    _onDelete(String id) {
      onRemove(id);
    }

    _onEdit(String id){
        onEdit(id);
    }
    return (transactions.isNotEmpty)
        ? TransactionListView(transactions, _onDelete, _onEdit)
        : const WaitingScreen();
  }
}

class TransactionListView extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onDelete;
  final void Function(String) onEdit;
  const TransactionListView(this.transactions, this.onDelete, this.onEdit, {super.key});

  @override
  Widget build(BuildContext context) {
    transactions.sort((tr1, tr2) => tr1.date.compareTo(tr2.date));
    final orderedTransaction = transactions.reversed.toList();
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        final tr = orderedTransaction[index];
        return Card(
          elevation: 5,
          child: ListTile(
            leading: Container(
              height: 60,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: FittedBox(
                  child: Text(
                    "R\$${tr.value.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              tr.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(DateFormat("dd MMM yyyy").format(tr.date)),
            trailing: Container
            (
              width: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      height: 40,
                      width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onPressed: () => onDelete(tr.id),
                    ),
                  ),
                  Container(
                      height: 40,
                      width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () => onEdit(tr.id),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Value extends StatelessWidget {
  final Transaction transaction;
  const _Value({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
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
        child: FittedBox(
          fit: BoxFit.cover,
          child: Text(
            "R\$ ${transaction.value.toStringAsFixed(2)}",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
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
        FittedBox(
          fit: BoxFit.cover,
          child: Text(
            transaction.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Text(
          DateFormat('dd MMM yyyy').format(transaction.date),
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
                height: constraints.maxHeight * 0.15,
              child: Text(
                "Nenhuma transação cadastrada",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: constraints.maxHeight *0.6,
              child: Image.asset(
                'assets\\images\\waiting.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      }
    );
  }
}
