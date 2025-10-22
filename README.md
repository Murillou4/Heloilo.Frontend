<div align="center">

# 💝 Heloilo

### _O app que celebra o amor do seu casal_

[![Flutter](https://img.shields.io/badge/Flutter-3.9.2-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.9.2-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

[Características](#-características) • [Instalação](#-instalação) • [Tecnologias](#-tecnologias) • [Roadmap](#-roadmap) • [Contribuindo](#-contribuindo)

</div>

---

## 📖 Sobre o Projeto

**Heloilo** é um aplicativo íntimo e privado criado exclusivamente para casais que desejam fortalecer seus laços, celebrar memórias e compartilhar o dia a dia de forma especial. Com uma interface romântica e minimalista, o app oferece um espaço seguro onde apenas os dois podem:

- 💭 Compartilhar desejos e ideias de presentes
- 🖼️ Criar álbuns de memórias com fotos e música
- 📅 Acompanhar a rotina e status um do outro
- 😊 Registrar humores diários
- 💬 Conversar em um chat privado
- 🎉 Celebrar aniversários e mêsversários
- 📚 Construir a história do relacionamento como um livro

---

## ✨ Características

### 🧑‍❤️‍👩 Perfis do Casal

- Cadastro vinculado entre os dois parceiros
- Perfis personalizáveis com fotos e cores próprias
- Apelidos carinhosos e dados históricos do relacionamento
- Contador de dias juntos

### 💭 Lista de Desejos

- Crie e compartilhe desejos com título, descrição, link e imagem
- Defina níveis de importância (1 a 5)
- Comentários e notas em cada desejo
- Sincronização em tempo real entre os perfis

### 🖼️ Memórias Especiais

- Upload de fotos com data e descrição
- Carrossel com transições suaves
- Música ambiente romântica para tornar o momento ainda mais especial
- Metadados organizados cronologicamente

### 😊 Registro de Humor Diário

- Registre como está se sentindo todos os dias
- Dashboard com gráficos de histórico de humores
- Veja o humor do parceiro para fomentar empatia
- Filtros customizáveis por período

### 📅 Agenda Compartilhada

- Crie listas de tarefas diárias
- Informe status em tempo real do que está fazendo
- Acompanhe a rotina do parceiro

### 💬 Chat Privado

- Mensagens de texto em tempo real
- Emojis e stickers românticos
- Histórico de conversas com busca
- Notificações de novas mensagens

### 📚 História do Casal

- Construa a história do relacionamento em ordem cronológica
- Interface visual como páginas de um livro
- Combine texto e imagens

### 🔔 Notificações Inteligentes

- Avisos de aniversário e mêsversário
- Notificações quando o parceiro adiciona desejos ou comentários
- Sincronização em tempo real

### 🔒 Segurança e Privacidade

- Dados acessíveis apenas para o casal
- Criptografia de informações sensíveis
- Sem integração com redes sociais
- Sem anúncios ou conteúdo de terceiros

---

## 🎨 Screenshots

> _Em breve: capturas de tela do aplicativo_

---

## 🚀 Instalação

### Pré-requisitos

- Flutter SDK 3.9.2 ou superior
- Dart 3.9.2 ou superior
- Editor de código (VS Code, Android Studio, etc.)

### Passos

1. **Clone o repositório**

   ```bash
   git clone https://github.com/seu-usuario/heloilo_frontend.git
   cd heloilo_frontend
   ```

2. **Instale as dependências**

   ```bash
   flutter pub get
   ```

3. **Execute o aplicativo**

   ```bash
   # Para web
   flutter run -d chrome

   # Para Android
   flutter run -d android

   # Para iOS
   flutter run -d ios
   ```

---

## 🛠️ Tecnologias

### Frontend

- **[Flutter](https://flutter.dev)** - Framework multiplataforma
- **[Dart](https://dart.dev)** - Linguagem de programação

### Backend _(em desenvolvimento)_

- Node.js / Express
- PostgreSQL
- JWT para autenticação
- WebSockets para comunicação em tempo real

### Infraestrutura

- Firebase Storage (imagens)
- HTTPS/SSL
- Deploy Web (Vercel/Netlify)

---

## 📂 Estrutura do Projeto

```
heloilo_frontend/
├── lib/
│   ├── main.dart              # Ponto de entrada
│   ├── core/                  # Configurações e utilidades
│   ├── features/              # Módulos por funcionalidade
│   │   ├── auth/             # Autenticação
│   │   ├── profile/          # Perfis do casal
│   │   ├── wishes/           # Lista de desejos
│   │   ├── memories/         # Memórias e fotos
│   │   ├── mood/             # Registro de humor
│   │   ├── agenda/           # Agenda compartilhada
│   │   ├── chat/             # Chat privado
│   │   └── story/            # História do casal
│   ├── shared/               # Widgets e componentes reutilizáveis
│   └── theme/                # Temas e estilos
├── test/                     # Testes unitários e de widget
├── web/                      # Recursos web
└── pubspec.yaml              # Dependências
```

---

## 🗺️ Roadmap

### Fase 1 - MVP _(Em andamento)_

- [x] Configuração inicial do projeto
- [ ] Tela de login e cadastro
- [ ] Vinculação de contas
- [ ] Perfis personalizáveis
- [ ] Tela inicial com contador de dias

### Fase 2 - Funcionalidades Core

- [ ] Lista de desejos
- [ ] Galeria de memórias
- [ ] Chat básico
- [ ] Notificações

### Fase 3 - Funcionalidades Avançadas

- [ ] Registro de humor com gráficos
- [ ] Agenda compartilhada
- [ ] História do casal (estilo livro)
- [ ] Música ambiente

### Fase 4 - Polimento

- [ ] Animações e transições suaves
- [ ] Tela especial de aniversário
- [ ] Temas personalizáveis
- [ ] Otimizações de performance

### Fase 5 - Mobile

- [ ] Versão Android nativa
- [ ] Versão iOS nativa
- [ ] Notificações push

---

## 👥 Contribuindo

Contribuições são muito bem-vindas! Se você tem ideias para melhorar o Heloilo:

1. Faça um Fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abra um Pull Request

### Diretrizes

- Mantenha o código limpo e bem documentado
- Siga os padrões de código do Flutter/Dart
- Adicione testes quando apropriado
- Descreva bem suas mudanças no PR

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

## 💌 Contato

Tem alguma dúvida ou sugestão? Entre em contato!

- **Email**: seu-email@exemplo.com
- **GitHub**: [@seu-usuario](https://github.com/seu-usuario)

---

<div align="center">

### Feito com 💖 para casais que celebram o amor todos os dias

</div>
