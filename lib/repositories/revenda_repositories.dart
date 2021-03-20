import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:desafio_flutter1/models/revenda.dart';

class RevendaRepository {
  Future<List<Revenda>> buscarRevendas() async {
    var jsonFile = await rootBundle.loadString('assets/dados.json');
    var revendas = json.decode(jsonFile) as List;
    return revendas.map((e) => Revenda.fromMap(e)).toList();
  }
}
