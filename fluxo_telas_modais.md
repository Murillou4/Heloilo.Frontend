# 📱 Fluxo Completo de Telas e Modais - Heloilo

## 🚀 Fluxo Principal da Aplicação

### 1. **Tela de Boas-vindas** (`welcome_page.dart`)
- **Objetivo**: Primeira tela que o usuário vê
- **Elementos**:
  - Logo da aplicação
  - Texto de boas-vindas romântico
  - Botões: "Entrar" e "Cadastrar"
  - Design romântico e acolhedor

### 2. **Tela de Login** (`signin_page.dart`)
- **Objetivo**: Autenticação do usuário
- **Elementos**:
  - Campo de email/usuário
  - Campo de senha
  - Botão "Entrar"
  - Link "Esqueci minha senha"
  - Link "Não tenho conta"
  - Validação de campos

### 3. **Tela de Cadastro** (`signup_page.dart`)
- **Objetivo**: Registro de novo usuário
- **Elementos**:
  - Campo nome completo
  - Campo apelido carinhoso
  - Campo email
  - Campo senha
  - Campo confirmar senha
  - Botão "Cadastrar"
  - Link "Já tenho conta"
  - Validação de campos

### 4. **Tela de Vinculação de Parceiro**
- **Objetivo**: Conectar o casal
- **Elementos**:
  - Campo para inserir email do parceiro
  - Botão "Enviar Solicitação"
  - Status da solicitação (enviada/pendente/aceita)
  - Notificação quando parceiro aceita

### 5. **Tela de Configuração Inicial** (Opcional)
- **Objetivo**: Definir dados históricos do relacionamento
- **Elementos**:
  - Data em que se conheceram
  - Local onde se conheceram
  - Data de início do relacionamento
  - Tipo de comemoração (anual/mensal)
  - Botões "Salvar" e "Pular"
  - Pode ser completada ou pulada por ambos

### 6. **Tela Principal** (`start_page.dart`)
- **Objetivo**: Dashboard principal do casal
- **Elementos**:
  - Contador de dias juntos
  - Próximas datas especiais
  - Acesso rápido aos módulos principais
  - Status do parceiro
  - Notificações recentes
  - Menu de navegação

---

## 🧩 Módulos e Suas Telas

### 💭 **Módulo: Desejos e Presentes**

#### **Tela de Lista de Desejos**
- **Elementos**:
  - Lista cronológica de desejos
  - Filtros por categoria (12 categorias predefinidas)
  - Ordenação (data, importância, ambos)
  - Busca por título
  - Botão "Adicionar Desejo"
  - Cores distintas para cada pessoa

#### **Modal: Adicionar/Editar Desejo**
- **Elementos**:
  - Campo título (máx 500 caracteres)
  - Campo descrição (máx 2000 caracteres)
  - Campo link (URL válida)
  - Upload de imagem
  - Seletor de importância (1-5)
  - Seletor de categoria (12 opções)
  - Botões "Salvar" e "Cancelar"

#### **Modal: Detalhes do Desejo**
- **Elementos**:
  - Visualização completa do desejo
  - Comentários e notas
  - Botões "Editar" e "Excluir"
  - Histórico de alterações

---

### 🖼️ **Módulo: Memórias e Momentos Especiais**

#### **Tela de Memórias**
- **Elementos**:
  - Carrossel de fotos com transições suaves
  - Controles de música ambiente
  - Upload de novas fotos
  - Tags e categorias
  - Navegação entre memórias
  - Metadados (data, título, descrição)

#### **Modal: Upload de Memória**
- **Elementos**:
  - Seletor de arquivos (fotos/vídeos)
  - Campo título
  - Campo descrição
  - Seletor de tags
  - Preview da imagem
  - Botões "Salvar" e "Cancelar"

---

### 😊 **Módulo: Registro de Humor Diário**

#### **Tela de Humor**
- **Elementos**:
  - Seleção de humor atual (15 opções)
  - Campo comentário opcional
  - Botão "Registrar"
  - Visualização do humor do parceiro
  - Timeline do dia

#### **Tela de Relatório de Humor**
- **Elementos**:
  - Gráficos do histórico
  - Filtros por período
  - Comparação entre os dois
  - Estatísticas e insights

---

### 📅 **Módulo: Agenda e Status Diário**

#### **Tela de Agenda**
- **Elementos**:
  - Lista de atividades do dia
  - Agenda do parceiro
  - Botão "Adicionar Atividade"
  - Status atual do parceiro
  - Histórico de status

#### **Modal: Adicionar/Editar Atividade**
- **Elementos**:
  - Campo descrição da atividade
  - Seletor de horário
  - Configuração de lembretes
  - Botões "Salvar" e "Cancelar"

#### **Modal: Status Atual**
- **Elementos**:
  - Campo "O que estou fazendo"
  - Botão "Atualizar Status"
  - Histórico de status do dia

---

### 💬 **Módulo: Chat e Comunicação**

#### **Tela de Chat**
- **Elementos**:
  - Lista de mensagens
  - Campo de texto para nova mensagem
  - Botões de emoji e stickers
  - Upload de imagens/áudio
  - Status de mensagens (enviada/entregue/lida)
  - Indicador "digitando"

#### **Modal: Envio de Mídia**
- **Elementos**:
  - Seletor de arquivo
  - Preview da mídia
  - Campo de legenda
  - Botões "Enviar" e "Cancelar"

---

### 🔔 **Módulo: Notificações**

#### **Tela de Notificações**
- **Elementos**:
  - Lista de notificações
  - Filtros por tipo
  - Configurações de notificação
  - Histórico de notificações

#### **Modal: Configurações de Notificação**
- **Elementos**:
  - Toggle para cada tipo de notificação
  - Horários preferenciais
  - Intensidade (silenciosa/normal/prioritária)
  - Botões "Salvar" e "Cancelar"

---

### 👤 **Módulo: Perfil e Configurações**

#### **Tela de Perfil Individual**
- **Elementos**:
  - Foto de perfil
  - Nome e apelido
  - Cor/tema personalizado
  - Botão "Editar Perfil"

#### **Tela de Perfil do Casal**
- **Elementos**:
  - Dados do relacionamento
  - Datas especiais
  - Estatísticas do casal
  - Botão "Editar Relacionamento"

#### **Modal: Editar Perfil**
- **Elementos**:
  - Upload de nova foto
  - Campos nome e apelido
  - Seletor de cor/tema
  - Botões "Salvar" e "Cancelar"

#### **Modal: Editar Relacionamento**
- **Elementos**:
  - Campos de datas especiais
  - Tipo de comemoração
  - Botão "Desvincular" (com confirmação)
  - Botões "Salvar" e "Cancelar"

---

## 🔄 Fluxos Especiais

### **Fluxo de Aniversário/Mêsversário**
- **Tela Especial de Celebração**
  - Efeitos visuais especiais
  - Contador de dias
  - Mensagens românticas
  - Música temática
  - Botão "Compartilhar Momento"

### **Fluxo de Desvinculação**
- **Modal de Confirmação**
  - Aviso sobre consequências
  - Confirmação dupla
  - Botões "Confirmar" e "Cancelar"

### **Fluxo de Recuperação de Senha**
- **Tela de Recuperação**
  - Campo de email
  - Botão "Enviar Link"
  - Instruções de recuperação

---

## 📱 Estrutura de Navegação

### **Menu Principal (Bottom Navigation)**
- 🏠 Início
- 💭 Desejos
- 🖼️ Memórias
- 😊 Humor
- 📅 Agenda
- 💬 Chat
- 👤 Perfil

### **Menu Lateral (Drawer)**
- Configurações
- Notificações
- Sobre o App
- Logout

---

## 🎨 Elementos Visuais Comuns

### **Modais Padrão**
- Fundo escurecido
- Animação de entrada suave
- Botões de ação consistentes
- Validação em tempo real

### **Notificações**
- Toast notifications
- Badges nos ícones
- Som de notificação
- Vibração (mobile)

### **Estados de Carregamento**
- Skeleton screens
- Spinners
- Progress bars
- Mensagens de erro

---

## 🔐 Telas de Segurança

### **Tela de Bloqueio**
- Após 5 tentativas de login
- Timer de 15 minutos
- Botão "Tentar Novamente"

### **Tela de Sessão Expirada**
- Aviso de token expirado
- Botão "Renovar Sessão"
- Redirecionamento para login

---

Este fluxo completo atende a todos os requisitos funcionais identificados, proporcionando uma experiência romântica e intuitiva para o casal, com navegação fluida e funcionalidades bem organizadas em módulos específicos.
