require('dotenv').config();
const express = require('express');
const cors = require('cors');
const clientRoutes = require('./routes/clientRoutes');
const productRoutes = require('./routes/productRoutes');
const imageProxy = require('./routes/imageProxy');

const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares - Configuração CORS para permitir imagens
app.use(cors({
  origin: '*', // Permite todas as origens (para desenvolvimento)
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  credentials: true
}));
app.use(express.json());

// Rotas
app.use('/clientes', clientRoutes);
app.use('/produtos', productRoutes);
app.use('/image', imageProxy);

// Rota raiz
app.get('/', (req, res) => {
  res.json({ 
    message: 'API Backend Mobile II - Funcionando!',
    endpoints: {
      clientes: '/clientes',
      produtos: '/produtos'
    }
  });
});

// Inicializar servidor
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
  console.log(`Acesse: http://localhost:${PORT}`);
});