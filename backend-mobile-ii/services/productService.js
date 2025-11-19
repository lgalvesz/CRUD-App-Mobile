const connection = require('../config/database');

class ProductService {
  // Buscar todos os produtos
  async findAll() {
    const [rows] = await connection.execute(
      'SELECT * FROM produtos ORDER BY id DESC'
    );
    return rows;
  }

  // Buscar produto por ID
  async findById(id) {
    const [rows] = await connection.execute(
      'SELECT * FROM produtos WHERE id = ?',
      [id]
    );
    return rows[0];
  }

  // Criar novo produto
  async create(produto) {
    const { nome, descricao, preco } = produto;
    const [result] = await connection.execute(
      'INSERT INTO produtos (nome, descricao, preco, data_atualizado) VALUES (?, ?, ?, NOW())',
      [nome, descricao, preco]
    );
    return { id: result.insertId, ...produto, data_atualizado: new Date() };
  }

  // Atualizar produto
  async update(produto) {
    const { id, nome, descricao, preco } = produto;
    await connection.execute(
      'UPDATE produtos SET nome = ?, descricao = ?, preco = ?, data_atualizado = NOW() WHERE id = ?',
      [nome, descricao, preco, id]
    );
    return { ...produto, data_atualizado: new Date() };
  }

  // Deletar produto
  async delete(id) {
    await connection.execute(
      'DELETE FROM produtos WHERE id = ?',
      [id]
    );
    return { message: 'Produto deletado com sucesso' };
  }
}

module.exports = new ProductService();