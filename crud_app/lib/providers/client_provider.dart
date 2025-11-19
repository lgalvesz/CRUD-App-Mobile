import 'package:flutter/material.dart';
import '../models/client.dart';
import '../services/client_service.dart';

class ClientProvider with ChangeNotifier {
  final ClientService _service = ClientService();
  List<Client> _clientes = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Client> get clientes => _clientes;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  ClientProvider() {
    carregar();
  }

  Future<void> carregar() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _clientes = await _service.encontrar();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
      _clientes = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> salvar(Client cliente) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _service.salvar(cliente);
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

  Client? buscarPorId(String id) {
    try {
      return _clientes.firstWhere((cliente) => cliente.id == id);
    } catch (e) {
      return null;
    }
  }
}