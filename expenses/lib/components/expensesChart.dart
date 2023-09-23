import 'package:flutter/material.dart';

class ExpensesChart extends StatelessWidget {
  const ExpensesChart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
            // color: Colors.purple,
            elevation: 5,
            child: Text(
              "Gráfico",
              style: TextStyle(
                fontSize: 18,
                // color: Colors.white,
              ),
            ),
          );
  }
}