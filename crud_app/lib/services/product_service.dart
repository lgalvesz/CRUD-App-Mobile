import '../models/product_dao_impl.dart';
import '../models/product.dart';
import '../models/exception.dart';

class ProductService {
  final _dao = ProductDAOMySQL();

  Future<void> salvar(Product produto) async {
    validarNome(produto.nome);
    validarDescricao(produto.descricao);
    validarPreco(produto.preco);
    await _dao.salvar(produto);
  }

  Future<List<Product>> remover(dynamic id) async {
    return await _dao.remover(id);
  }

  Future<List<Product>> encontrar() async {
    return await _dao.encontrar();
  }

  void validarNome(String nome) {
    const int min = 3;
    const int max = 100;

    if (nome.isEmpty) {
      throw ExceptionLayer('O nome do produto é obrigatório.');
    } else if (nome.length < min) {
      throw ExceptionLayer('O nome deve possuir pelo menos $min caracteres.');
    } else if (nome.length > max) {
      throw ExceptionLayer('O nome deve possuir no máximo $max caracteres.');
    }
  }

  void validarDescricao(String descricao) {
    const int min = 10;
    const int max = 500;

    if (descricao.isEmpty) {
      throw ExceptionLayer('A descrição é obrigatória.');
    } else if (descricao.length < min) {
      throw ExceptionLayer('A descrição deve possuir pelo menos $min caracteres.');
    } else if (descricao.length > max) {
      throw ExceptionLayer('A descrição deve possuir no máximo $max caracteres.');
    }
  }

  void validarPreco(double preco) {
    if (preco <= 0) {
      throw ExceptionLayer('O preço deve ser maior que zero.');
    } else if (preco > 999999.99) {
      throw ExceptionLayer('Preço muito alto. Máximo: R\$ 999.999,99');
    }
  }
}