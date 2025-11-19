# 📋 Resumo Executivo - CRUD App Mobile

## 🎯 Visão Geral do Projeto

Aplicação mobile completa desenvolvida em **Flutter** integrada com **API REST** em **Node.js** e banco de dados **MySQL**, implementando operações CRUD para gerenciamento de Clientes e Produtos.

---

## 📊 Informações do Projeto

| Item | Descrição |
|------|-----------|
| **Disciplina** | Desenvolvimento Mobile II |
| **Instituição** | Unilavras |
| **Professor** | Luccas Rafael |
| **Data de Entrega** | 05/12/2025 |
| **Pontuação Máxima** | 25 pontos |

---

## 🏗️ Arquitetura do Sistema

```
┌─────────────────────────────────────────────────────────────┐
│                    APLICAÇÃO FLUTTER                        │
│  ┌────────────┬──────────────┬────────────┬──────────────┐ │
│  │   Views    │   Providers  │  Services  │    Models    │ │
│  │ (Widgets)  │   (Estado)   │ (Negócio)  │   (Dados)    │ │
│  └────────────┴──────────────┴────────────┴──────────────┘ │
└─────────────────────────────────────────────────────────────┘
                            ↕️ HTTP
┌─────────────────────────────────────────────────────────────┐
│                      API REST (Node.js)                     │
│  ┌────────────┬──────────────┬────────────────────────────┐│
│  │   Routes   │   Services   │        Database Config     ││
│  │  (Express) │  (Lógica)    │         (MySQL)           ││
│  └────────────┴──────────────┴────────────────────────────┘│
└─────────────────────────────────────────────────────────────┘
                            ↕️ SQL
┌─────────────────────────────────────────────────────────────┐
│                    BANCO DE DADOS MySQL                     │
│         Tabelas: clientes | produtos                        │
└─────────────────────────────────────────────────────────────┘
```

---

## 💻 Stack Tecnológico

### Frontend (Mobile)
- **Flutter** 3.0+ - Framework UI multiplataforma
- **Dart** - Linguagem de programação
- **Provider** 6.1+ - Gerenciamento de estado
- **HTTP** 1.1+ - Requisições REST
- **Intl** 0.18+ - Formatação de data/hora

### Backend (API)
- **Node.js** 14+ - Runtime JavaScript
- **Express** 4.18+ - Framework web
- **MySQL2** 3.6+ - Driver MySQL
- **dotenv** 16.3+ - Variáveis de ambiente
- **CORS** 2.8+ - Controle de acesso

### Banco de Dados
- **MySQL** 5.7+ / 8.0+
- **phpMyAdmin** - Interface de gerenciamento

---

## 📱 Entidades do Sistema

### Cliente
```
┌──────────────────────────────────────┐
│ CLIENTE                              │
├──────────────────────────────────────┤
│ • id: int (PK, AUTO_INCREMENT)       │
│ • nome: varchar(255)                 │
│ • sobrenome: varchar(255)            │
│ • email: varchar(255)                │
│ • idade: int(3)                      │
│ • foto: varchar(500)                 │
└──────────────────────────────────────┘
```

**Validações:**
- Nome/Sobrenome: 3-50 caracteres
- Email: formato válido com @
- Idade: 1-150 anos
- Foto: URL válida (http/https)

### Produto
```
┌──────────────────────────────────────┐
│ PRODUTO                              │
├──────────────────────────────────────┤
│ • id: int (PK, AUTO_INCREMENT)       │
│ • nome: varchar(255)                 │
│ • descricao: text                    │
│ • preco: decimal(10,2)               │
│ • data_atualizado: datetime          │
└──────────────────────────────────────┘
```

**Validações:**
- Nome: 3-100 caracteres
- Descrição: 10-500 caracteres
- Preço: > 0 e <= 999.999,99

---

## 🔄 Operações CRUD Implementadas

### Clientes

| Operação | Método HTTP | Endpoint | Descrição |
|----------|-------------|----------|-----------|
| **C**reate | POST | `/clientes` | Criar novo cliente |
| **R**ead | GET | `/clientes` | Listar todos os clientes |
| **R**ead | GET | `/clientes/:id` | Buscar cliente por ID |
| **U**pdate | PUT | `/clientes` | Atualizar cliente |
| **D**elete | DELETE | `/clientes/:id` | Remover cliente |

### Produtos

| Operação | Método HTTP | Endpoint | Descrição |
|----------|-------------|----------|-----------|
| **C**reate | POST | `/produtos` | Criar novo produto |
| **R**ead | GET | `/produtos` | Listar todos os produtos |
| **R**ead | GET | `/produtos/:id` | Buscar produto por ID |
| **U**pdate | PUT | `/produtos` | Atualizar produto |
| **D**elete | DELETE | `/produtos/:id` | Remover produto |

---

## 📱 Telas da Aplicação

### 1. Tela Principal (Home)
- Navegação para Clientes e Produtos
- Design moderno com cards interativos
- Ícones representativos

### 2. Lista de Clientes
- Exibição em cards com foto
- Nome completo, email e idade
- Botões de editar e excluir
- FAB para adicionar novo

### 3. Formulário de Cliente
- Campos: nome, sobrenome, email, idade, foto
- Validações em tempo real
- Preview da foto
- Feedback visual

### 4. Lista de Produtos
- Cards com informações do produto
- Preço formatado (R$)
- Data de atualização
- Botões de ação

### 5. Formulário de Produto
- Campos: nome, descrição, preço
- Validações robustas
- Dicas de preenchimento
- Feedback de sucesso/erro

---

## 🔐 Segurança Implementada

### Backend
- ✅ Prepared Statements (prevenção SQL Injection)
- ✅ Validação de dados no servidor
- ✅ Variáveis de ambiente para credenciais
- ✅ CORS configurado

### Frontend
- ✅ Validação de campos no cliente
- ✅ Tratamento de exceções
- ✅ Feedback de erros ao usuário
- ✅ Confirmação para ações destrutivas

---

## 📊 Fluxo de Dados

### Exemplo: Criar Cliente

```
1. Usuário preenche formulário
         ↓
2. View chama Provider.salvar()
         ↓
3. Provider chama Service.salvar()
         ↓
4. Service valida os dados
         ↓
5. Service chama DAO.salvar()
         ↓
6. DAO faz requisição HTTP POST
         ↓
7. Backend recebe e valida
         ↓
8. Backend insere no MySQL
         ↓
9. MySQL retorna ID gerado
         ↓
10. Backend retorna sucesso
         ↓
11. DAO atualiza lista local
         ↓
12. Provider notifica listeners
         ↓
13. View atualiza interface
         ↓
14. Usuário vê SnackBar de sucesso
```

---

## 📦 Estrutura de Arquivos

### Backend (Node.js)
```
backend-mobile-ii/
├── config/
│   └── database.js           # Conexão MySQL
├── models/
│   ├── dbCreation.sql        # Script de criação
│   └── dbInserts.sql         # Dados iniciais
├── routes/
│   ├── clientRoutes.js       # Rotas clientes
│   └── productRoutes.js      # Rotas produtos
├── services/
│   ├── clientService.js      # Lógica clientes
│   └── productService.js     # Lógica produtos
├── .env                      # Variáveis ambiente
├── .gitignore
├── package.json
└── server.js                 # Entry point
```

### Frontend (Flutter)
```
lib/
├── models/                   # Camada de Dados
│   ├── client.dart
│   ├── client_dao.dart
│   ├── client_dao_impl.dart
│   ├── product.dart
│   ├── product_dao.dart
│   ├── product_dao_impl.dart
│   └── exception.dart
├── services/                 # Camada de Negócio
│   ├── client_service.dart
│   └── product_service.dart
├── providers/                # Estado
│   ├── client_provider.dart
│   └── product_provider.dart
├── views/                    # Interface
│   ├── home_page.dart
│   ├── clients_page.dart
│   ├── client_form_page.dart
│   ├── products_page.dart
│   └── product_form_page.dart
└── main.dart                 # Entry point
```

---

## ✅ Requisitos Atendidos

### Requisitos Funcionais
- ✅ CRUD completo de Clientes
- ✅ CRUD completo de Produtos
- ✅ Integração com backend
- ✅ Mínimo 3 telas principais
- ✅ Navegação entre páginas

### Requisitos Não-Funcionais
- ✅ Interface robusta e agradável
- ✅ Código organizado
- ✅ Separação de camadas
- ✅ Documentação completa
- ✅ README com instruções

---

## 🎓 Conceitos Aplicados

### Programação
- ✅ POO (Classes, Herança, Polimorfismo)
- ✅ Async/Await
- ✅ Tratamento de exceções
- ✅ Callbacks e Listeners

### Padrões de Projeto
- ✅ DAO (Data Access Object)
- ✅ Service Layer
- ✅ Provider (Observer Pattern)
- ✅ Repository Pattern

### Arquitetura
- ✅ Separação de camadas
- ✅ REST API
- ✅ Client-Server
- ✅ MVC adaptado

---

## 🚀 Como Executar

### Passo 1: Backend
```bash
cd backend-mobile-ii
npm install
# Configurar .env
# Executar scripts SQL
npm start
```

### Passo 2: Flutter
```bash
cd crud_app
flutter pub get
# Configurar URL da API
flutter run
```

📖 **Documentação Completa**: Consulte `SETUP_COMPLETO.md`

---

## 🎯 Diferenciais do Projeto

- ✅ Código limpo e bem documentado
- ✅ Tratamento de erros robusto
- ✅ Interface moderna e intuitiva
- ✅ Validações completas
- ✅ Feedback visual constante
- ✅ Loading states
- ✅ Estados vazios
- ✅ Confirmações de ações
- ✅ Formatação de dados (preço, data)
- ✅ Preview de imagens

---

## 🏆 Conclusão

Este projeto demonstra a implementação completa de uma aplicação mobile moderna integrada com backend, seguindo boas práticas de desenvolvimento, arquitetura em camadas, e princípios de design de software.

---

**Desenvolvido para a disciplina de Desenvolvimento Mobile II**