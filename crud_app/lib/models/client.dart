class Client {
  final String id;
  final String nome;
  final String sobrenome;
  final String email;
  final int idade;
  final String foto;

  Client({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.email,
    required this.idade,
    required this.foto,
  });

  // Converter de JSON para Client
  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'].toString(),
      nome: json['nome'] ?? '',
      sobrenome: json['sobrenome'] ?? '',
      email: json['email'] ?? '',
      idade: json['idade'] ?? 0,
      foto: json['foto'] ?? '',
    );
  }

  // Converter de Client para JSON
  static Map<String, dynamic> toJson(Client cliente) {
    return {
      'id': cliente.id.isEmpty ? null : int.parse(cliente.id),
      'nome': cliente.nome,
      'sobrenome': cliente.sobrenome,
      'email': cliente.email,
      'idade': cliente.idade,
      'foto': cliente.foto,
    };
  }

  // Nome completo
  String get nomeCompleto => '$nome $sobrenome';
}