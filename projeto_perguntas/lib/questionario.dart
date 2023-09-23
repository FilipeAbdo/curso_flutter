import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final dynamic pergunta;
  final void Function(double) resposta;
  const Questionario({
    required this.pergunta,
    required this.resposta,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questao(pergunta["texto"].toString()),
        ...pergunta["resposta"].map((resp) {
          return Resposta(
            resp["texto"] as String,
            () => resposta((resp["nota"] as num).toDouble()),
          );
        }).toList()
      ],
    );
  }
}
