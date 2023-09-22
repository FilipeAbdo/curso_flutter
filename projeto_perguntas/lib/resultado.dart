import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Resultado extends StatelessWidget {
  final double _nota;
  final void Function(int) _resposta;
  const Resultado(this._nota, this._resposta, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (_nota < 0)
            ? const Questao("Muito Triste!!!")
            : const Questao("Parabéns!!! Você compartilha da minha revolta!!!"),
        Questao("Sua nota é: $_nota"),
        Resposta("Recomeçar?", () => _resposta(-1))
      ],
    );
  }
}
