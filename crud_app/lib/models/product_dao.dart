import 'product.dart';

abstract class ProductDAO {
  Future<void> salvar(Product produto);
  Future<List<Product>> encontrar();
  Future<List<Product>> remover(dynamic id);
}