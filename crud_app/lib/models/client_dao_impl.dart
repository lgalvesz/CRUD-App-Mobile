import 'dart:convert';
import 'package:http/http.dart' as http;
import 'client.dart';
import 'client_dao.dart';

class ClientDAOMySQL implements ClientDAO {
  static const String baseUrl = 'http://192.168.0.99:3000/clientes';

  @override
  Future<List<Client>> encontrar() async {
    try {
      var uri = Uri.parse(baseUrl);
      var resposta = await http.get(uri);

      if (resposta.statusCode != 200) {
        throw Exception("Erro ao buscar clientes: ${resposta.statusCode}");
      }

      Iterable lista = json.decode(resposta.body);
      return lista.map((item) => Client.fromJson(item)).toList();
    } catch (e) {
      throw Exception("Erro de conexão: $e");
    }
  }

  @override
  Future<List<Client>> remover(id) async {
    try {
      var uri = Uri.parse('$baseUrl/$id');
      var resposta = await http.delete(uri);

      if (resposta.statusCode != 200) {
        throw Exception("Erro ao remover cliente: ${resposta.statusCode}");
      }

      return encontrar();
    } catch (e) {
      throw Exception("Erro ao remover: $e");
    }
  }

  @override
  Future<void> salvar(Client cliente) async {
    try {
      var uri = Uri.parse(baseUrl);
      final jsonText = jsonEncode(Client.toJson(cliente));

      http.Response response;

      if (cliente.id.trim().isEmpty) {
        // POST: Inserir novo cliente
        response = await http.post(
          uri,
          body: jsonText,
          headers: {"Content-Type": "application/json"},
        );
      } else {
        // PUT: Atualizar cliente existente
        response = await http.put(
          uri,
          body: jsonText,
          headers: {"Content-Type": "application/json"},
        );
      }

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception("Erro ao salvar cliente: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Erro ao salvar: $e");
    }
  }
}