import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product.dart';
import 'product_dao.dart';

class ProductDAOMySQL implements ProductDAO {
  static const String baseUrl = 'http://localhost:3000/produtos';

  @override
  Future<List<Product>> encontrar() async {
    try {
      var uri = Uri.parse(baseUrl);
      var resposta = await http.get(uri);

      if (resposta.statusCode != 200) {
        throw Exception("Erro ao buscar produtos: ${resposta.statusCode}");
      }

      Iterable lista = json.decode(resposta.body);
      return lista.map((item) => Product.fromJson(item)).toList();
    } catch (e) {
      throw Exception("Erro de conexão: $e");
    }
  }

  @override
  Future<List<Product>> remover(id) async {
    try {
      var uri = Uri.parse('$baseUrl/$id');
      var resposta = await http.delete(uri);

      if (resposta.statusCode != 200) {
        throw Exception("Erro ao remover produto: ${resposta.statusCode}");
      }

      return encontrar();
    } catch (e) {
      throw Exception("Erro ao remover: $e");
    }
  }

  @override
  Future<void> salvar(Product produto) async {
    try {
      var uri = Uri.parse(baseUrl);
      final jsonText = jsonEncode(Product.toJson(produto));

      http.Response response;

      if (produto.id.trim().isEmpty) {
        // POST: Inserir novo produto
        response = await http.post(
          uri,
          body: jsonText,
          headers: {"Content-Type": "application/json"},
        );
      } else {
        // PUT: Atualizar produto existente
        response = await http.put(
          uri,
          body: jsonText,
          headers: {"Content-Type": "application/json"},
        );
      }

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception("Erro ao salvar produto: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Erro ao salvar: $e");
    }
  }
}