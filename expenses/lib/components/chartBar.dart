import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double value;
  final double percentageValue;
  const ChartBar({
    required this.day,
    required this.value,
    required this.percentageValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 20,
            child: FittedBox(
              child: Text(
                value.toStringAsFixed(2),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 60,
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentageValue,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 5,),
          Text(day),
        ],
      ),
    );
  }
}
