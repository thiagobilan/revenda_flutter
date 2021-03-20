import 'package:desafio_flutter1/widgets/linha_status.dart';
import 'package:desafio_flutter1/widgets/tile_valor.dart';
import 'package:flutter/material.dart';

class RevendaPage extends StatefulWidget {
  final revenda;

  const RevendaPage({Key key, this.revenda}) : super(key: key);

  @override
  _RevendaPageState createState() => _RevendaPageState();
}

class _RevendaPageState extends State<RevendaPage> {
  var cont = 1;
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Selecionar Produtos'),
      actions: [
        IconButton(icon: Icon(Icons.help_outline_sharp), onPressed: () {})
      ],
    );
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          LinhaStatus(),
          Divider(
            height: 2,
          ),
          ValorTile(
            valor: (widget.revenda.preco * cont).toStringAsFixed(2),
          ),
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.home,
                      size: 40,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.revenda.nome),
                        Row(
                          children: [
                            Text('4.5'),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.star,
                              size: 10,
                              color: Colors.orange,
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            Text('${widget.revenda.tempoMedio} min'),
                            SizedBox(
                              width: 50,
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      color: Color(int.parse('0xff${widget.revenda.cor}')),
                      child: Text(
                        widget.revenda.tipo,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('Botijjão de 13Kg'),
                        Text(widget.revenda.nome),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'R\$',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              widget.revenda.preco.toStringAsFixed(2),
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.remove),
                        onPressed: cont == 1
                            ? null
                            : () {
                                setState(
                                  () {
                                    cont--;
                                  },
                                );
                              },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.orange),
                      child: Text(
                        cont.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(500)),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(
                            () {
                              cont++;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.blue[50], Colors.blue]),
              ),
              child: Text(
                'IR PARA PAGAMENTO',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
