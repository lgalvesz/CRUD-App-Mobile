# Backend Mobile II - API REST

API REST desenvolvida com Node.js, Express e MySQL para gerenciamento de Clientes e Produtos.

## 📋 Pré-requisitos

- Node.js (v14 ou superior)
- MySQL Server
- XAMPP, WAMP ou MySQL standalone

## 🚀 Instalação e Configuração

### 1. Clone o repositório
```bash
git clone <seu-repositorio>
cd backend-mobile-ii
```

### 2. Instale as dependências
```bash
npm install
```

### 3. Configure o banco de dados

#### 3.1 Inicie o MySQL
- Se usar XAMPP: Abra o painel e inicie Apache e MySQL
- Acesse: http://localhost/phpmyadmin

#### 3.2 Crie o banco de dados
- No phpMyAdmin, clique em "SQL"
- Execute o conteúdo do arquivo `models/dbCreation.sql`
- Isso criará o banco `backend-mobile-ii` e as tabelas `clientes` e `produtos`

#### 3.3 Insira os dados iniciais
- Na aba SQL, execute o conteúdo do arquivo `models/dbInserts.sql`
- Isso populará as tabelas com dados de teste

### 4. Configure as variáveis de ambiente

Crie um arquivo `.env` na raiz do projeto com o seguinte conteúdo:

```env
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASS=
MYSQL_DB=backend-mobile-ii
MYSQL_PORT=3306
PORT=3000
```

**Importante**: Ajuste `MYSQL_USER` e `MYSQL_PASS` conforme suas credenciais do MySQL.

### 5. Inicie o servidor
```bash
npm start
```

Ou para desenvolvimento com auto-reload:
```bash
npm run dev
```

O servidor estará rodando em: **http://localhost:3000**

## 📡 Endpoints da API

### Clientes

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| GET | `/clientes` | Lista todos os clientes |
| GET | `/clientes/:id` | Busca cliente por ID |
| POST | `/clientes` | Cria novo cliente |
| PUT | `/clientes` | Atualiza cliente existente |
| DELETE | `/clientes/:id` | Remove cliente |

### Produtos

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| GET | `/produtos` | Lista todos os produtos |
| GET | `/produtos/:id` | Busca produto por ID |
| POST | `/produtos` | Cria novo produto |
| PUT | `/produtos` | Atualiza produto existente |
| DELETE | `/produtos/:id` | Remove produto |

## 📦 Estrutura do Projeto

```
backend-mobile-ii/
├── config/
│   └── database.js          # Configuração do MySQL
├── models/
│   ├── dbCreation.sql       # Script de criação das tabelas
│   └── dbInserts.sql        # Script de dados iniciais
├── routes/
│   ├── clientRoutes.js      # Rotas de clientes
│   └── productRoutes.js     # Rotas de produtos
├── services/
│   ├── clientService.js     # Lógica de negócio - clientes
│   └── productService.js    # Lógica de negócio - produtos
├── .env                     # Variáveis de ambiente (não commitar)
├── server.js                # Arquivo principal
└── package.json             # Dependências
```

## 🧪 Testando a API

Você pode testar os endpoints usando:
- **Postman**: Importe as requisições
- **Insomnia**: Crie as requisições manualmente
- **cURL**: Pelo terminal

Exemplo de teste com cURL:
```bash
# Listar todos os clientes
curl http://localhost:3000/clientes

# Criar um novo cliente
curl -X POST http://localhost:3000/clientes \
  -H "Content-Type: application/json" \
  -d '{"nome":"Teste","sobrenome":"Usuario","email":"teste@email.com","idade":25,"foto":"https://i.pravatar.cc/150"}'
```