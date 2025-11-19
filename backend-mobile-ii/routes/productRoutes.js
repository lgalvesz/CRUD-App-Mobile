const express = require('express');
const router = express.Router();
const productService = require('../services/productService');

// GET /produtos - Buscar todos
router.get('/', async (req, res) => {
  try {
    const produtos = await productService.findAll();
    res.json(produtos);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// GET /produtos/:id - Buscar por ID
router.get('/:id', async (req, res) => {
  try {
    const produto = await productService.findById(req.params.id);
    if (!produto) {
      return res.status(404).json({ error: 'Produto não encontrado' });
    }
    res.json(produto);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// POST /produtos - Criar novo
router.post('/', async (req, res) => {
  try {
    const produto = await productService.create(req.body);
    res.status(201).json(produto);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// PUT /produtos - Atualizar
router.put('/', async (req, res) => {
  try {
    const produto = await productService.update(req.body);
    res.json(produto);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// DELETE /produtos/:id - Deletar
router.delete('/:id', async (req, res) => {
  try {
    await productService.delete(req.params.id);
    res.json({ message: 'Produto deletado com sucesso' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;