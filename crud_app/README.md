# CRUD App - Aplicação Flutter

Aplicação mobile desenvolvida em Flutter para gerenciamento completo de **Clientes** e **Produtos** com integração a API REST.

## 📱 Sobre o Projeto

Este projeto foi desenvolvido como trabalho final da disciplina **Desenvolvimento Mobile II** da Unilavras. A aplicação implementa um CRUD completo (Create, Read, Update, Delete) para duas entidades principais: Clientes e Produtos, com comunicação RESTful com backend Node.js.

## ✨ Funcionalidades

### Clientes
- ✅ Listar todos os clientes
- ✅ Cadastrar novo cliente (nome, sobrenome, email, idade, foto)
- ✅ Editar cliente existente
- ✅ Excluir cliente
- ✅ Validações de campos
- ✅ Exibição de foto do cliente

### Produtos
- ✅ Listar todos os produtos
- ✅ Cadastrar novo produto (nome, descrição, preço)
- ✅ Editar produto existente
- ✅ Excluir produto
- ✅ Validações de campos
- ✅ Formatação de preço em Real (R$)
- ✅ Exibição de data de atualização

## 🏗️ Arquitetura

O projeto segue uma arquitetura em camadas para melhor organização e manutenibilidade:

```
lib/
├── main.dart                    # Ponto de entrada da aplicação
├── models/                      # Camada de Dados
│   ├── client.dart              # Modelo de Cliente
│   ├── client_dao.dart          # Interface DAO Cliente
│   ├── client_dao_impl.dart     # Implementação DAO Cliente
│   ├── product.dart             # Modelo de Produto
│   ├── product_dao.dart         # Interface DAO Produto
│   ├── product_dao_impl.dart    # Implementação DAO Produto
│   └── exception.dart           # Exceções personalizadas
├── services/                    # Camada de Negócio
│   ├── client_service.dart      # Serviço de Clientes (validações)
│   └── product_service.dart     # Serviço de Produtos (validações)
├── providers/                   # Gerenciamento de Estado
│   ├── client_provider.dart     # Provider de Clientes
│   └── product_provider.dart    # Provider de Produtos
└── views/                       # Camada de Apresentação
    ├── home_page.dart           # Tela principal
    ├── clients_page.dart        # Lista de clientes
    ├── client_form_page.dart    # Formulário de cliente
    ├── products_page.dart       # Lista de produtos
    └── product_form_page.dart   # Formulário de produto
```

### Padrões Utilizados

- **DAO (Data Access Object)**: Abstração do acesso aos dados (requisições HTTP)
- **Service Layer**: Camada de regras de negócio e validações
- **Provider**: Gerenciamento de estado reativo
- **Repository Pattern**: Separação entre lógica de negócio e acesso a dados

## 🚀 Pré-requisitos

- Flutter SDK (versão 3.0 ou superior)
- Dart SDK
- Android Studio ou VS Code com extensões Flutter
- Backend rodando (veja README do backend)
- Emulador Android/iOS ou dispositivo físico

## 📦 Instalação

### 1. Clone o repositório

```bash
git clone <seu-repositorio-flutter>
cd crud_app
```

### 2. Instale as dependências

```bash
flutter pub get
```

### 3. Configure a URL do Backend

No arquivo `lib/models/client_dao_impl.dart` e `lib/models/product_dao_impl.dart`, ajuste a URL base se necessário:

```dart
static const String baseUrl = 'http://localhost:3000/clientes'; // ou seu IP
```

**Importante para dispositivo físico**: Se você estiver testando em um dispositivo físico, substitua `localhost` pelo IP da sua máquina na rede local:

```dart
static const String baseUrl = 'http://192.168.1.100:3000/clientes';
```

Para descobrir seu IP:
- **Windows**: `ipconfig` no CMD
- **Linux/Mac**: `ifconfig` no terminal

### 4. Execute a aplicação

```bash
flutter run
```

Ou pelo seu IDE:
- **Android Studio**: Clique no botão Run
- **VS Code**: F5 ou Run > Start Debugging

## 📚 Dependências

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0          # Requisições HTTP
  provider: ^6.1.1      # Gerenciamento de estado
  intl: ^0.18.1         # Formatação de data/hora
```

## 🎯 Como Usar

### Tela Inicial
1. Ao abrir o app, você verá a tela inicial com duas opções:
   - **Clientes**: Gerenciar cadastro de clientes
   - **Produtos**: Gerenciar estoque de produtos

### Gerenciar Clientes
1. Toque em "Clientes"
2. Visualize a lista de clientes cadastrados
3. Para **adicionar**: toque no botão "Novo Cliente"
4. Para **editar**: toque no ícone de lápis
5. Para **excluir**: toque no ícone de lixeira e confirme

### Gerenciar Produtos
1. Toque em "Produtos"
2. Visualize a lista de produtos cadastrados
3. Para **adicionar**: toque no botão "Novo Produto"
4. Para **editar**: toque no ícone de lápis
5. Para **excluir**: toque no ícone de lixeira e confirme

## 🔄 Fluxo de Dados

```
UI (Views)
    ↕️
Provider (Estado)
    ↕️
Service (Validações)
    ↕️
DAO (HTTP Requests)
    ↕️
Backend API
    ↕️
MySQL Database
```

## ✅ Validações Implementadas

### Clientes
- Nome e sobrenome: 3 a 50 caracteres
- Email: formato válido com @
- Idade: entre 1 e 150 anos
- Foto: URL válida iniciando com http/https

### Produtos
- Nome: 3 a 100 caracteres
- Descrição: 10 a 500 caracteres
- Preço: maior que zero e até R$ 999.999,99

## 🎨 Interface

- Interface moderna e intuitiva
- Feedback visual para todas as ações
- Mensagens de erro claras
- Loading indicators durante operações
- Ícones representativos
- Cores diferenciadas (Azul para Clientes, Verde para Produtos)

## ⚠️ Troubleshooting

### Erro de conexão com backend

**Problema**: "Erro de conexão" ou "Failed host lookup"

**Soluções**:
1. Verifique se o backend está rodando
2. Teste a URL no navegador: `http://localhost:3000/clientes`
3. Se usar dispositivo físico, troque `localhost` pelo IP da máquina
4. Verifique se o firewall não está bloqueando a porta 3000

### Emulador não consegue acessar localhost

**Solução para Android**: Use `http://10.0.2.2:3000` ao invés de `http://localhost:3000`

```dart
static const String baseUrl = 'http://10.0.2.2:3000/clientes';
```

### Imagens não carregam

**Problema**: Fotos de clientes não aparecem

**Solução**: Certifique-se que as URLs começam com `https://` e são acessíveis

## 🧪 Testando

Para testar todas as funcionalidades:

1. **Listar**: Verifique se todos os registros aparecem
2. **Criar**: Adicione novos clientes e produtos
3. **Editar**: Modifique registros existentes
4. **Excluir**: Remova registros e confirme
5. **Validações**: Teste campos inválidos
6. **Atualizar**: Use o botão de refresh

## 👥 Integrantes do Grupo

- Luís Gustavo
- Kauã Carvalho
- Stênio Siqueira
- Yago Henrique

## 📅 Data de Entrega

05/12/2025

## 📄 Licença

Este projeto foi desenvolvido para fins educacionais - Unilavras 2025

## 🙏 Agradecimentos

- Professor Luccas Rafael
- Disciplina: Desenvolvimento Mobile II
- Instituição: Unilavras