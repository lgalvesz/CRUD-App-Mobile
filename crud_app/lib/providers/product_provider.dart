import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _service = ProductService();
  List<Product> _produtos = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Product> get produtos => _produtos;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  ProductProvider() {
    carregar();
  }

  Future<void> carregar() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _produtos = await _service.encontrar();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
      _produtos = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> salvar(Product produto) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _service.salvar(produto);
      await carregar();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> remover(String id) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _service.remover(id);
      await carregar();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Product? buscarPorId(String id) {
    try {
      return _produtos.firstWhere((produto) => produto.id == id);
    } catch (e) {
      return null;
    }
  }
}