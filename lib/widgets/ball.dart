import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  final nome;
  final selecionado;
  const Ball({Key key, this.nome, this.selecionado}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: selecionado ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(100),
            border: !selecionado ? Border.all(color: Colors.grey) : null,
            boxShadow: selecionado
                ? [
                    BoxShadow(
                        blurRadius: 1, spreadRadius: 5, color: Colors.grey[300])
                  ]
                : null,
          ),
        ),
        Text(nome),
      ],
    );
  }
}
