class Product {
  final String id;
  final String nome;
  final String descricao;
  final double preco;
  final DateTime dataAtualizado;

  Product({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.dataAtualizado,
  });

  // Converter de JSON para Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      nome: json['nome'] ?? '',
      descricao: json['descricao'] ?? '',
      preco: double.tryParse(json['preco'].toString()) ?? 0.0,
      dataAtualizado: json['data_atualizado'] != null
          ? DateTime.parse(json['data_atualizado'])
          : DateTime.now(),
    );
  }

  // Converter de Product para JSON
  static Map<String, dynamic> toJson(Product produto) {
    return {
      'id': produto.id.isEmpty ? null : int.parse(produto.id),
      'nome': produto.nome,
      'descricao': produto.descricao,
      'preco': produto.preco,
    };
  }

  // Preço formatado
  String get precoFormatado {
    return 'R\$ ${preco.toStringAsFixed(2).replaceAll('.', ',')}';
  }
}