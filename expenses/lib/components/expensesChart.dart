import 'package:expenses/components/chartBar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensesChart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const ExpensesChart(this.recentTransactions, {super.key});

    double get _totalExpenses{
        return recentTransactions.fold(
          0.0, (previousValue, tr) => (previousValue + tr.value));
    }

  List<ChartBar> get _chartBars {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double dayTotal = 0;
      
      for (int i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMonth = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;

        if (sameDay == true && sameMonth == true && sameYear == true) {
          dayTotal += recentTransactions[i].value;
        }
      }
      
      return ChartBar(
        day: "${weekDay.day} ${DateFormat.E().format(weekDay)[0]}",
        value: dayTotal,
        percentageValue: ((_totalExpenses != 0)? dayTotal / _totalExpenses: 0) ,
      );
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.purple,
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ..._chartBars,
          ],
        ),
      ),
    );
  }
}
