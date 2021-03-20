import 'package:desafio_flutter1/models/revenda.dart';
import 'package:desafio_flutter1/repositories/revenda_repositories.dart';
import 'package:desafio_flutter1/widgets/revenda_tile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final appBar = AppBar(
    elevation: 0,
    title: Text('Escolha uma Revenda'),
    actions: [
      PopupMenuButton(
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: Row(
                children: [
                  Radio(value: 1, groupValue: 00, onChanged: (val) {}),
                  Text('Melhor Avaliação'),
                ],
              ),
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Radio(value: 2, groupValue: 2, onChanged: (val) {}),
                  Text('Mais Rápido'),
                ],
              ),
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Radio(value: 3, groupValue: 0, onChanged: (val) {}),
                  Text('Mais Barato'),
                ],
              ),
            ),
          ];
        },
        icon: Icon(Icons.unfold_more_sharp),
      ),
      PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem(child: Text('Suporte')),
              PopupMenuItem(child: Text('Termos de Serviço')),
            ];
          },
          icon: Icon(Icons.help_outline_sharp)),
    ],
  );
  List<Revenda> revendedores;
  @override
  Widget build(BuildContext context) {
    var heightTela = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: Container(
        color: Colors.grey[300],
        width: MediaQuery.of(context).size.width,
        height: heightTela,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Botijões de 13Kg em:',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            'Av Paulista, 1001',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Paulista, São Paulo, SP',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            'Mudar',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Revenda>>(
                future: RevendaRepository().buscarRevendas(),
                builder: (_, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Container();
                      break;
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;
                    case ConnectionState.active:
                    case ConnectionState.done:
                      var data = snapshot.data;
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (_, index) {
                          return RevendaTile(
                            revenda: data[index],
                          );
                        },
                      );
                      break;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
