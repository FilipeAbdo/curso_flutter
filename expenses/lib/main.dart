import 'dart:math';

import 'package:expenses/components/transactionsList.dart';
import 'package:expenses/components/transactoinForm.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

import 'package:expenses/components/expensesChart.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});
  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.purple;
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        colorSchemeSeed: primaryColor,
        fontFamily: 'Quicksand',
        textTheme: const TextTheme(
            titleLarge: TextStyle(
              // fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            titleSmall: TextStyle(
              // fontFamily: 'OpenSans',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            labelLarge: TextStyle(
              // fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            labelMedium: TextStyle(
              // fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
            labelSmall: TextStyle(
              fontSize: 16,
            )),
        iconTheme: const IconThemeData(color: Colors.white, size: 25),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
          iconSize: 35,
        ),
        appBarTheme: const AppBarTheme(
          color: primaryColor,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'Quicksand',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            size: 30,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: "t0",
      title: "Macbook Air",
      value: 15000.00,
      date: DateTime(2023, 09, 19, 13, 29),
    ),
    Transaction(
      id: "t1",
      title: "Transação 1",
      value: 34.12,
      date: DateTime(2023, 09, 05, 13, 29),
    ),
    Transaction(
      id: "t2",
      title: "Transação 2",
      value: 234.12,
      date: DateTime(2023, 09, 21, 13, 29),
    ),
    Transaction(
      id: "t3",
      title: "Transação 3",
      value: 134.12,
      date: DateTime(2023, 09, 21, 13, 29),
    ),
    Transaction(
      id: "t4",
      title: "Transação 4",
      value: 234.12,
      date: DateTime(2023, 09, 22, 13, 29),
    ),
    Transaction(
      id: "t5",
      title: "Transação 5",
      value: 334.12,
      date: DateTime(2023, 09, 23, 13, 29),
    ),
    Transaction(
      id: "t6",
      title: "Transação 6",
      value: 234.12,
      date: DateTime(2023, 09, 24, 13, 29),
    ),
    Transaction(
      id: "t7",
      title: "Transação 7 asdjkhasjkdhajklsdh",
      value: 2437129837109378.12,
      date: DateTime(2023, 09, 20, 13, 29),
    ),
  ];

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  _editTansaction(String id) {
    final Transaction? tr =
        _transactions.where((element) => element.id == id).firstOrNull;

    if (tr != null) {
      _openTransactionFormModal(context, tr);
    }
  }

  _updateTransaction(Transaction? transaction) {
    final Transaction? tr = _transactions
        .where((element) => element.id == transaction?.id)
        .firstOrNull;

    if (tr != null) {
      setState(() {
        tr.title = transaction == null ? "" : transaction.title;
        tr.value = transaction == null ? 0.0 : transaction.value;
        tr.date = transaction == null ? DateTime.now() : transaction.date;
      });
    }
    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context, [Transaction? transaction]) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction, _updateTransaction,
            transaction: transaction);
      },
    );
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return (tr.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7))));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pesoais"),
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: const Icon(Icons.add)),
        ],
        // backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ExpensesChart(_recentTransactions),
            TransactionList(
              transactions: _transactions,
              onRemove: _removeTransaction,
              onEdit: _editTansaction,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        // backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
