const mysql = require('mysql2/promise');

const connection = mysql.createPool({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASS,
  database: process.env.MYSQL_DB,
  port: process.env.MYSQL_PORT,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// Testar conexão
connection.getConnection()
  .then(conn => {
    console.log('✓ Conectado ao MySQL com sucesso!');
    conn.release();
  })
  .catch(err => {
    console.error('✗ Erro ao conectar ao MySQL:', err.message);
  });

module.exports = connection;