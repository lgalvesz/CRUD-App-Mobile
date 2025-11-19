require('dotenv').config();
const express = require('express');
const cors = require('cors');
const clientRoutes = require('./routes/clientRoutes');
const productRoutes = require('./routes/productRoutes');

const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares
app.use(cors());
app.use(express.json());

// Rotas
app.use('/clientes', clientRoutes);
app.use('/produtos', productRoutes);

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