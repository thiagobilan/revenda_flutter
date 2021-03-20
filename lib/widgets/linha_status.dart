import 'package:desafio_flutter1/widgets/ball.dart';
import 'package:flutter/material.dart';

class LinhaStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 25,
          ),
          Ball(
            nome: 'Comprar',
            selecionado: true,
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 13,
                ),
                Divider(
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Ball(
            nome: 'Pagamentos',
            selecionado: false,
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 13,
                ),
                Divider(
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Ball(
            nome: 'Confirmação',
            selecionado: false,
          ),
          SizedBox(
            width: 25,
          ),
        ],
      ),
    );
  }
}
