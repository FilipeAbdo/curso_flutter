import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';

class Resultado extends StatelessWidget {
  final double nota;
  final void Function() recomecar;
  const Resultado({
    required this.nota,
    required this.recomecar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (nota < 0)
            ? const Questao("Muito Triste!!!")
            : const Questao("Parabéns!!! Você compartilha da minha revolta!!!"),
        Text(
          "Sua nota é: $nota",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: recomecar,
          child: const Text.rich(
            TextSpan(
                text: "Recomeçar",
                style: TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.double,
                  decorationColor: Color.fromRGBO(173, 39, 39, 1),
                ),
                children: [
                  TextSpan(
                      text: "?",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                      ))
                ]),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
