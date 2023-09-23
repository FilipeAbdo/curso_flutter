import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  double _nota = 0.0;
  final _perguntas = const [
    {
      "texto": "Qual é a sua cor favorita?",
      "resposta": [
        {"texto": 'Preto', "nota": 0},
        {"texto": 'Branco', "nota": 0},
        {"texto": 'Azul', "nota": 0},
        {"texto": 'Verde', "nota": 1},
      ],
    },
    {
      "texto": "Qual é a sua linguagem favorita?",
      "resposta": [
        {"texto": 'C/C++', "nota": 10},
        {"texto": 'Java', "nota": 0},
        {"texto": 'JavaScript', "nota": 3},
        {"texto": 'C#', "nota": 4},
        {"texto": 'Dart', "nota": 5},
        {"texto": 'Python', "nota": -15},
      ],
    },
    {
      "texto": "Porque a apple é tão seletiva?",
      "resposta": [
        {"texto": 'Mercenária', "nota": 1000},
        {"texto": 'É Top', "nota": -10000},
      ],
    },
  ];

  bool get temPergunta {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _recomecar() {
    setState(() {
      _nota = 0;
      _perguntaSelecionada = 0;
    });
  }

  void _resposta(double nota) {
    if (temPergunta) {
      setState(() {
        _nota += nota;
        _perguntaSelecionada++;
      });
    }
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
              ? Questionario(
                  pergunta: pergunta,
                  resposta: _resposta,
                )
              : Resultado(
                  nota: _nota,
                  recomecar: _recomecar,
                ))),
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
