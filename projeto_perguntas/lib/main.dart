
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/quest%C3%A3o.dart';
import 'package:projeto_perguntas/resposta.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp>{
    int _pergutaSelecionada = 0;
    final List<String> perguntas = [
        "Qual é a sua cor favorita?      ",
        "Qual é a sua linguagem favorita?",
        "Porque a apple é tão seletiva?  ",
    ];

    void _resposta(int i){
        print("Resposta $i");
        setState(() {
            if(_pergutaSelecionada < (3 - 1)){
                    _pergutaSelecionada++;
                print("Pergunta selecionada $_pergutaSelecionada");
            }else{
                _pergutaSelecionada = 0;
                print("Pergunta selecionada $_pergutaSelecionada");
            }
        });
    }

    @override
    Widget build(BuildContext context){
        
        log("Hi");
        return MaterialApp(
            home: Scaffold(
                appBar: AppBar(
                    title: const Text("Hello World"),
                ),
                body: Column(
                    children: <Widget>[
                        Questao(perguntas[_pergutaSelecionada]),
                        Resposta("Resposta 1", () => _resposta(1)),
                        Resposta("Resposta 2", () => _resposta(2)),
                        Resposta("Resposta 3", () => _resposta(3)),
                    ],
                ),
            ),
        );
    }

}

class PerguntaApp extends StatefulWidget{
    const PerguntaApp({super.key});
    
    @override
    // ignore: library_private_types_in_public_api
    _PerguntaAppState createState(){
        return _PerguntaAppState();
    }
}