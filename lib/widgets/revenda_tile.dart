import 'package:flutter/material.dart';

import 'package:desafio_flutter1/models/revenda.dart';
import 'package:desafio_flutter1/widgets/melhor_preco.dart';

class RevendaTile extends StatelessWidget {
  final revenda;
  const RevendaTile({
    Key key,
    this.revenda,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/revenda', arguments: revenda);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
        ),
        child: Row(
          children: [
            Container(
              height: 125,
              width: 38,
              decoration: BoxDecoration(
                color: Color(int.parse('0xff${revenda.cor}')),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    revenda.tipo,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                height: 125,
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            revenda.nome,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Visibility(
                          visible: revenda.melhorPreco,
                          child: MelhorPreco(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nota',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  revenda.nota.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tempo Médio',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  revenda.tempoMedio,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'min',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Preço',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'R\$ ${revenda.preco.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
