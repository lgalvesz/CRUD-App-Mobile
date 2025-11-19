const express = require('express');
const router = express.Router();
const clientService = require('../services/clientService');

// GET /clientes - Buscar todos
router.get('/', async (req, res) => {
  try {
    const clientes = await clientService.findAll();
    res.json(clientes);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// GET /clientes/:id - Buscar por ID
router.get('/:id', async (req, res) => {
  try {
    const cliente = await clientService.findById(req.params.id);
    if (!cliente) {
      return res.status(404).json({ error: 'Cliente não encontrado' });
    }
    res.json(cliente);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// POST /clientes - Criar novo
router.post('/', async (req, res) => {
  try {
    const cliente = await clientService.create(req.body);
    res.status(201).json(cliente);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// PUT /clientes - Atualizar
router.put('/', async (req, res) => {
  try {
    const cliente = await clientService.update(req.body);
    res.json(cliente);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// DELETE /clientes/:id - Deletar
router.delete('/:id', async (req, res) => {
  try {
    await clientService.delete(req.params.id);
    res.json({ message: 'Cliente deletado com sucesso' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;