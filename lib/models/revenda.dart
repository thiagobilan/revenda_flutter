import 'dart:convert';

class Revenda {
  String tipo;
  String nome;
  String cor;
  double nota;
  String tempoMedio;
  bool melhorPreco;
  double preco;
  Revenda({
    this.tipo,
    this.nome,
    this.cor,
    this.nota,
    this.tempoMedio,
    this.melhorPreco,
    this.preco,
  });

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'nome': nome,
      'cor': cor,
      'nota': nota,
      'tempoMedio': tempoMedio,
      'melhorPreco': melhorPreco,
      'preco': preco,
    };
  }

  factory Revenda.fromMap(Map<String, dynamic> map) {
    return Revenda(
      tipo: map['tipo'],
      nome: map['nome'],
      cor: map['cor'],
      nota: map['nota'],
      tempoMedio: map['tempoMedio'],
      melhorPreco: map['melhorPreco'],
      preco: map['preco'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Revenda.fromJson(String source) =>
      Revenda.fromMap(json.decode(source));
}
