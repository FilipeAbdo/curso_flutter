import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;
  final void Function(Transaction?) onEdit;
  final Transaction? transaction;
  const TransactionForm(this.onSubmit, this.onEdit,
      {super.key, required this.transaction});

  @override
  State<TransactionForm> createState() => _TransactionFormState(transaction);
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final dateController = TextEditingController();
  Transaction? transaction;
  DateTime? pickedDate = DateTime.now();

  _TransactionFormState(this.transaction) {
    if (transaction != null) {
      titleController.text = (transaction == null ? "" : transaction?.title)!;
      valueController.text =
          (transaction == null ? "" : transaction?.value.toString())!;
      dateController.text = transaction == null
          ? ""
          : DateFormat("dd MMM yyyy").format(DateTime.now());
      pickedDate = transaction?.date;
    } else {
      dateController.text =
          DateFormat("dd MMM yyyy").format(pickedDate ?? DateTime.now());
    }
  }

  void _onSubmited() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || pickedDate == null) {
      return;
    }

    if (transaction == null) {
      widget.onSubmit(title, value, pickedDate ?? DateTime.now());
    } else {
      transaction?.title = title;
      transaction?.value = value;
      transaction?.date = pickedDate ?? DateTime.now();
      widget.onEdit(transaction);
    }

    titleController.text = "";
    valueController.text = "";
    dateController.text = "";
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: pickedDate ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      dateController.text = DateFormat("dd MMM yyyy").format(value);
      pickedDate = value;
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom
          ),
          child: Column(
            children: [
              TextField(
                //   cursorColor: Colors.purple,
                controller: titleController,
                onSubmitted: (_) => _onSubmited(),
                decoration: const InputDecoration(
                  labelText: "Titulo",
                  // labelStyle: TextStyle(color: Colors.purple),
                  // focusedBorder: UnderlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.purpleAccent)),
                ),
              ),
              TextField(
                controller: valueController,
                onSubmitted: (_) => _onSubmited(),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                //   cursorColor: Colors.purple,
                decoration: const InputDecoration(
                  labelText: "Valor R\$",
                  // labelStyle: TextStyle(color: Colors.purple),
                  // focusedBorder: UnderlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.purpleAccent)),
                ),
              ),
              TextField(
                controller: dateController,
                onSubmitted: (_) => _onSubmited(),
                onTap: () => _showDatePicker(),
                decoration: const InputDecoration(label: Text("Date")),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(top: 8),
                child: ElevatedButton(
                  onPressed: _onSubmited,
                  child: const Text(
                    "Confirmar",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
