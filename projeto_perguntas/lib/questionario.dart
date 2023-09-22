import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final Map<String, Object> _pergunta;
  final void Function(int) _resposta;
  const Questionario(this._pergunta, this._resposta, {super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> respostas = (_pergunta["resposta"] as List<String>);
    return Column(
      children: [
        Questao(_pergunta["texto"].toString()),
        ...respostas
            .map((t) => Resposta(t, () => _resposta(respostas.indexOf(t))))
            .toList()
      ],
    );
  }
}
