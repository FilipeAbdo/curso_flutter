import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;
  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  void _onSubmited() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
    titleController.text = "";
    valueController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
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
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 8),
              child: TextButton(
                onPressed: _onSubmited,
                child: const Text(
                  "Nova Transação",
                //   style: TextStyle(fontSize: 16, color: Colors.purple),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
