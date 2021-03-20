import 'package:flutter/material.dart';

class ValorTile extends StatelessWidget {
  final valor;

  const ValorTile({Key key, this.valor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.all(10),
            child: Center(
              child: Text(
                '1',
                style: TextStyle(fontSize: 20),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text('Unigas - Botijão de 13Kg'),
          ),
          Text(
            'R\$',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            valor,
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
