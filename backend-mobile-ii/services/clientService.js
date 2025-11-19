const connection = require('../config/database');

class ClientService {
  // Buscar todos os clientes
  async findAll() {
    const [rows] = await connection.execute(
      'SELECT * FROM clientes ORDER BY id DESC'
    );
    return rows;
  }

  // Buscar cliente por ID
  async findById(id) {
    const [rows] = await connection.execute(
      'SELECT * FROM clientes WHERE id = ?',
      [id]
    );
    return rows[0];
  }

  // Criar novo cliente
  async create(cliente) {
    const { nome, sobrenome, email, idade, foto } = cliente;
    const [result] = await connection.execute(
      'INSERT INTO clientes (nome, sobrenome, email, idade, foto) VALUES (?, ?, ?, ?, ?)',
      [nome, sobrenome, email, idade, foto]
    );
    return { id: result.insertId, ...cliente };
  }

  // Atualizar cliente
  async update(cliente) {
    const { id, nome, sobrenome, email, idade, foto } = cliente;
    await connection.execute(
      'UPDATE clientes SET nome = ?, sobrenome = ?, email = ?, idade = ?, foto = ? WHERE id = ?',
      [nome, sobrenome, email, idade, foto, id]
    );
    return cliente;
  }

  // Deletar cliente
  async delete(id) {
    await connection.execute(
      'DELETE FROM clientes WHERE id = ?',
      [id]
    );
    return { message: 'Cliente deletado com sucesso' };
  }
}

module.exports = new ClientService();