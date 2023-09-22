import 'package:flutter/material.dart';

ButtonStyle getButtonStyle(){
    return const ButtonStyle(
            padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.all(5)),
            minimumSize:
                MaterialStatePropertyAll<Size>(Size(double.infinity, 0)),
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.black38),
            foregroundColor: MaterialStatePropertyAll<Color>(Colors.amber),
            shadowColor: MaterialStatePropertyAll<Color>(
                Color.fromRGBO(243, 229, 245, 1)),
            alignment: Alignment.center,
          );
}