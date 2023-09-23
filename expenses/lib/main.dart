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
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
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
            color: Colors.purple,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 25),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.purple,
          iconSize: 35,
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.purple,
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
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _transactions = [
    Transaction(
      id: "t7",
      title: "Macbook Air",
      value: 15000.00,
      date: DateTime(2023, 09, 23, 13, 29),
    ),
    Transaction(
      id: "t1",
      title: "Transação 1",
      value: 234.12,
      date: DateTime(2023, 09, 23, 13, 29),
    ),
    Transaction(
      id: "t2",
      title: "Transação 2",
      value: 234.12,
      date: DateTime(2023, 09, 23, 13, 29),
    ),
    Transaction(
      id: "t3",
      title: "Transação 3",
      value: 234.12,
      date: DateTime(2023, 09, 23, 13, 29),
    ),
    Transaction(
      id: "t4",
      title: "Transação 4",
      value: 234.12,
      date: DateTime(2023, 09, 23, 13, 29),
    ),
    Transaction(
      id: "t5",
      title: "Transação 5",
      value: 234.12,
      date: DateTime(2023, 09, 23, 13, 29),
    ),
    Transaction(
      id: "t6",
      title: "Transação 6",
      value: 234.12,
      date: DateTime(2023, 09, 23, 13, 29),
    ),
  ];

  _addTransaction(String title, double value) {
    print("$title:${value.toStringAsFixed(2)}");
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    for (Transaction transaction in _transactions) {
      if (transaction.id.compareTo(id) == 0) {
        setState(() {
          _transactions.remove(transaction);
        });
      }
    }
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
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
            const ExpensesChart(),
            TransactionList(
              transactions: _transactions,
              onRemove: _removeTransaction,
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
