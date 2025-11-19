# 🚀 Guia de Setup Completo - CRUD App

Este guia vai te ajudar a configurar todo o projeto do zero, tanto o backend quanto o frontend Flutter.

## 📋 Checklist de Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- [ ] Node.js (v14 ou superior) - [Download](https://nodejs.org/)
- [ ] XAMPP ou MySQL Server - [Download](https://www.apachefriends.org/)
- [ ] Flutter SDK (v3.0+) - [Guia de Instalação](https://docs.flutter.dev/get-started/install)
- [ ] Android Studio ou VS Code
- [ ] Git - [Download](https://git-scm.com/)

## 🗂️ Estrutura de Pastas Recomendada

```
meu-projeto/
├── backend-mobile-ii/     # Projeto Node.js
└── crud_app/              # Projeto Flutter
```

---

## PARTE 1: CONFIGURAÇÃO DO BACKEND

### Passo 1: Criar a estrutura do projeto

```bash
mkdir backend-mobile-ii
cd backend-mobile-ii
npm init -y
```

### Passo 2: Instalar dependências

```bash
npm install express mysql2 dotenv cors
npm install --save-dev nodemon
```

### Passo 3: Criar a estrutura de pastas

```bash
mkdir config models routes services
```

### Passo 4: Criar os arquivos

Crie os seguintes arquivos com o conteúdo fornecido:

```
backend-mobile-ii/
├── .env
├── server.js
├── package.json
├── config/
│   └── database.js
├── models/
│   ├── dbCreation.sql
│   └── dbInserts.sql
├── routes/
│   ├── clientRoutes.js
│   └── productRoutes.js
└── services/
    ├── clientService.js
    └── productService.js
```

### Passo 5: Configurar o MySQL

1. Abra o XAMPP Control Panel
2. Inicie o **Apache** e o **MySQL**
3. Abra o navegador e acesse: `http://localhost/phpmyadmin`

### Passo 6: Criar o banco de dados

1. No phpMyAdmin, clique em **SQL**
2. Copie e execute o conteúdo de `models/dbCreation.sql`
3. Verifique se o banco `backend-mobile-ii` foi criado
4. Execute o conteúdo de `models/dbInserts.sql` para popular as tabelas

### Passo 7: Configurar variáveis de ambiente

Edite o arquivo `.env` e ajuste as credenciais do MySQL:

```env
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASS=          # Sua senha do MySQL (se houver)
MYSQL_DB=backend-mobile-ii
MYSQL_PORT=3306
PORT=3000
```

### Passo 8: Testar o backend

```bash
npm start
```

Você deve ver:
```
✓ Conectado ao MySQL com sucesso!
Servidor rodando na porta 3000
Acesse: http://localhost:3000
```

### Passo 9: Testar os endpoints

Abra o navegador e teste:

- `http://localhost:3000/` - Deve mostrar a mensagem de boas-vindas
- `http://localhost:3000/clientes` - Deve listar os clientes
- `http://localhost:3000/produtos` - Deve listar os produtos

✅ **Backend configurado com sucesso!**

---

## PARTE 2: CONFIGURAÇÃO DO FLUTTER

### Passo 1: Criar o projeto Flutter

```bash
cd ..  # Voltar para a pasta pai
flutter create crud_app
cd crud_app
```

### Passo 2: Adicionar dependências

Edite o arquivo `pubspec.yaml` e adicione:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  http: ^1.1.0
  provider: ^6.1.1
  intl: ^0.18.1
```

Depois execute:

```bash
flutter pub get
```

### Passo 3: Criar a estrutura de pastas

```bash
cd lib
mkdir models services providers views
```

### Passo 4: Criar os arquivos

Crie os arquivos conforme a estrutura:

```
lib/
├── main.dart
├── models/
│   ├── client.dart
│   ├── client_dao.dart
│   ├── client_dao_impl.dart
│   ├── product.dart
│   ├── product_dao.dart
│   ├── product_dao_impl.dart
│   └── exception.dart
├── services/
│   ├── client_service.dart
│   └── product_service.dart
├── providers/
│   ├── client_provider.dart
│   └── product_provider.dart
└── views/
    ├── home_page.dart
    ├── clients_page.dart
    ├── client_form_page.dart
    ├── products_page.dart
    └── product_form_page.dart
```

### Passo 5: Configurar a URL do backend

**IMPORTANTE**: Edite os arquivos de DAO conforme seu ambiente:

#### Para emulador Android:
Em `lib/models/client_dao_impl.dart` e `lib/models/product_dao_impl.dart`:

```dart
static const String baseUrl = 'http://10.0.2.2:3000/clientes'; // ou /produtos
```

#### Para dispositivo físico:
Descubra o IP da sua máquina:

**Windows**:
```bash
ipconfig
# Procure por "Endereço IPv4"
```

**Mac/Linux**:
```bash
ifconfig
# Procure por "inet"
```

Depois use:
```dart
static const String baseUrl = 'http://192.168.1.100:3000/clientes'; // Seu IP aqui
```

#### Para iOS Simulator:
```dart
static const String baseUrl = 'http://localhost:3000/clientes';
```

### Passo 6: Executar a aplicação

```bash
flutter run
```

Ou pelo Android Studio/VS Code:
- Clique no botão **Run** (triângulo verde)
- Ou pressione **F5**

✅ **Flutter configurado com sucesso!**

---

## 🔍 Verificação Final

### Checklist de Testes

- [ ] Backend está rodando na porta 3000
- [ ] MySQL/XAMPP está ativo
- [ ] Banco de dados foi criado e populado
- [ ] Endpoints retornam dados no navegador
- [ ] App Flutter abre sem erros
- [ ] Tela inicial mostra as opções de Clientes e Produtos
- [ ] Lista de clientes carrega
- [ ] Lista de produtos carrega
- [ ] Consegue criar novo cliente
- [ ] Consegue editar cliente
- [ ] Consegue excluir cliente
- [ ] Consegue criar novo produto
- [ ] Consegue editar produto
- [ ] Consegue excluir produto

---