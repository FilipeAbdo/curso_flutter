import 'package:flutter/material.dart';
import 'package:projeto_perguntas/styles.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() resposta;
  const Resposta(this.texto, this.resposta, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: ElevatedButton(
          onPressed: resposta,
          style: getButtonStyle() ,
          child: Text(
            texto,
            style: const TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          )),
    );
  }
}