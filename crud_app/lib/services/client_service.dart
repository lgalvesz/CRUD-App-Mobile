import '../models/client_dao_impl.dart';
import '../models/client.dart';
import '../models/exception.dart';

class ClientService {
  final _dao = ClientDAOMySQL();

  Future<void> salvar(Client cliente) async {
    validacaoNomeSobrenome(cliente.nome);
    validacaoNomeSobrenome(cliente.sobrenome);
    validateEmail(cliente.email);
    validarIdade(cliente.idade);
    validarFoto(cliente.foto);
    await _dao.salvar(cliente);
  }

  Future<List<Client>> remover(dynamic id) async {
    return await _dao.remover(id);
  }

  Future<List<Client>> encontrar() async {
    return await _dao.encontrar();
  }

  void validacaoNomeSobrenome(String name) {
    const int min = 3;
    const int max = 50;

    if (name.isEmpty) {
      throw ExceptionLayer('O nome é obrigatório.');
    } else if (name.length < min) {
      throw ExceptionLayer('O nome deve possuir pelo menos $min caracteres.');
    } else if (name.length > max) {
      throw ExceptionLayer('O nome deve possuir no máximo $max caracteres.');
    }
  }

  void validateEmail(String email) {
    if (email.isEmpty) {
      throw ExceptionLayer('O e-mail é obrigatório.');
    } else if (!email.contains('@')) {
      throw ExceptionLayer('O e-mail deve possuir @.');
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      throw ExceptionLayer('E-mail inválido.');
    }
  }

  void validarIdade(int idade) {
    if (idade < 1) {
      throw ExceptionLayer('A idade deve ser maior que 0.');
    } else if (idade > 150) {
      throw ExceptionLayer('Idade inválida.');
    }
  }

  void validarFoto(String foto) {
    if (foto.isEmpty) {
      throw ExceptionLayer('A URL da foto é obrigatória.');
    } else if (!foto.startsWith('http')) {
      throw ExceptionLayer('A URL da foto deve começar com http ou https.');
    }
  }
}