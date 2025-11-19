import 'client.dart';

abstract class ClientDAO {
  Future<void> salvar(Client cliente);
  Future<List<Client>> encontrar();
  Future<List<Client>> remover(dynamic id);
}