import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  double _nota = 0.0;
  final _perguntas = const [
    {
      "texto": "Qual é a sua cor favorita?",
      "resposta": ['Preto', 'Branco', 'Azul', 'Verde'],
      "pontuação": [0.0, 0.0, 0.0, 1.0]
    },
    {
      "texto": "Qual é a sua linguagem favorita?",
      "resposta": ['C/C++', 'Java', 'JavaScript', 'C#', 'Dart', 'Python'],
      "pontuação": [10, 0, 3.0, 4.0, 0.5, -15]
    },
    {
      "texto": "Porque a apple é tão seletiva?",
      "resposta": ['Mercenária', 'É Top'],
      "pontuação": [1000, -10000]
    },
  ];

  bool get temPergunta {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _resposta(int i) {
    log("Resposta $i");
    setState(() {
      if (i >= 0) {
        _nota +=
            ((_perguntas[_perguntaSelecionada]["pontuação"] as List<num>)[i]
                .toDouble());
        _perguntaSelecionada++;
      } else {
        _nota = 0;
        _perguntaSelecionada = 0;
      }
    });
    log("Pergunta selecionada $_perguntaSelecionada");
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> pergunta =
        temPergunta ? _perguntas[_perguntaSelecionada] : {};

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Quiz da revolta"),
          ),
          body: (temPergunta
              ? Questionario(pergunta, _resposta)
              : Resultado(_nota, _resposta))),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
