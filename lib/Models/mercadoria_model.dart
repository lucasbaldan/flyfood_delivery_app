class Mercadoria {
  String id;
  String nome;
  double altura;
  double largura;
  double peso;

  Mercadoria(
      {required this.id,
      required this.nome,
      required this.altura,
      required this.largura,
      required this.peso});

  toObj(Map<String, dynamic> mercadoriaMap) {
    return Mercadoria(
        id: mercadoriaMap['id'],
        nome: mercadoriaMap['nome'],
        altura: mercadoriaMap['altura'],
        largura: mercadoriaMap['largura'],
        peso: mercadoriaMap['peso']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'altura': altura,
      'largura': largura,
      'peso': peso
    };
  }
}
