const express = require('express');
const router = express.Router();
const https = require('https');
const http = require('http');

// Rota proxy para carregar imagens sem CORS
router.get('/proxy', async (req, res) => {
  const imageUrl = req.query.url;
  
  if (!imageUrl) {
    return res.status(400).json({ error: 'URL da imagem é obrigatória' });
  }

  try {
    const protocol = imageUrl.startsWith('https') ? https : http;
    
    protocol.get(imageUrl, (imageRes) => {
      // Definir headers corretos
      res.setHeader('Content-Type', imageRes.headers['content-type']);
      res.setHeader('Access-Control-Allow-Origin', '*');
      
      // Enviar a imagem
      imageRes.pipe(res);
    }).on('error', (err) => {
      console.error('Erro ao buscar imagem:', err);
      res.status(500).json({ error: 'Erro ao carregar imagem' });
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;