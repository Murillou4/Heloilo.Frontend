This file is a merged representation of the entire codebase, combined into a single document by Repomix.

# File Summary

## Purpose
This file contains a packed representation of the entire repository's contents.
It is designed to be easily consumable by AI systems for analysis, code review,
or other automated processes.

## File Format
The content is organized as follows:
1. This summary section
2. Repository information
3. Directory structure
4. Repository files (if enabled)
5. Multiple file entries, each consisting of:
  a. A header with the file path (## File: path/to/file)
  b. The full contents of the file in a code block

## Usage Guidelines
- This file should be treated as read-only. Any changes should be made to the
  original repository files, not this packed version.
- When processing this file, use the file path to distinguish
  between different files in the repository.
- Be aware that this file may contain sensitive information. Handle it with
  the same level of security as you would the original repository.

## Notes
- Some files may have been excluded based on .gitignore rules and Repomix's configuration
- Binary files are not included in this packed representation. Please refer to the Repository Structure section for a complete list of file paths, including binary files
- Files matching patterns in .gitignore are excluded
- Files matching default ignore patterns are excluded
- Files are sorted by Git change count (files with more changes are at the bottom)

# Directory Structure
```
.gitignore
.metadata
analysis_options.yaml
API DOC.md
fluxo_telas_modais.md
lib/core/constants/local_data_keys.dart
lib/core/constants/public_routes.dart
lib/core/services/dio_service.dart
lib/core/services/local_data_service.dart
lib/core/shared/models/api_response.dart
lib/core/shared/models/response_type.dart
lib/core/themes/app_colors.dart
lib/core/themes/dark_theme.dart
lib/core/themes/light_theme.dart
lib/core/themes/theme_notifier.dart
lib/data/models/auth.dart
lib/data/models/user.dart
lib/features/app.dart
lib/features/auth/pages/loading_page.dart
lib/features/auth/pages/sign_in_page.dart
lib/features/auth/pages/sign_up_page.dart
lib/features/auth/providers/auth_notifier.dart
lib/features/auth/providers/sign_in_notifier.dart
lib/features/auth/providers/sign_up_notifier.dart
lib/features/auth/services/auth_service.dart
lib/features/auth/services/dtos/auth_dtos.dart
lib/main.dart
pubspec.lock
pubspec.yaml
README.md
requirements.md
web/index.html
web/manifest.json
```

# Files

## File: API DOC.md
````markdown
# **Documentação da API Heloilo**

Esta documentação detalha os endpoints disponíveis na API Heloilo.

## **Autenticação e Usuário**

Endpoints responsáveis pelo registro, login e gerenciamento dos perfis de usuário.

### **Controller: /Auth**

Rotas para o ciclo de vida da autenticação.

#### **1\. Registrar Novo Usuário**

* **Método HTTP:** POST  
* **Endpoint Completo:** /Auth/register  
* **Descrição:** Cria uma nova conta de usuário no sistema.  
* **Payload Esperado (Request Body):** application/json  
  JSON  
  {  
    "email": "usuario@exemplo.com",  
    "password": "senhaForte123",  
    "name": "Nome Sobrenome",  
    "nickname": "Apelido"  
  }

  **Campos do Payload:**  
  * email (string, obrigatório): O email único do usuário. Deve ser um email válido e ter no máximo 255 caracteres.  
  * password (string, obrigatório): A senha. Deve ter no mínimo 6 e no máximo 100 caracteres.  
  * name (string, obrigatório): O nome do usuário. Máximo de 255 caracteres.  
  * nickname (string, opcional): O apelido do usuário. Máximo de 100 caracteres.  
* **Estrutura da Response (Sucesso: 200 OK):**  
  JSON  
  {  
    "type": "OK",  
    "message": "Usuário registrado com sucesso",  
    "title": "Registro bem-sucedido",  
    "status": 200,  
    "data": {  
      "user": {  
        "id": 1,  
        "email": "usuario@exemplo.com",  
        "name": "Nome Sobrenome",  
        "nickname": "Apelido"  
      },  
      "token": "eyJh...G\_w",  
      "refreshToken": "aBcD...xYz=",  
      "expiresAt": "2025-11-15T03:19:00Z"  
    },  
    "extendedResultCode": "\#SUCCESS",  
    "date": "2025-11-15T02:19:00Z"  
  }

* **Possíveis Erros (Error Responses):**  
  * **400 Bad Request:** (Dados inválidos. Ex: email já existe, senha curta).  
    JSON  
    {  
      "type": "BAD\_REQUEST",  
      "message": "Email já cadastrado",  
      "title": "Erro de validação",  
      "status": 400,  
      "data": null,  
      "extendedResultCode": "\#ERROR",  
      "date": "2025-11-15T02:19:00Z"  
    }

  * **500 Internal Server Error:** (Erro genérico no servidor).

---

#### **2\. Realizar Login**

* **Método HTTP:** POST  
* **Endpoint Completo:** /Auth/login  
* **Descrição:** Autentica um usuário existente e retorna tokens de acesso (Access e Refresh).  
* **Payload Esperado (Request Body):** application/json  
  JSON  
  {  
    "email": "usuario@exemplo.com",  
    "password": "senhaForte123"  
  }

  **Campos do Payload:**  
  * email (string, obrigatório): O email cadastrado.  
  * password (string, obrigatório): A senha cadastrada.  
* **Estrutura da Response (Sucesso: 200 OK):**  
  JSON  
  {  
    "type": "OK",  
    "message": "Login realizado com sucesso",  
    "title": "Autenticação bem-sucedida",  
    "status": 200,  
    "data": {  
      "user": {  
        "id": 1,  
        "email": "usuario@exemplo.com",  
        "name": "Nome Sobrenome",  
        "nickname": "Apelido",  
        "hasRelationship": false  
      },  
      "token": "eyJh...G\_w",  
      "refreshToken": "aBcD...xYz=",  
      "expiresAt": "2025-11-15T03:19:00Z"  
    },  
    "extendedResultCode": "\#SUCCESS",  
    "date": "2025-11-15T02:19:00Z"  
  }

* **Possíveis Erros (Error Responses):**  
  * **401 Unauthorized:** (Email ou senha incorretos).  
    JSON  
    {  
      "type": "UNAUTHORIZED",  
      "message": "Email ou senha inválidos",  
      "title": "Credenciais inválidas",  
      "status": 401,  
      "data": null,  
      "extendedResultCode": "\#ERROR",  
      "date": "2025-11-15T02:19:00Z"  
    }

  * **500 Internal Server Error:** (Erro genérico no servidor).

---

#### **3\. Renovar Token de Acesso**

* **Método HTTP:** POST  
* **Endpoint Completo:** /Auth/refresh  
* **Descrição:** Renova o token de acesso (Access Token) usando um Refresh Token válido.  
* **Payload Esperado (Request Body):** application/json  
  JSON  
  {  
    "refreshToken": "aBcD...xYz="  
  }

  **Campos do Payload:**  
  * refreshToken (string, obrigatório): O Refresh Token obtido durante o login.  
* **Estrutura da Response (Sucesso: 200 OK):**  
  JSON  
  {  
    "type": "OK",  
    "message": "Token renovado com sucesso",  
    "title": "Token atualizado",  
    "status": 200,  
    "data": {  
      "token": "eyJh...NEW\_G\_w",  
      "refreshToken": "new\_aBcD...xYz=",  
      "expiresAt": "2025-11-15T04:19:00Z"  
    },  
    "extendedResultCode": "\#SUCCESS",  
    "date": "2025-11-15T03:19:00Z"  
  }

* **Possíveis Erros (Error Responses):**  
  * **401 Unauthorized:** (Refresh token inválido, expirado ou revogado).  
    JSON  
    {  
      "type": "UNAUTHORIZED",  
      "message": "Refresh token inválido ou expirado",  
      "title": "Token inválido",  
      "status": 401,  
      "data": null,  
      "extendedResultCode": "\#ERROR",  
      "date": "2025-11-15T03:19:00Z"  
    }

  * **500 Internal Server Error:** (Erro genérico no servidor).

---

#### **4\. Realizar Logout**

* **Método HTTP:** POST  
* **Endpoint Completo:** /Auth/logout  
* **Descrição:** Realiza o logout do usuário, revogando o Refresh Token. (Requer autenticação com Access Token).  
* **Payload Esperado (Request Body):** application/json  
  JSON  
  {  
    "refreshToken": "aBcD...xYz="  
  }

  **Campos do Payload:**  
  * refreshToken (string, obrigatório): O Refresh Token a ser revogado.  
* **Estrutura da Response (Sucesso: 200 OK):**  
  JSON  
  {  
    "type": "OK",  
    "message": "Logout realizado com sucesso",  
    "title": "Sessão encerrada",  
    "status": 200,  
    "data": null,  
    "extendedResultCode": "\#SUCCESS",  
    "date": "2025-11-15T02:19:00Z"  
  }

* **Possíveis Erros (Error Responses):**  
  * **401 Unauthorized:** (Se o Access Token não for fornecido ou for inválido).  
  * **500 Internal Server Error:** (Erro genérico no servidor).

---

#### **5\. Solicitar Redefinição de Senha**

* **Método HTTP:** POST  
* **Endpoint Completo:** /Auth/forgot-password  
* **Descrição:** Inicia o fluxo de redefinição de senha. Envia um email (em produção) com o token de recuperação.  
* **Payload Esperado (Request Body):** application/json  
  JSON  
  {  
    "email": "usuario@exemplo.com"  
  }

* **Estrutura da Response (Sucesso: 200 OK):**  
  JSON  
  {  
    "type": "OK",  
    "message": "Se o email estiver cadastrado, você receberá instruções para redefinir sua senha",  
    "title": "Solicitação processada",  
    "status": 200,  
    "data": null,  
    "extendedResultCode": "\#SUCCESS",  
    "date": "2025-11-15T02:19:00Z"  
  }

* **Possíveis Erros (Error Responses):**  
  * **500 Internal Server Error:** (Erro genérico no servidor).

---

#### **6\. Redefinir Senha**

* **Método HTTP:** POST  
* **Endpoint Completo:** /Auth/reset-password  
* **Descrição:** Define uma nova senha usando o token recebido por email.  
* **Payload Esperado (Request Body):** application/json  
  JSON  
  {  
    "token": "TOKEN\_RECEBIDO\_POR\_EMAIL",  
    "newPassword": "novaSenhaSuperForte123"  
  }

  **Campos do Payload:**  
  * token (string, obrigatório): O token de redefinição.  
  * newPassword (string, obrigatório): A nova senha (mínimo 6 caracteres).  
* **Estrutura da Response (Sucesso: 200 OK):**  
  JSON  
  {  
    "type": "OK",  
    "message": "Senha redefinida com sucesso",  
    "title": "Senha atualizada",  
    "status": 200,  
    "data": null,  
    "extendedResultCode": "\#SUCCESS",  
    "date": "2025-11-15T02:19:00Z"  
  }

* **Possíveis Erros (Error Responses):**  
  * **400 Bad Request:** (Token inválido, expirado ou nova senha curta).  
    JSON  
    {  
      "type": "BAD\_REQUEST",  
      "message": "Token inválido ou expirado",  
      "title": "Erro ao redefinir senha",  
      "status": 400,  
      "data": null,  
      "extendedResultCode": "\#ERROR",  
      "date": "2025-11-15T02:19:00Z"  
    }

  * **500 Internal Server Error:** (Erro genérico no servidor).

---

#### **7\. Verificar Email**

* **Método HTTP:** POST  
* **Endpoint Completo:** /Auth/verify-email  
* **Descrição:** Confirma o endereço de email do usuário usando o token de verificação.  
* **Payload Esperado (Request Body):** application/json  
  JSON  
  {  
    "token": "TOKEN\_DE\_VERIFICACAO"  
  }

* **Estrutura da Response (Sucesso: 200 OK):**  
  JSON  
  {  
    "type": "OK",  
    "message": "Email verificado com sucesso",  
    "title": "Verificação concluída",  
    "status": 200,  
    "data": null,  
    "extendedResultCode": "\#SUCCESS",  
    "date": "2025-11-15T02:19:00Z"  
  }

* **Possíveis Erros (Error Responses):**  
  * **400 Bad Request:** (Token inválido ou expirado).  
  * **500 Internal Server Error:** (Erro genérico no servidor).

---

#### **8\. Reenviar Verificação de Email**

* **Método HTTP:** POST  
* **Endpoint Completo:** /Auth/resend-verification  
* **Descrição:** Solicita o reenvio do email de verificação.  
* **Payload Esperado (Request Body):** application/json  
  JSON  
  {  
    "email": "usuario@exemplo.com"  
  }

* **Estrutura da Response (Sucesso: 200 OK):**  
  JSON  
  {  
    "type": "OK",  
    "message": "Se o email estiver cadastrado e não verificado, você receberá um novo email de verificação",  
    "title": "Solicitação processada",  
    "status": 200,  
    "data": null,  
    "extendedResultCode": "\#SUCCESS",  
    "date": "2025-11-15T02:19:00Z"  
  }

* **Possíveis Erros (Error Responses):**  
  * **400 Bad Request:** (Email já verificado).  
  * **500 Internal Server Error:** (Erro genérico no servidor).

---

### **Controller: /Users**

Rotas para gerenciar o perfil do usuário autenticado. (Requer autenticação).

#### **1\. Obter Dados do Usuário Logado**

* **Método HTTP:** GET  
* **Endpoint Completo:** /Users/me  
* **Descrição:** Obtém as informações de perfil do usuário atualmente autenticado.  
* **Parâmetros:** Nenhum.  
* **Payload Esperado:** Nenhum.  
* **Estrutura da Response (Sucesso: 200 OK):**  
  JSON  
  {  
    "type": "OK",  
    "message": "Usuário obtido com sucesso",  
    "title": "Usuário encontrado",  
    "status": 200,  
    "data": {  
      "user": {  
        "id": 1,  
        "email": "usuario@exemplo.com",  
        "name": "Nome Sobrenome",  
        "nickname": "Apelido",  
        "themeColor": "\#FF6B9D",  
        "hasProfilePhoto": true,  
        "createdAt": "2025-11-15T01:00:00Z"  
      }  
    },  
    "extendedResultCode": "\#SUCCESS",  
    "date": "2025-11-15T02:19:00Z"  
  }

* **Possíveis Erros (Error Responses):**  
  * **401 Unauthorized:** (Token JWT inválido ou ausente).  
  * **404 Not Found:** (Usuário não encontrado no banco de dados).  
  * **500 Internal Server Error:** (Erro genérico no servidor).

---

#### **2\. Atualizar Perfil do Usuário**

* **Método HTTP:** PUT  
* **Endpoint Completo:** /Users/me  
* **Descrição:** Atualiza o nome e/ou apelido do usuário autenticado.  
* **Payload Esperado (Request Body):** application/json  
  JSON  
  {  
    "name": "Novo Nome",  
    "nickname": "Novo Apelido"  
  }

  **Campos do Payload:**  
  * name (string, opcional): O novo nome do usuário (máx 255 caracteres).  
  * nickname (string, opcional): O novo apelido (máx 100 caracteres).  
* **Estrutura da Response (Sucesso: 200 OK):** (Retorna o DTO UserDto atualizado, veja "Obter Dados do Usuário Logado").  
* **Possíveis Erros (Error Responses):**  
  * **400 Bad Request:** (Dados inválidos, ex: nome excede o limite).  
  * **401 Unauthorized:** (Token JWT inválido ou ausente).  
  * **404 Not Found:** (Usuário não encontrado).  
  * **500 Internal Server Error:** (Erro genérico no servidor).

---

#### **3\. Atualizar Tema de Cor**

* **Método HTTP:** PUT  
* **Endpoint Completo:** /Users/me/theme  
* **Descrição:** Atualiza a cor do tema preferida do usuário.  
* **Payload Esperado (Request Body):** application/json  
  JSON  
  {  
    "themeColor": "\#AA33FF"  
  }

  **Campos do Payload:**  
  * themeColor (string, obrigatório): Nova cor no formato hexadecimal (\#RRGGBB).  
* **Estrutura da Response (Sucesso: 200 OK):** (Retorna o DTO UserDto atualizado, veja "Obter Dados do Usuário Logado").  
* **Possíveis Erros (Error Responses):**  
  * **400 Bad Request:** (Cor em formato inválido).  
  * **401 Unauthorized:** (Token JWT inválido ou ausente).  
  * **404 Not Found:** (Usuário não encontrado).  
  * **500 Internal Server Error:** (Erro genérico no servidor).

---

#### **4\. Upload de Foto de Perfil**

* **Método HTTP:** POST  
* **Endpoint Completo:** /Users/me/photo  
* **Descrição:** Faz o upload (ou substitui) a foto de perfil do usuário.  
* **Payload Esperado (Request Body):** multipart/form-data  
  * file (file, obrigatório): O arquivo de imagem (ex: .jpg, .png). Limite de 10MB.  
* **Estrutura da Response (Sucesso: 200 OK):**  
  JSON  
  {  
    "type": "OK",  
    "message": "Foto enviada com sucesso",  
    "title": "Foto atualizada",  
    "status": 200,  
    "data": {  
      "photoId": 1  
    },  
    "extendedResultCode": "\#SUCCESS",  
    "date": "2025-11-15T02:19:00Z"  
  }

* **Possíveis Erros (Error Responses):**  
  * **400 Bad Request:** (Arquivo não fornecido, tipo de arquivo inválido ou tamanho excedido).  
  * **401 Unauthorized:** (Token JWT inválido ou ausente).  
  * **404 Not Found:** (Usuário não encontrado).  
  * **500 Internal Server Error:** (Erro genérico no servidor).

---

#### **5\. Obter Foto de Perfil**

* **Método HTTP:** GET  
* **Endpoint Completo:** /Users/me/photo  
* **Descrição:** Obtém o arquivo de imagem da foto de perfil do usuário autenticado.  
* **Payload Esperado:** Nenhum.  
* **Estrutura da Response (Sucesso: 200 OK):**  
  * Retorna o stream binário do arquivo image/jpeg.  
* **Possíveis Erros (Error Responses):**  
  * **400 Bad Request:** (Foto não encontrada para o usuário).  
  * **401 Unauthorized:** (Token JWT inválido ou ausente).  
  * **404 Not Found:** (Usuário não encontrado).  
  * **500 Internal Server Error:** (Erro genérico no servidor).

---

#### **6\. Atualizar Senha**

* **Método HTTP:** PUT  
* **Endpoint Completo:** /Users/me/password  
* **Descrição:** Atualiza a senha do usuário autenticado.  
* **Payload Esperado (Request Body):** application/json  
  JSON  
  {  
    "currentPassword": "senhaAntiga123",  
    "newPassword": "novaSenhaSuperForte123",  
    "confirmPassword": "novaSenhaSuperForte123"  
  }

  **Campos do Payload:**  
  * currentPassword (string, obrigatório): A senha atual do usuário.  
  * newPassword (string, obrigatório): A nova senha (mínimo 6, máximo 100 caracteres).  
  * confirmPassword (string, obrigatório): Confirmação da nova senha.  
* **Estrutura da Response (Sucesso: 200 OK):**  
  JSON  
  {  
    "type": "OK",  
    "message": "Senha atualizada com sucesso",  
    "title": "Senha atualizada",  
    "status": 200,  
    "data": null,  
    "extendedResultCode": "\#SUCCESS",  
    "date": "2025-11-15T02:19:00Z"  
  }

* **Possíveis Erros (Error Responses):**  
  * **400 Bad Request:** (Nova senha e confirmação não conferem; nova senha curta).  
  * **401 Unauthorized:** (Senha atual incorreta).  
  * **404 Not Found:** (Usuário não encontrado).  
  * **500 Internal Server Error:** (Erro genérico no servidor).

---

#### **7\. Exportar Dados do Usuário**

* **Método HTTP:** GET  
* **Endpoint Completo:** /Users/me/export  
* **Descrição:** Exporta todos os dados do usuário (memórias, desejos, chats, etc.) em formato JSON ou PDF.  
* **Parâmetros (Query):**  
  * format (string, opcional): O formato desejado. "json" (padrão) ou "pdf".  
* **Estrutura da Response (Sucesso: 200 OK):**  
  * Retorna o stream binário do arquivo application/json ou application/pdf.  
* **Possíveis Erros (Error Responses):**  
  * **401 Unauthorized:** (Token JWT inválido ou ausente).  
  * **404 Not Found:** (Usuário não encontrado).  
  * **500 Internal Server Error:** (Erro genérico no servidor).

---

#### **8\. Solicitar Exclusão de Conta**

* **Método HTTP:** POST  
* **Endpoint Completo:** /Users/me/delete-request  
* **Descrição:** Agenda a exclusão da conta do usuário para 30 dias no futuro.  
* **Payload Esperado:** Nenhum.  
* **Estrutura da Response (Sucesso: 200 OK):**  
  JSON  
  {  
    "type": "OK",  
    "message": "Solicitação de exclusão criada. Sua conta será excluída em 30 dias. Você pode cancelar a qualquer momento antes dessa data.",  
    "title": "Exclusão agendada",  
    "status": 200,  
    "data": {  
      "message": "Solicitação de exclusão criada...",  
      "deletionScheduledAt": "2025-12-15T02:19:00Z"  
    },  
    "extendedResultCode": "\#SUCCESS",  
    "date": "2025-11-15T02:19:00Z"  
  }

* **Possíveis Erros (Error Responses):**  
  * **400 Bad Request:** (Solicitação já existente).  
  * **401 Unauthorized:** (Token JWT inválido ou ausente).  
  * **404 Not Found:** (Usuário não encontrado).  
  * **500 Internal Server Error:** (Erro genérico no servidor).

---

#### **9\. Cancelar Exclusão de Conta**

* **Método HTTP:** POST  
* **Endpoint Completo:** /Users/me/cancel-deletion  
* **Descrição:** Cancela uma solicitação de exclusão de conta agendada.  
* **Payload Esperado:** Nenhum.  
* **Estrutura da Response (Sucesso: 200 OK):**  
  JSON  
  {  
    "type": "OK",  
    "message": "Exclusão de conta cancelada com sucesso",  
    "title": "Exclusão cancelada",  
    "status": 200,  
    "data": null,  
    "extendedResultCode": "\#SUCCESS",  
    "date": "2025-11-15T02:19:00Z"  
  }

* **Possíveis Erros (Error Responses):**  
  * **400 Bad Request:** (Nenhuma solicitação de exclusão ativa).  
  * **401 Unauthorized:** (Token JWT inválido ou ausente).  
  * **404 Not Found:** (Usuário não encontrado).  
  * **500 Internal Server Error:** (Erro genérico no servidor).

---

#### **10\. Excluir Conta Imediatamente**

* **Método HTTP:** DELETE  
* **Endpoint Completo:** /Users/me  
* **Descrição:** Exclui permanentemente a conta do usuário. (Nota: Requer lógica de confirmação prévia, como estar desvinculado).  
* **Payload Esperado:** Nenhum.  
* **Estrutura da Response (Sucesso: 200 OK):**  
  JSON  
  {  
    "type": "OK",  
    "message": "Conta excluída com sucesso",  
    "title": "Conta excluída",  
    "status": 200,  
    "data": null,  
    "extendedResultCode": "\#SUCCESS",  
    "date": "2025-11-15T02:19:00Z"  
  }

* **Possíveis Erros (Error Responses):**  
  * **400 Bad Request:** (Ex: "Não é possível excluir conta com relacionamento ativo").  
  * **401 Unauthorized:** (Token JWT inválido ou ausente).  
  * **404 Not Found:** (Usuário não encontrado).  
  * **500 Internal Server Error:** (Erro genérico no servidor).

---

Continuarei documentando os próximos módulos (Relacionamento, Desejos, Memórias, etc.) e os apresentarei em seguida.
````

## File: fluxo_telas_modais.md
````markdown
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
````

## File: lib/core/constants/local_data_keys.dart
````dart
class LocalDataKeys {
  static const String token = 'token_data';

  static const String theme = 'theme';
}
````

## File: lib/core/constants/public_routes.dart
````dart
import 'package:heloilo/features/auth/pages/loading_page.dart';
import 'package:heloilo/features/auth/pages/sign_in_page.dart';
import 'package:heloilo/features/auth/pages/sign_up_page.dart';

bool isPublicRoute(String routeName) {
  final List<String> publicRoutes = [
    SignInPage.routeName,
    SignUpPage.routeName,
    LoadingPage.routeName,
  ];

  return publicRoutes.contains(routeName);
}
````

## File: lib/core/services/dio_service.dart
````dart
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heloilo/features/auth/providers/auth_notifier.dart';
import 'package:logger/logger.dart';

final dioProvider = Provider<Dio>((ref) {
  final Logger logger = Logger();

  final dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['API_URL'] ?? '',
      contentType: Headers.jsonContentType,
      receiveDataWhenStatusError: true,
      responseType: ResponseType.json,
      validateStatus: (status) => status != null,
      connectTimeout: const Duration(seconds: 15),
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        try {
          // Obtém o serviço local de forma assíncrona
          final auth = await ref.read(authProvider.future);

          if (kDebugMode) {
            logger.i(
              'Dio: ${options.path} e token: ${auth?.auth.token ?? "(nulo)"}',
            );
          }

          if (auth != null) {
            options.headers['Authorization'] = 'Bearer ${auth.auth.token}';
          }
        } catch (e, st) {
          if (kDebugMode) {
            logger.i('Erro ao obter token local: $e');
            logger.i(st);
          }
        }

        if (kDebugMode) {
          logger.i('Request Headers: ${options.headers}');
        }

        return handler.next(options);
      },
      onError: (error, handler) {
        if (kDebugMode) {
          logger.i('Dio Error: ${error.message}');
          logger.i('Response: ${error.response}');
        }
        return handler.next(error);
      },
    ),
  );

  return dio;
});
````

## File: lib/core/services/local_data_service.dart
````dart
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Serviço local para armazenamento de dados.
/// - Usa `SharedPreferences` para itens não sensíveis (preferências simples)
/// - Usa `FlutterSecureStorage` para itens sensíveis (tokens, segredos)
/// Fornece providers Riverpod para fácil injeção e testabilidade.

class LocalDataService {
  LocalDataService._internal();
  static late final SharedPreferences prefs;
  static late final FlutterSecureStorage secureStorage;

  static final Logger _logger = Logger();

  static void _logError(String operation, Object error, StackTrace stack) {
    _logger.e('[LocalDataService] $operation', error: error, stackTrace: stack);
  }

  static Future<void> init() async {
    try {
      prefs = await SharedPreferences.getInstance();
      secureStorage = const FlutterSecureStorage();
    } catch (e, st) {
      _logError('init', e, st);
      rethrow;
    }
  }

  // --------------------- SharedPreferences (não sensível) ---------------------
  static Future<bool> setString(String key, String value) async {
    try {
      return await prefs.setString(key, value);
    } catch (e, st) {
      _logError('setString($key)', e, st);
      rethrow;
    }
  }

  static String? getString(String key) {
    try {
      return prefs.getString(key);
    } catch (e, st) {
      _logError('getString($key)', e, st);
      rethrow;
    }
  }

  static Future<bool> setInt(String key, int value) async {
    try {
      return await prefs.setInt(key, value);
    } catch (e, st) {
      _logError('setInt($key)', e, st);
      rethrow;
    }
  }

  static int? getInt(String key) {
    try {
      return prefs.getInt(key);
    } catch (e, st) {
      _logError('getInt($key)', e, st);
      rethrow;
    }
  }

  static Future<bool> setBool(String key, bool value) async {
    try {
      return await prefs.setBool(key, value);
    } catch (e, st) {
      _logError('setBool($key)', e, st);
      rethrow;
    }
  }

  static bool? getBool(String key) {
    try {
      return prefs.getBool(key);
    } catch (e, st) {
      _logError('getBool($key)', e, st);
      rethrow;
    }
  }

  static Future<bool> remove(String key) async {
    try {
      return await prefs.remove(key);
    } catch (e, st) {
      _logError('remove($key)', e, st);
      rethrow;
    }
  }

  static Future<bool> clear() async {
    try {
      return await prefs.clear();
    } catch (e, st) {
      _logError('clear', e, st);
      rethrow;
    }
  }

  // --------------------- FlutterSecureStorage (sensível) ---------------------
  static Future<void> writeSecure(String key, String value) async {
    try {
      await secureStorage.write(key: key, value: value);
    } catch (e, st) {
      _logError('writeSecure($key)', e, st);
      rethrow;
    }
  }

  static Future<String?> readSecure(String key) async {
    try {
      return await secureStorage.read(key: key);
    } catch (e, st) {
      _logError('readSecure($key)', e, st);
      rethrow;
    }
  }

  static Future<void> deleteSecure(String key) async {
    try {
      await secureStorage.delete(key: key);
    } catch (e, st) {
      _logError('deleteSecure($key)', e, st);
      rethrow;
    }
  }

  static Future<void> deleteAllSecure() async {
    try {
      await secureStorage.deleteAll();
    } catch (e, st) {
      _logError('deleteAllSecure', e, st);
      rethrow;
    }
  }
}
````

## File: lib/core/shared/models/api_response.dart
````dart
// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:heloilo/core/shared/models/response_type.dart';

class ApiResponse {
  final ResponseType type;
  final String message;
  final String title;
  final int status;
  final Map<String, dynamic>? data;
  final String extendedResultCode;
  final DateTime date;

  ApiResponse({
    required this.type,
    required this.message,
    required this.title,
    required this.status,
    this.data,
    required this.extendedResultCode,
    required this.date,
  });

  ApiResponse toOkorError() {
    if (type == ResponseType.ok) {
      return this as ApiResponseSuccess;
    } else {
      return this as ApiResponseError;
    }
  }

  ApiResponse copyWith({
    ResponseType? type,
    String? message,
    String? title,
    int? status,
    Map<String, dynamic>? data,
    String? extendedResultCode,
    DateTime? date,
  }) {
    return ApiResponse(
      type: type ?? this.type,
      message: message ?? this.message,
      title: title ?? this.title,
      status: status ?? this.status,
      data: data ?? this.data,
      extendedResultCode: extendedResultCode ?? this.extendedResultCode,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.toString(),
      'message': message,
      'title': title,
      'status': status,
      'data': data,
      'extendedResultCode': extendedResultCode,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    try {
      return ApiResponse(
        type: ResponseType.fromString(map['type'] as String),
        message: map['message'] as String,
        title: map['title'] as String,
        status: map['status'] as int,
        data: map['data'],
        extendedResultCode: map['extendedResultCode'] as String,
        date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      );
    } catch (e) {
      return ApiResponse(
        type: ResponseType.internalError,
        message: "Serviço indisponível",
        title: 'Error',
        status: 500,
        data: null,
        extendedResultCode: '',
        date: DateTime.now(),
      );
    }
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) =>
      ApiResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApiResponse(type: $type, message: $message, title: $title, status: $status, data: $data, extendedResultCode: $extendedResultCode, date: $date)';
  }

  @override
  bool operator ==(covariant ApiResponse other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.message == message &&
        other.title == title &&
        other.status == status &&
        mapEquals(other.data, data) &&
        other.extendedResultCode == extendedResultCode &&
        other.date == date;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        message.hashCode ^
        title.hashCode ^
        status.hashCode ^
        data.hashCode ^
        extendedResultCode.hashCode ^
        date.hashCode;
  }
}

class ApiResponseError extends ApiResponse {
  ApiResponseError({
    required super.type,
    required super.message,
    required super.title,
    required super.status,
    required super.extendedResultCode,
    required super.date,
  });
}

class ApiResponseSuccess extends ApiResponse {
  ApiResponseSuccess({
    required super.type,
    required super.message,
    required super.title,
    required super.status,
    required super.data,
    required super.extendedResultCode,
    required super.date,
  });
}

// 1. Defina sua classe de falha
class AppFailure {
  final String message;
  final String? extendedResultCode;
  AppFailure(this.message, this.extendedResultCode);

  @override
  String toString() => message;
}

// 2. Crie a classe 'Result' selada
sealed class Result<T> {
  /// Retorna true se o resultado for [Failure]
  bool get isFailure => this is Failure<T>;

  /// Retorna true se o resultado for [Success]
  bool get isSuccess => this is Success<T>;

  /// Helper para obter o erro (retorna nulo se for Sucesso)
  AppFailure? get error {
    if (this is Failure<T>) {
      return (this as Failure<T>).error;
    }
    return null;
  }

  /// Helper para obter os dados (retorna nulo se for Falha)
  T? get data {
    if (this is Success<T>) {
      return (this as Success<T>).data;
    }
    return null;
  }
}

// 3. O estado de Sucesso
class Success<T> extends Result<T> {
  @override // <-- ADICIONE ESTA LINHA
  final T data;

  Success(this.data);
}

// 4. O estado de Falha
class Failure<T> extends Result<T> {
  @override
  final AppFailure error;

  Failure(this.error);
}
````

## File: lib/core/shared/models/response_type.dart
````dart
enum ResponseType {
  ok,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  internalError;

  static ResponseType fromString(String value) => ResponseType.values
      .firstWhere((e) => e.toString().split('.').last == value);
}
````

## File: lib/core/themes/app_colors.dart
````dart
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  // Core brand colors
  static const Color primaryLight = Color(0xFFC98A9E); // Rosa Névoa Profunda
  static const Color secondaryLight = Color(0xFF6E5A7A); // Púrpura Chá-Seco
  static const Color tertiaryLight = Color(0xFF7F9A8B); // Verde Sálvia Cinzento
  static const Color accentLight = Color(0xFFC5A36A); // Dourado Areia Quente

  // Backgrounds
  static const Color backgroundLight = Color(
    0xFFF3F1EF,
  ); // Cinza Algodão Suave (quase branco)
  static const Color surfaceLight = Color(0xFFFFFFFF); // Cards claros
  static const Color surfaceElevatedLight = Color(
    0xFFF7F6F5,
  ); // Painéis levemente elevados

  // Borders
  static const Color borderLight = Color(0xFFD6D2CF); // Cinza claro elegante

  // Text
  static const Color textPrimaryLight = Color(
    0xFF2F3A47,
  ); // Azul Neblina Noturna (puxando pra contraste suave)
  static const Color textSecondaryLight = Color(
    0xFF6E5A7A,
  ); // Púrpura seco (menos peso)
  static const Color textHintLight = Color(
    0xFF9C8F99,
  ); // Rosado acinzentado sutil

  // 🌙 DARK THEME — Contraste suave, sem gritaria

  static const Color primaryDark = Color(
    0xFFC98A9E,
  ); // Mantém identidade mesmo no dark
  static const Color secondaryDark = Color(0xFF6E5A7A); // Profundidade
  static const Color tertiaryDark = Color(0xFF7F9A8B); // Equilíbrio
  static const Color accentDark = Color(0xFFC5A36A); // Detalhes dourados sutis

  // Backgrounds
  static const Color backgroundDark = Color(0xFF2F3A47); // Azul Neblina Noturna
  static const Color surfaceDark = Color(0xFF3A4654); // Escuro elevado
  static const Color surfaceElevatedDark = Color(
    0xFF455263,
  ); // Mais contraste para hierarquia

  // Borders
  static const Color borderDark = Color(0xFF596574);

  // Text
  static const Color textPrimaryDark = Color(0xFFF3F1EF); // Claro premium
  static const Color textSecondaryDark = Color(0xFFC8C2C0); // Neutro suave
  static const Color textHintDark = Color(0xFF9EA4A8);

  // Common semantic colors
  static const Color error = Color(0xFFE57373);
  static const Color warning = Color(0xFFFFB74D);
  static const Color success = Color(0xFF81C784);
  static const Color info = Color(0xFF64B5F6);
}
````

## File: lib/core/themes/dark_theme.dart
````dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

final themeDark = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  fontFamily: 'Poppins',
  
  // 🎨 Cores básicas
  primaryColor: AppColors.primaryDark,
  scaffoldBackgroundColor: AppColors.backgroundDark,
  canvasColor: AppColors.backgroundDark,
  dividerColor: AppColors.borderDark,

  // 🌕 AppBar
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.surfaceDark,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: const TextStyle(
      color: AppColors.textPrimaryDark,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(color: AppColors.textPrimaryDark),
  ),

  // 📝 Textos
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: AppColors.textPrimaryDark),
    displayMedium: TextStyle(color: AppColors.textPrimaryDark),
    bodyLarge: TextStyle(color: AppColors.textPrimaryDark, fontSize: 16),
    bodyMedium: TextStyle(color: AppColors.textSecondaryDark, fontSize: 14),
    labelSmall: TextStyle(color: AppColors.textHintDark),
  ),

  // 🧱 Cards e superfícies
  cardTheme: const CardThemeData(
    color: AppColors.surfaceDark,
    elevation: 0,
    margin: EdgeInsets.all(8),
    surfaceTintColor: Colors.transparent,
  ),

  // ⬆️ Superfície elevada (por exemplo, bottom sheets)
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.surfaceDark,
    surfaceTintColor: Colors.transparent,
  ),

  // 🔘 Botões
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.primaryDark),
      foregroundColor: WidgetStateProperty.all(AppColors.textPrimaryDark),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.secondaryDark),
      foregroundColor: WidgetStateProperty.all(AppColors.textPrimaryDark),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(AppColors.primaryDark),
    ),
  ),

  // ✏️ Inputs
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surfaceElevatedDark,
    hintStyle: const TextStyle(color: AppColors.textHintDark),
    labelStyle: const TextStyle(color: AppColors.textSecondaryDark),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.borderDark),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.borderDark),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.primaryDark, width: 1.6),
    ),
  ),

  // 🔄 Switch, checkbox, radio
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith(
      (state) => state.contains(WidgetState.selected)
          ? AppColors.accentDark
          : AppColors.borderDark,
    ),
    trackColor: WidgetStateProperty.resolveWith(
      (state) => state.contains(WidgetState.selected)
          ? AppColors.accentDark.withValues(alpha: 0.4)
          : AppColors.borderDark.withValues(alpha: 0.4),
    ),
  ),

  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(color: AppColors.borderDark, width: 1.4),
    fillColor: WidgetStateProperty.resolveWith(
      (state) => state.contains(WidgetState.selected)
          ? AppColors.accentDark
          : Colors.transparent,
    ),
    checkColor: WidgetStateProperty.all(AppColors.backgroundDark),
  ),

  // 📎 ListTiles
  listTileTheme: const ListTileThemeData(
    iconColor: AppColors.textSecondaryDark,
    textColor: AppColors.textPrimaryDark,
    tileColor: Colors.transparent,
  ),

  // 🧭 NavigationBar / BottomNavigation
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: AppColors.surfaceDark,
    elevation: 1,
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(color: AppColors.textSecondaryDark),
    ),
    iconTheme: WidgetStateProperty.resolveWith(
      (states) => IconThemeData(
        color: states.contains(WidgetState.selected)
            ? AppColors.accentDark
            : AppColors.textSecondaryDark,
      ),
    ),
  ),

  // 🔘 Floating Action Button
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.accentDark,
    foregroundColor: AppColors.textPrimaryDark,
  ),

  // 🧭 Drawer
  drawerTheme: const DrawerThemeData(backgroundColor: AppColors.surfaceDark),

  // 📌 Tooltip
  tooltipTheme: const TooltipThemeData(
    decoration: BoxDecoration(
      color: AppColors.surfaceElevatedDark,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    textStyle: TextStyle(color: AppColors.textPrimaryDark),
  ),

  // 🎚 Sliders
  sliderTheme: const SliderThemeData(
    thumbColor: AppColors.accentDark,
    activeTrackColor: AppColors.accentDark,
    inactiveTrackColor: AppColors.borderDark,
  ),
);
````

## File: lib/core/themes/light_theme.dart
````dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

final themeLight = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  fontFamily: 'Poppins',

  // 🎨 Cores básicas
  primaryColor: AppColors.primaryLight,
  scaffoldBackgroundColor: AppColors.backgroundLight,
  canvasColor: AppColors.backgroundLight,
  dividerColor: AppColors.borderLight,

  // ☀️ AppBar
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.surfaceLight,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: const TextStyle(
      color: AppColors.textPrimaryLight,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(color: AppColors.textPrimaryLight),
  ),

  // 📝 Textos
  textTheme: const TextTheme(

    displayLarge: TextStyle(color: AppColors.textPrimaryLight),
    displayMedium: TextStyle(color: AppColors.textPrimaryLight),
    bodyLarge: TextStyle(color: AppColors.textPrimaryLight, fontSize: 16),
    bodyMedium: TextStyle(color: AppColors.textSecondaryLight, fontSize: 14),
    labelSmall: TextStyle(color: AppColors.textHintLight),
  ),

  // 🧱 Cards e superfícies
  cardTheme: const CardThemeData(
    color: AppColors.surfaceLight,
    elevation: 0,
    margin: EdgeInsets.all(8),
    surfaceTintColor: Colors.transparent,
  ),

  // ⬆️ Superfície elevada (ex: bottom sheet)
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.surfaceLight,
    surfaceTintColor: Colors.transparent,
  ),

  // 🔘 Botões
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.primaryLight),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.secondaryLight),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(AppColors.primaryLight),
    ),
  ),

  // ✏️ Inputs
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surfaceElevatedLight,
    hintStyle: const TextStyle(color: AppColors.textHintLight),
    labelStyle: const TextStyle(color: AppColors.textSecondaryLight),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.borderLight),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.borderLight),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.primaryLight, width: 1.6),
    ),
  ),

  // 🔄 Switch, checkbox, radio
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith(
      (state) => state.contains(WidgetState.selected)
          ? AppColors.accentLight
          : AppColors.borderLight,
    ),
    trackColor: WidgetStateProperty.resolveWith(
      (state) => state.contains(WidgetState.selected)
          ? AppColors.accentLight.withValues(alpha: 0.4)
          : AppColors.borderLight.withValues(alpha: 0.4),
    ),
  ),

  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(color: AppColors.borderLight, width: 1.4),
    fillColor: WidgetStateProperty.resolveWith(
      (state) => state.contains(WidgetState.selected)
          ? AppColors.accentLight
          : Colors.transparent,
    ),
    checkColor: WidgetStateProperty.all(Colors.white),
  ),

  // 📎 ListTiles
  listTileTheme: const ListTileThemeData(
    iconColor: AppColors.textSecondaryLight,
    textColor: AppColors.textPrimaryLight,
    tileColor: Colors.transparent,
  ),

  // 🧭 NavigationBar / BottomNavigation
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: AppColors.surfaceLight,
    elevation: 1,
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(color: AppColors.textSecondaryLight),
    ),
    iconTheme: WidgetStateProperty.resolveWith(
      (states) => IconThemeData(
        color: states.contains(WidgetState.selected)
            ? AppColors.accentLight
            : AppColors.textSecondaryLight,
      ),
    ),
  ),

  // 🔘 Floating Action Button
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.accentLight,
    foregroundColor: Colors.white,
  ),

  // 🧭 Drawer
  drawerTheme: const DrawerThemeData(
    backgroundColor: AppColors.surfaceLight,
  ),

  // 📌 Tooltip
  tooltipTheme: const TooltipThemeData(
    decoration: BoxDecoration(
      color: AppColors.surfaceElevatedLight,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    textStyle: TextStyle(color: AppColors.textPrimaryLight),
  ),

  // 🎚 Sliders
  sliderTheme: const SliderThemeData(
    thumbColor: AppColors.accentLight,
    activeTrackColor: AppColors.accentLight,
    inactiveTrackColor: AppColors.borderLight,
  ),

  
);
````

## File: lib/core/themes/theme_notifier.dart
````dart
// 🌀 ThemeNotifier usando Riverpod
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heloilo/core/constants/local_data_keys.dart';
import 'package:heloilo/core/services/local_data_service.dart';

class ThemeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    final theme = LocalDataService.getString(LocalDataKeys.theme);

    if (theme != null) {
      return theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }

    // Tema inicial pode vir de storage
    return ThemeMode.light;
  }

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    LocalDataService.setString(LocalDataKeys.theme, state.name);
  }

  void setLight() => state = ThemeMode.light;
  void setDark() => state = ThemeMode.dark;
}

// 🔗 Provider
final themeNotifierProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  () => ThemeNotifier(),
);
````

## File: lib/data/models/auth.dart
````dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Auth {
  String token;
  String refreshToken;
  DateTime expiresAt;

  Auth({
    required this.token,
    required this.refreshToken,
    required this.expiresAt,
  });

  Auth copyWith({String? token, String? refreshToken, DateTime? expiresAt}) {
    return Auth(
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'refreshToken': refreshToken,
      'expiresAt': expiresAt.toIso8601String(),
    };
  }

  factory Auth.fromMap(Map<String, dynamic> map) {
    return Auth(
      token: map['token'] as String,
      refreshToken: map['refreshToken'] as String,
      expiresAt: DateTime.parse(map['expiresAt'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Auth.fromJson(String source) =>
      Auth.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Auth(token: $token, refreshToken: $refreshToken, expiresAt: $expiresAt)';

  @override
  bool operator ==(covariant Auth other) {
    if (identical(this, other)) return true;

    return other.token == token &&
        other.refreshToken == refreshToken &&
        other.expiresAt == expiresAt;
  }

  @override
  int get hashCode =>
      token.hashCode ^ refreshToken.hashCode ^ expiresAt.hashCode;
}
````

## File: lib/data/models/user.dart
````dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final int id;
  final String email;
  final String name;
  final String nickname;
  final String? themeColor;
  final bool hasRelationship;
  final bool hasProfilePhoto;
  final DateTime createdAt;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.nickname,
    this.themeColor,
    this.hasRelationship = false,
    this.hasProfilePhoto = false,
    required this.createdAt,
  });

  User copyWith({
    int? id,
    String? email,
    String? name,
    String? nickname,
    String? themeColor,
    bool? hasRelationship,
    bool? hasProfilePhoto,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      nickname: nickname ?? this.nickname,
      themeColor: themeColor ?? this.themeColor,
      hasRelationship: hasRelationship ?? this.hasRelationship,
      hasProfilePhoto: hasProfilePhoto ?? this.hasProfilePhoto,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'nickname': nickname,
      'themeColor': themeColor,
      'hasRelationship': hasRelationship,
      'hasProfilePhoto': hasProfilePhoto,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      email: map['email'] as String,
      name: map['name'] as String,
      nickname: map['nickname'] as String,
      themeColor: map['themeColor'] != null
          ? map['themeColor'] as String
          : null,
      hasRelationship: map['hasRelationship'] as bool? ?? false,
      hasProfilePhoto: map['hasProfilePhoto'] as bool? ?? false,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name, nickname: $nickname, themeColor: $themeColor, hasRelationship: $hasRelationship, hasProfilePhoto: $hasProfilePhoto, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.name == name &&
        other.nickname == nickname &&
        other.themeColor == themeColor &&
        other.hasRelationship == hasRelationship &&
        other.hasProfilePhoto == hasProfilePhoto &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        nickname.hashCode ^
        themeColor.hashCode ^
        hasRelationship.hashCode ^
        hasProfilePhoto.hashCode ^
        createdAt.hashCode;
  }
}
````

## File: lib/features/app.dart
````dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:heloilo/core/constants/public_routes.dart';
import 'package:heloilo/core/themes/dark_theme.dart';
import 'package:heloilo/core/themes/light_theme.dart';
import 'package:heloilo/core/themes/theme_notifier.dart';
import 'package:heloilo/features/auth/pages/loading_page.dart';
import 'package:heloilo/features/auth/pages/sign_in_page.dart';
import 'package:heloilo/features/auth/pages/sign_up_page.dart';
import 'package:heloilo/features/auth/providers/auth_notifier.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeNotifierProvider);

    final router = ref.watch(_routerProvider);

    return MaterialApp.router(
      routerConfig: router,

      themeMode: themeNotifier,
      theme: themeLight,
      darkTheme: themeDark,
    );
  }
}

final _routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    redirect: (context, state) {
      if (authState.isLoading) {
        return LoadingPage.routeName;
      }

      if (isPublicRoute(state.path ?? "")) return null;

      final isAuthenticated = authState.value != null;

      if (!isAuthenticated) return SignInPage.routeName;

      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: LoadingPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const LoadingPage();
        },
      ),
      GoRoute(
        path: SignInPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const SignInPage();
        },
      ),
      GoRoute(
        path: SignUpPage.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpPage();
        },
      ),
    ],
  );
});
````

## File: lib/features/auth/pages/loading_page.dart
````dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingPage extends ConsumerWidget {
  static const routeName = '/';

  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
````

## File: lib/features/auth/pages/sign_in_page.dart
````dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPage extends ConsumerStatefulWidget {

  static const routeName = '/sign-in';
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
````

## File: lib/features/auth/pages/sign_up_page.dart
````dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerStatefulWidget {
  static const routeName = '/sign-up';

  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
````

## File: lib/features/auth/providers/auth_notifier.dart
````dart
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heloilo/core/constants/local_data_keys.dart';
import 'package:heloilo/core/services/local_data_service.dart';
import 'package:heloilo/data/models/auth.dart';
import 'package:heloilo/data/models/user.dart';
import 'package:heloilo/features/auth/services/dtos/auth_dtos.dart';

class AuthNotifier extends AsyncNotifier<AuthState?> {
  @override
  FutureOr<AuthState?> build() async {
    state = const AsyncLoading();

    await Future.delayed(const Duration(seconds: 5));

    final tokenData = await LocalDataService.readSecure(LocalDataKeys.token);

    if (tokenData == null) return null;

    return AuthState(auth: Auth.fromJson(tokenData));
  }

  Future<void> authSucceeded(AuthResponseDto dto) async {
    state = AsyncValue.data(AuthState(auth: dto.auth, user: dto.user));
  }

  Future<void> logout() async {
    await LocalDataService.deleteSecure('token');
    state = AsyncValue.data(null);
  }
}

final authProvider = AsyncNotifierProvider<AuthNotifier, AuthState?>(
  () => AuthNotifier(),
);

class AuthState {
  final Auth auth;
  final User? user;
  AuthState({required this.auth, this.user});
}
````

## File: lib/features/auth/providers/sign_in_notifier.dart
````dart
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heloilo/features/auth/providers/auth_notifier.dart';
import 'package:heloilo/features/auth/services/auth_service.dart';
import 'package:heloilo/features/auth/services/dtos/auth_dtos.dart';

class SignInNotifier extends AsyncNotifier<SignInState> {
  @override
  FutureOr<SignInState> build() {
    return SignInState();
  }

  Future<void> signIn(SignInDto dto) async {
    state = const AsyncValue.loading();

    try {
      // 1. Chama o Serviço de Autenticação
      // 2. Recebe o Token
      final result = await ref.read(authServiceProvider).signin(dto);

      if (result.isFailure) {
        state = AsyncData(SignInState(message: result.error!.message));
        return;
      }

      state = AsyncData(
        SignInState(sucess: true, message: 'Login realizado com sucesso'),
      );

      // 3. SUCESSO! Delega para o "Porteiro" (Global)
      await ref.read(authProvider.notifier).authSucceeded(result.data!);

      // O LoginNotifier nem precisa tirar o loading,
      // porque a tela inteira vai ser substituída pela HomeScreen.
    } catch (e) {
      state = AsyncData(SignInState(sucess: false, message: "Falha no login"));
    }
  }
}

final signInProvider = AsyncNotifierProvider<SignInNotifier, SignInState>(() {
  return SignInNotifier();
});

class SignInState {
  final bool sucess;
  final String message;

  SignInState({this.sucess = false, this.message = ''});

  SignInState copyWith({bool? sucess, String? message}) {
    return SignInState(
      sucess: sucess ?? this.sucess,
      message: message ?? this.message,
    );
  }
}
````

## File: lib/features/auth/providers/sign_up_notifier.dart
````dart
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heloilo/features/auth/providers/auth_notifier.dart';
import 'package:heloilo/features/auth/services/auth_service.dart';
import 'package:heloilo/features/auth/services/dtos/auth_dtos.dart';

class SignUpNotifier extends AsyncNotifier<SignUpState> {
  @override
  FutureOr<SignUpState> build() {
    return SignUpState();
  }

  Future<void> signIn(SignUpDto dto) async {
    state = const AsyncValue.loading();

    try {
      // 1. Chama o Serviço de Autenticação
      // 2. Recebe o Token
      final result = await ref.read(authServiceProvider).signup(dto);

      if (result.isFailure) {
        state = AsyncData(SignUpState(message: result.error!.message));
        return;
      }

      state = AsyncData(
        SignUpState(sucess: true, message: 'Cadastro realizado com sucesso!'),
      );

      // 3. SUCESSO! Delega para o "Porteiro" (Global)
      await ref.read(authProvider.notifier).authSucceeded(result.data!);

      // O LoginNotifier nem precisa tirar o loading,
      // porque a tela inteira vai ser substituída pela HomeScreen.
    } catch (e) {
      state = AsyncData(
        SignUpState(sucess: false, message: "Falha no cadastro"),
      );
    }
  }
}

final signUpProvider = AsyncNotifierProvider<SignUpNotifier, SignUpState>(() {
  return SignUpNotifier();
});

class SignUpState {
  final bool sucess;
  final String message;

  SignUpState({this.sucess = false, this.message = ''});

  SignUpState copyWith({bool? sucess, String? message}) {
    return SignUpState(
      sucess: sucess ?? this.sucess,
      message: message ?? this.message,
    );
  }
}
````

## File: lib/features/auth/services/auth_service.dart
````dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heloilo/core/services/dio_service.dart';
import 'package:heloilo/core/services/local_data_service.dart';
import 'package:heloilo/core/shared/models/api_response.dart';
import 'package:heloilo/features/auth/services/dtos/auth_dtos.dart';

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  Future<Result<AuthResponseDto>> signin(SignInDto dto) async {
    final response = await _dio.post('/auth/login', data: dto.toMap());

    final apiResponse = ApiResponse.fromMap(response.data).toOkorError();

    if (apiResponse is ApiResponseSuccess) {
      final authDto = AuthResponseDto.fromResponse(apiResponse.data!);

      await LocalDataService.writeSecure('token', authDto.auth.token);

      return Success(authDto);
    }

    return Failure(
      AppFailure(apiResponse.message, apiResponse.extendedResultCode),
    );
  }

  Future<Result<AuthResponseDto>> signup(SignUpDto dto) async {
    final response = await _dio.post('/auth/register', data: dto.toMap());

    final apiResponse = ApiResponse.fromMap(response.data).toOkorError();

    if (apiResponse is ApiResponseSuccess) {
      final authDto = AuthResponseDto.fromResponse(apiResponse.data!);

      await LocalDataService.writeSecure('token', authDto.auth.token);

      return Success(authDto);
    }

    return Failure(
      AppFailure(apiResponse.message, apiResponse.extendedResultCode),
    );
  }

  // outros métodos, como logout, refresh token, etc.
}

final authServiceProvider = Provider<AuthService>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthService(dio);
});
````

## File: lib/features/auth/services/dtos/auth_dtos.dart
````dart
import 'package:heloilo/data/models/auth.dart';
import 'package:heloilo/data/models/user.dart';

class SignInDto {
  final String email;
  final String password;

  SignInDto({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class SignUpDto {
  final String email;
  final String password;
  final String name;
  final String nickname;

  SignUpDto({required this.email, required this.password, required this.name, required this.nickname});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'nickname': nickname,
    };
  }
}

class AuthResponseDto {
  final User user;
  final Auth auth;

  AuthResponseDto({required this.user, required this.auth});

  factory AuthResponseDto.fromResponse(Map<String, dynamic> map) {
    return AuthResponseDto(
      user: User.fromJson(map['user']),
      auth: Auth.fromMap(map),
    );
  }
}
````

## File: .gitignore
````
# Miscellaneous
*.class
*.log
*.pyc
*.swp
.DS_Store
.atom/
.build/
.buildlog/
.history
.svn/
.swiftpm/
migrate_working_dir/

# IntelliJ related
*.iml
*.ipr
*.iws
.idea/

# The .vscode folder contains launch configuration and tasks you configure in
# VS Code which you may wish to be included in version control, so this line
# is commented out by default.
#.vscode/

# Flutter/Dart/Pub related
**/doc/api/
**/ios/Flutter/.last_build_id
.dart_tool/
.flutter-plugins-dependencies
.pub-cache/
.pub/
/build/
/coverage/

# Symbolication related
app.*.symbols

# Obfuscation related
app.*.map.json

# Android Studio will place build artifacts here
/android/app/debug
/android/app/profile
/android/app/release
````

## File: .metadata
````
# This file tracks properties of this Flutter project.
# Used by Flutter tool to assess capabilities and perform upgrades etc.
#
# This file should be version controlled and should not be manually edited.

version:
  revision: "9f455d2486bcb28cad87b062475f42edc959f636"
  channel: "stable"

project_type: app

# Tracks metadata for the flutter migrate command
migration:
  platforms:
    - platform: root
      create_revision: 9f455d2486bcb28cad87b062475f42edc959f636
      base_revision: 9f455d2486bcb28cad87b062475f42edc959f636
    - platform: web
      create_revision: 9f455d2486bcb28cad87b062475f42edc959f636
      base_revision: 9f455d2486bcb28cad87b062475f42edc959f636

  # User provided section

  # List of Local paths (relative to this file) that should be
  # ignored by the migrate tool.
  #
  # Files that are not part of the templates will be ignored by default.
  unmanaged_files:
    - 'lib/main.dart'
    - 'ios/Runner.xcodeproj/project.pbxproj'
````

## File: analysis_options.yaml
````yaml
# This file configures the analyzer, which statically analyzes Dart code to
# check for errors, warnings, and lints.
#
# The issues identified by the analyzer are surfaced in the UI of Dart-enabled
# IDEs (https://dart.dev/tools#ides-and-editors). The analyzer can also be
# invoked from the command line by running `flutter analyze`.

# The following line activates a set of recommended lints for Flutter apps,
# packages, and plugins designed to encourage good coding practices.
include: package:flutter_lints/flutter.yaml

linter:
  # The lint rules applied to this project can be customized in the
  # section below to disable rules from the `package:flutter_lints/flutter.yaml`
  # included above or to enable additional rules. A list of all available lints
  # and their documentation is published at https://dart.dev/lints.
  #
  # Instead of disabling a lint rule for the entire project in the
  # section below, it can also be suppressed for a single line of code
  # or a specific dart file by using the `// ignore: name_of_lint` and
  # `// ignore_for_file: name_of_lint` syntax on the line or in the file
  # producing the lint.
  rules:
    # avoid_print: false  # Uncomment to disable the `avoid_print` rule
    # prefer_single_quotes: true  # Uncomment to enable the `prefer_single_quotes` rule

# Additional information about this file can be found at
# https://dart.dev/guides/language/analysis-options
````

## File: lib/main.dart
````dart
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heloilo/core/services/local_data_service.dart';
import 'package:heloilo/features/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await LocalDataService.init();

  runApp(const ProviderScope(child: App()));
}
````

## File: README.md
````markdown
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
````

## File: web/index.html
````html
<!DOCTYPE html>
<html>
<head>
  <!--
    If you are serving your web app in a path other than the root, change the
    href value below to reflect the base path you are serving from.

    The path provided below has to start and end with a slash "/" in order for
    it to work correctly.

    For more details:
    * https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base

    This is a placeholder for base href that will be replaced by the value of
    the `--base-href` argument provided to `flutter build`.
  -->
  <base href="$FLUTTER_BASE_HREF">

  <meta charset="UTF-8">
  <meta content="IE=Edge" http-equiv="X-UA-Compatible">
  <meta name="description" content="A new Flutter project.">

  <!-- iOS meta tags & icons -->
  <meta name="mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="heloilo_frontend">
  <link rel="apple-touch-icon" href="icons/Icon-192.png">

  <!-- Favicon -->
  <link rel="icon" type="image/png" href="favicon.png"/>

  <title>heloilo_frontend</title>
  <link rel="manifest" href="manifest.json">
</head>
<body>
  <script src="flutter_bootstrap.js" async></script>
</body>
</html>
````

## File: web/manifest.json
````json
{
    "name": "heloilo_frontend",
    "short_name": "heloilo_frontend",
    "start_url": ".",
    "display": "standalone",
    "background_color": "#0175C2",
    "theme_color": "#0175C2",
    "description": "A new Flutter project.",
    "orientation": "portrait-primary",
    "prefer_related_applications": false,
    "icons": [
        {
            "src": "icons/Icon-192.png",
            "sizes": "192x192",
            "type": "image/png"
        },
        {
            "src": "icons/Icon-512.png",
            "sizes": "512x512",
            "type": "image/png"
        },
        {
            "src": "icons/Icon-maskable-192.png",
            "sizes": "192x192",
            "type": "image/png",
            "purpose": "maskable"
        },
        {
            "src": "icons/Icon-maskable-512.png",
            "sizes": "512x512",
            "type": "image/png",
            "purpose": "maskable"
        }
    ]
}
````

## File: pubspec.lock
````
# Generated by pub
# See https://dart.dev/tools/pub/glossary#lockfile
packages:
  _fe_analyzer_shared:
    dependency: transitive
    description:
      name: _fe_analyzer_shared
      sha256: da0d9209ca76bde579f2da330aeb9df62b6319c834fa7baae052021b0462401f
      url: "https://pub.dev"
    source: hosted
    version: "85.0.0"
  analyzer:
    dependency: transitive
    description:
      name: analyzer
      sha256: "974859dc0ff5f37bc4313244b3218c791810d03ab3470a579580279ba971a48d"
      url: "https://pub.dev"
    source: hosted
    version: "7.7.1"
  args:
    dependency: transitive
    description:
      name: args
      sha256: d0481093c50b1da8910eb0bb301626d4d8eb7284aa739614d2b394ee09e3ea04
      url: "https://pub.dev"
    source: hosted
    version: "2.7.0"
  async:
    dependency: transitive
    description:
      name: async
      sha256: "758e6d74e971c3e5aceb4110bfd6698efc7f501675bcfe0c775459a8140750eb"
      url: "https://pub.dev"
    source: hosted
    version: "2.13.0"
  boolean_selector:
    dependency: transitive
    description:
      name: boolean_selector
      sha256: "8aab1771e1243a5063b8b0ff68042d67334e3feab9e95b9490f9a6ebf73b42ea"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.2"
  characters:
    dependency: transitive
    description:
      name: characters
      sha256: f71061c654a3380576a52b451dd5532377954cf9dbd272a78fc8479606670803
      url: "https://pub.dev"
    source: hosted
    version: "1.4.0"
  cli_config:
    dependency: transitive
    description:
      name: cli_config
      sha256: ac20a183a07002b700f0c25e61b7ee46b23c309d76ab7b7640a028f18e4d99ec
      url: "https://pub.dev"
    source: hosted
    version: "0.2.0"
  clock:
    dependency: transitive
    description:
      name: clock
      sha256: fddb70d9b5277016c77a80201021d40a2247104d9f4aa7bab7157b7e3f05b84b
      url: "https://pub.dev"
    source: hosted
    version: "1.1.2"
  collection:
    dependency: transitive
    description:
      name: collection
      sha256: "2f5709ae4d3d59dd8f7cd309b4e023046b57d8a6c82130785d2b0e5868084e76"
      url: "https://pub.dev"
    source: hosted
    version: "1.19.1"
  convert:
    dependency: transitive
    description:
      name: convert
      sha256: b30acd5944035672bc15c6b7a8b47d773e41e2f17de064350988c5d02adb1c68
      url: "https://pub.dev"
    source: hosted
    version: "3.1.2"
  coverage:
    dependency: transitive
    description:
      name: coverage
      sha256: "5da775aa218eaf2151c721b16c01c7676fbfdd99cebba2bf64e8b807a28ff94d"
      url: "https://pub.dev"
    source: hosted
    version: "1.15.0"
  crypto:
    dependency: transitive
    description:
      name: crypto
      sha256: "1e445881f28f22d6140f181e07737b22f1e099a5e1ff94b0af2f9e4a463f4855"
      url: "https://pub.dev"
    source: hosted
    version: "3.0.6"
  cupertino_icons:
    dependency: "direct main"
    description:
      name: cupertino_icons
      sha256: ba631d1c7f7bef6b729a622b7b752645a2d076dba9976925b8f25725a30e1ee6
      url: "https://pub.dev"
    source: hosted
    version: "1.0.8"
  dio:
    dependency: "direct main"
    description:
      name: dio
      sha256: d90ee57923d1828ac14e492ca49440f65477f4bb1263575900be731a3dac66a9
      url: "https://pub.dev"
    source: hosted
    version: "5.9.0"
  dio_web_adapter:
    dependency: transitive
    description:
      name: dio_web_adapter
      sha256: "7586e476d70caecaf1686d21eee7247ea43ef5c345eab9e0cc3583ff13378d78"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.1"
  fake_async:
    dependency: transitive
    description:
      name: fake_async
      sha256: "5368f224a74523e8d2e7399ea1638b37aecfca824a3cc4dfdf77bf1fa905ac44"
      url: "https://pub.dev"
    source: hosted
    version: "1.3.3"
  ffi:
    dependency: transitive
    description:
      name: ffi
      sha256: "289279317b4b16eb2bb7e271abccd4bf84ec9bdcbe999e278a94b804f5630418"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.4"
  file:
    dependency: transitive
    description:
      name: file
      sha256: a3b4f84adafef897088c160faf7dfffb7696046cb13ae90b508c2cbc95d3b8d4
      url: "https://pub.dev"
    source: hosted
    version: "7.0.1"
  fixnum:
    dependency: transitive
    description:
      name: fixnum
      sha256: b6dc7065e46c974bc7c5f143080a6764ec7a4be6da1285ececdc37be96de53be
      url: "https://pub.dev"
    source: hosted
    version: "1.1.1"
  flutter:
    dependency: "direct main"
    description: flutter
    source: sdk
    version: "0.0.0"
  flutter_dotenv:
    dependency: "direct main"
    description:
      name: flutter_dotenv
      sha256: d4130c4a43e0b13fefc593bc3961f2cb46e30cb79e253d4a526b1b5d24ae1ce4
      url: "https://pub.dev"
    source: hosted
    version: "6.0.0"
  flutter_lints:
    dependency: "direct dev"
    description:
      name: flutter_lints
      sha256: "3105dc8492f6183fb076ccf1f351ac3d60564bff92e20bfc4af9cc1651f4e7e1"
      url: "https://pub.dev"
    source: hosted
    version: "6.0.0"
  flutter_riverpod:
    dependency: "direct main"
    description:
      name: flutter_riverpod
      sha256: "9e2d6907f12cc7d23a846847615941bddee8709bf2bfd274acdf5e80bcf22fde"
      url: "https://pub.dev"
    source: hosted
    version: "3.0.3"
  flutter_secure_storage:
    dependency: "direct main"
    description:
      name: flutter_secure_storage
      sha256: "9cad52d75ebc511adfae3d447d5d13da15a55a92c9410e50f67335b6d21d16ea"
      url: "https://pub.dev"
    source: hosted
    version: "9.2.4"
  flutter_secure_storage_linux:
    dependency: transitive
    description:
      name: flutter_secure_storage_linux
      sha256: be76c1d24a97d0b98f8b54bce6b481a380a6590df992d0098f868ad54dc8f688
      url: "https://pub.dev"
    source: hosted
    version: "1.2.3"
  flutter_secure_storage_macos:
    dependency: transitive
    description:
      name: flutter_secure_storage_macos
      sha256: "6c0a2795a2d1de26ae202a0d78527d163f4acbb11cde4c75c670f3a0fc064247"
      url: "https://pub.dev"
    source: hosted
    version: "3.1.3"
  flutter_secure_storage_platform_interface:
    dependency: transitive
    description:
      name: flutter_secure_storage_platform_interface
      sha256: cf91ad32ce5adef6fba4d736a542baca9daf3beac4db2d04be350b87f69ac4a8
      url: "https://pub.dev"
    source: hosted
    version: "1.1.2"
  flutter_secure_storage_web:
    dependency: transitive
    description:
      name: flutter_secure_storage_web
      sha256: f4ebff989b4f07b2656fb16b47852c0aab9fed9b4ec1c70103368337bc1886a9
      url: "https://pub.dev"
    source: hosted
    version: "1.2.1"
  flutter_secure_storage_windows:
    dependency: transitive
    description:
      name: flutter_secure_storage_windows
      sha256: b20b07cb5ed4ed74fc567b78a72936203f587eba460af1df11281c9326cd3709
      url: "https://pub.dev"
    source: hosted
    version: "3.1.2"
  flutter_test:
    dependency: "direct dev"
    description: flutter
    source: sdk
    version: "0.0.0"
  flutter_web_plugins:
    dependency: transitive
    description: flutter
    source: sdk
    version: "0.0.0"
  frontend_server_client:
    dependency: transitive
    description:
      name: frontend_server_client
      sha256: f64a0333a82f30b0cca061bc3d143813a486dc086b574bfb233b7c1372427694
      url: "https://pub.dev"
    source: hosted
    version: "4.0.0"
  glob:
    dependency: transitive
    description:
      name: glob
      sha256: c3f1ee72c96f8f78935e18aa8cecced9ab132419e8625dc187e1c2408efc20de
      url: "https://pub.dev"
    source: hosted
    version: "2.1.3"
  go_router:
    dependency: "direct main"
    description:
      name: go_router
      sha256: c92d18e1fe994cb06d48aa786c46b142a5633067e8297cff6b5a3ac742620104
      url: "https://pub.dev"
    source: hosted
    version: "17.0.0"
  http:
    dependency: transitive
    description:
      name: http
      sha256: "87721a4a50b19c7f1d49001e51409bddc46303966ce89a65af4f4e6004896412"
      url: "https://pub.dev"
    source: hosted
    version: "1.6.0"
  http_multi_server:
    dependency: transitive
    description:
      name: http_multi_server
      sha256: aa6199f908078bb1c5efb8d8638d4ae191aac11b311132c3ef48ce352fb52ef8
      url: "https://pub.dev"
    source: hosted
    version: "3.2.2"
  http_parser:
    dependency: transitive
    description:
      name: http_parser
      sha256: "178d74305e7866013777bab2c3d8726205dc5a4dd935297175b19a23a2e66571"
      url: "https://pub.dev"
    source: hosted
    version: "4.1.2"
  io:
    dependency: transitive
    description:
      name: io
      sha256: dfd5a80599cf0165756e3181807ed3e77daf6dd4137caaad72d0b7931597650b
      url: "https://pub.dev"
    source: hosted
    version: "1.0.5"
  js:
    dependency: transitive
    description:
      name: js
      sha256: f2c445dce49627136094980615a031419f7f3eb393237e4ecd97ac15dea343f3
      url: "https://pub.dev"
    source: hosted
    version: "0.6.7"
  leak_tracker:
    dependency: transitive
    description:
      name: leak_tracker
      sha256: "33e2e26bdd85a0112ec15400c8cbffea70d0f9c3407491f672a2fad47915e2de"
      url: "https://pub.dev"
    source: hosted
    version: "11.0.2"
  leak_tracker_flutter_testing:
    dependency: transitive
    description:
      name: leak_tracker_flutter_testing
      sha256: "1dbc140bb5a23c75ea9c4811222756104fbcd1a27173f0c34ca01e16bea473c1"
      url: "https://pub.dev"
    source: hosted
    version: "3.0.10"
  leak_tracker_testing:
    dependency: transitive
    description:
      name: leak_tracker_testing
      sha256: "8d5a2d49f4a66b49744b23b018848400d23e54caf9463f4eb20df3eb8acb2eb1"
      url: "https://pub.dev"
    source: hosted
    version: "3.0.2"
  lints:
    dependency: transitive
    description:
      name: lints
      sha256: a5e2b223cb7c9c8efdc663ef484fdd95bb243bff242ef5b13e26883547fce9a0
      url: "https://pub.dev"
    source: hosted
    version: "6.0.0"
  logger:
    dependency: "direct main"
    description:
      name: logger
      sha256: a7967e31b703831a893bbc3c3dd11db08126fe5f369b5c648a36f821979f5be3
      url: "https://pub.dev"
    source: hosted
    version: "2.6.2"
  logging:
    dependency: transitive
    description:
      name: logging
      sha256: c8245ada5f1717ed44271ed1c26b8ce85ca3228fd2ffdb75468ab01979309d61
      url: "https://pub.dev"
    source: hosted
    version: "1.3.0"
  matcher:
    dependency: transitive
    description:
      name: matcher
      sha256: dc58c723c3c24bf8d3e2d3ad3f2f9d7bd9cf43ec6feaa64181775e60190153f2
      url: "https://pub.dev"
    source: hosted
    version: "0.12.17"
  material_color_utilities:
    dependency: transitive
    description:
      name: material_color_utilities
      sha256: f7142bb1154231d7ea5f96bc7bde4bda2a0945d2806bb11670e30b850d56bdec
      url: "https://pub.dev"
    source: hosted
    version: "0.11.1"
  message_pack_dart:
    dependency: transitive
    description:
      name: message_pack_dart
      sha256: "71b9f0ff60e5896e60b337960bb535380d7dba3297b457ac763ccae807385b59"
      url: "https://pub.dev"
    source: hosted
    version: "2.0.1"
  meta:
    dependency: transitive
    description:
      name: meta
      sha256: e3641ec5d63ebf0d9b41bd43201a66e3fc79a65db5f61fc181f04cd27aab950c
      url: "https://pub.dev"
    source: hosted
    version: "1.16.0"
  mime:
    dependency: transitive
    description:
      name: mime
      sha256: "41a20518f0cb1256669420fdba0cd90d21561e560ac240f26ef8322e45bb7ed6"
      url: "https://pub.dev"
    source: hosted
    version: "2.0.0"
  node_preamble:
    dependency: transitive
    description:
      name: node_preamble
      sha256: "6e7eac89047ab8a8d26cf16127b5ed26de65209847630400f9aefd7cd5c730db"
      url: "https://pub.dev"
    source: hosted
    version: "2.0.2"
  package_config:
    dependency: transitive
    description:
      name: package_config
      sha256: f096c55ebb7deb7e384101542bfba8c52696c1b56fca2eb62827989ef2353bbc
      url: "https://pub.dev"
    source: hosted
    version: "2.2.0"
  path:
    dependency: transitive
    description:
      name: path
      sha256: "75cca69d1490965be98c73ceaea117e8a04dd21217b37b292c9ddbec0d955bc5"
      url: "https://pub.dev"
    source: hosted
    version: "1.9.1"
  path_provider:
    dependency: transitive
    description:
      name: path_provider
      sha256: "50c5dd5b6e1aaf6fb3a78b33f6aa3afca52bf903a8a5298f53101fdaee55bbcd"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.5"
  path_provider_android:
    dependency: transitive
    description:
      name: path_provider_android
      sha256: e122c5ea805bb6773bb12ce667611265980940145be920cd09a4b0ec0285cb16
      url: "https://pub.dev"
    source: hosted
    version: "2.2.20"
  path_provider_foundation:
    dependency: transitive
    description:
      name: path_provider_foundation
      sha256: efaec349ddfc181528345c56f8eda9d6cccd71c177511b132c6a0ddaefaa2738
      url: "https://pub.dev"
    source: hosted
    version: "2.4.3"
  path_provider_linux:
    dependency: transitive
    description:
      name: path_provider_linux
      sha256: f7a1fe3a634fe7734c8d3f2766ad746ae2a2884abe22e241a8b301bf5cac3279
      url: "https://pub.dev"
    source: hosted
    version: "2.2.1"
  path_provider_platform_interface:
    dependency: transitive
    description:
      name: path_provider_platform_interface
      sha256: "88f5779f72ba699763fa3a3b06aa4bf6de76c8e5de842cf6f29e2e06476c2334"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.2"
  path_provider_windows:
    dependency: transitive
    description:
      name: path_provider_windows
      sha256: bd6f00dbd873bfb70d0761682da2b3a2c2fccc2b9e84c495821639601d81afe7
      url: "https://pub.dev"
    source: hosted
    version: "2.3.0"
  platform:
    dependency: transitive
    description:
      name: platform
      sha256: "5d6b1b0036a5f331ebc77c850ebc8506cbc1e9416c27e59b439f917a902a4984"
      url: "https://pub.dev"
    source: hosted
    version: "3.1.6"
  plugin_platform_interface:
    dependency: transitive
    description:
      name: plugin_platform_interface
      sha256: "4820fbfdb9478b1ebae27888254d445073732dae3d6ea81f0b7e06d5dedc3f02"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.8"
  pool:
    dependency: transitive
    description:
      name: pool
      sha256: "978783255c543aa3586a1b3c21f6e9d720eb315376a915872c61ef8b5c20177d"
      url: "https://pub.dev"
    source: hosted
    version: "1.5.2"
  pub_semver:
    dependency: transitive
    description:
      name: pub_semver
      sha256: "5bfcf68ca79ef689f8990d1160781b4bad40a3bd5e5218ad4076ddb7f4081585"
      url: "https://pub.dev"
    source: hosted
    version: "2.2.0"
  riverpod:
    dependency: transitive
    description:
      name: riverpod
      sha256: c406de02bff19d920b832bddfb8283548bfa05ce41c59afba57ce643e116aa59
      url: "https://pub.dev"
    source: hosted
    version: "3.0.3"
  shared_preferences:
    dependency: "direct main"
    description:
      name: shared_preferences
      sha256: "6e8bf70b7fef813df4e9a36f658ac46d107db4b4cfe1048b477d4e453a8159f5"
      url: "https://pub.dev"
    source: hosted
    version: "2.5.3"
  shared_preferences_android:
    dependency: transitive
    description:
      name: shared_preferences_android
      sha256: "34266009473bf71d748912da4bf62d439185226c03e01e2d9687bc65bbfcb713"
      url: "https://pub.dev"
    source: hosted
    version: "2.4.15"
  shared_preferences_foundation:
    dependency: transitive
    description:
      name: shared_preferences_foundation
      sha256: "1c33a907142607c40a7542768ec9badfd16293bac51da3a4482623d15845f88b"
      url: "https://pub.dev"
    source: hosted
    version: "2.5.5"
  shared_preferences_linux:
    dependency: transitive
    description:
      name: shared_preferences_linux
      sha256: "580abfd40f415611503cae30adf626e6656dfb2f0cee8f465ece7b6defb40f2f"
      url: "https://pub.dev"
    source: hosted
    version: "2.4.1"
  shared_preferences_platform_interface:
    dependency: transitive
    description:
      name: shared_preferences_platform_interface
      sha256: "57cbf196c486bc2cf1f02b85784932c6094376284b3ad5779d1b1c6c6a816b80"
      url: "https://pub.dev"
    source: hosted
    version: "2.4.1"
  shared_preferences_web:
    dependency: transitive
    description:
      name: shared_preferences_web
      sha256: c49bd060261c9a3f0ff445892695d6212ff603ef3115edbb448509d407600019
      url: "https://pub.dev"
    source: hosted
    version: "2.4.3"
  shared_preferences_windows:
    dependency: transitive
    description:
      name: shared_preferences_windows
      sha256: "94ef0f72b2d71bc3e700e025db3710911bd51a71cefb65cc609dd0d9a982e3c1"
      url: "https://pub.dev"
    source: hosted
    version: "2.4.1"
  shelf:
    dependency: transitive
    description:
      name: shelf
      sha256: e7dd780a7ffb623c57850b33f43309312fc863fb6aa3d276a754bb299839ef12
      url: "https://pub.dev"
    source: hosted
    version: "1.4.2"
  shelf_packages_handler:
    dependency: transitive
    description:
      name: shelf_packages_handler
      sha256: "89f967eca29607c933ba9571d838be31d67f53f6e4ee15147d5dc2934fee1b1e"
      url: "https://pub.dev"
    source: hosted
    version: "3.0.2"
  shelf_static:
    dependency: transitive
    description:
      name: shelf_static
      sha256: c87c3875f91262785dade62d135760c2c69cb217ac759485334c5857ad89f6e3
      url: "https://pub.dev"
    source: hosted
    version: "1.1.3"
  shelf_web_socket:
    dependency: transitive
    description:
      name: shelf_web_socket
      sha256: "3632775c8e90d6c9712f883e633716432a27758216dfb61bd86a8321c0580925"
      url: "https://pub.dev"
    source: hosted
    version: "3.0.0"
  signalr_netcore:
    dependency: "direct main"
    description:
      name: signalr_netcore
      sha256: "8d59dc61284c5ff8aa27c4e3e802fcf782367f06cf42b39d5ded81680b72f8b8"
      url: "https://pub.dev"
    source: hosted
    version: "1.4.4"
  sky_engine:
    dependency: transitive
    description: flutter
    source: sdk
    version: "0.0.0"
  source_map_stack_trace:
    dependency: transitive
    description:
      name: source_map_stack_trace
      sha256: c0713a43e323c3302c2abe2a1cc89aa057a387101ebd280371d6a6c9fa68516b
      url: "https://pub.dev"
    source: hosted
    version: "2.1.2"
  source_maps:
    dependency: transitive
    description:
      name: source_maps
      sha256: "190222579a448b03896e0ca6eca5998fa810fda630c1d65e2f78b3f638f54812"
      url: "https://pub.dev"
    source: hosted
    version: "0.10.13"
  source_span:
    dependency: transitive
    description:
      name: source_span
      sha256: "254ee5351d6cb365c859e20ee823c3bb479bf4a293c22d17a9f1bf144ce86f7c"
      url: "https://pub.dev"
    source: hosted
    version: "1.10.1"
  sse:
    dependency: transitive
    description:
      name: sse
      sha256: fcc97470240bb37377f298e2bd816f09fd7216c07928641c0560719f50603643
      url: "https://pub.dev"
    source: hosted
    version: "4.1.8"
  sse_channel:
    dependency: transitive
    description:
      name: sse_channel
      sha256: "9aad5d4eef63faf6ecdefb636c0f857bd6f74146d2196087dcf4b17ab5b49b1b"
      url: "https://pub.dev"
    source: hosted
    version: "0.1.1"
  stack_trace:
    dependency: transitive
    description:
      name: stack_trace
      sha256: "8b27215b45d22309b5cddda1aa2b19bdfec9df0e765f2de506401c071d38d1b1"
      url: "https://pub.dev"
    source: hosted
    version: "1.12.1"
  state_notifier:
    dependency: transitive
    description:
      name: state_notifier
      sha256: b8677376aa54f2d7c58280d5a007f9e8774f1968d1fb1c096adcb4792fba29bb
      url: "https://pub.dev"
    source: hosted
    version: "1.0.0"
  stream_channel:
    dependency: transitive
    description:
      name: stream_channel
      sha256: "969e04c80b8bcdf826f8f16579c7b14d780458bd97f56d107d3950fdbeef059d"
      url: "https://pub.dev"
    source: hosted
    version: "2.1.4"
  string_scanner:
    dependency: transitive
    description:
      name: string_scanner
      sha256: "921cd31725b72fe181906c6a94d987c78e3b98c2e205b397ea399d4054872b43"
      url: "https://pub.dev"
    source: hosted
    version: "1.4.1"
  term_glyph:
    dependency: transitive
    description:
      name: term_glyph
      sha256: "7f554798625ea768a7518313e58f83891c7f5024f88e46e7182a4558850a4b8e"
      url: "https://pub.dev"
    source: hosted
    version: "1.2.2"
  test:
    dependency: transitive
    description:
      name: test
      sha256: "65e29d831719be0591f7b3b1a32a3cda258ec98c58c7b25f7b84241bc31215bb"
      url: "https://pub.dev"
    source: hosted
    version: "1.26.2"
  test_api:
    dependency: transitive
    description:
      name: test_api
      sha256: "522f00f556e73044315fa4585ec3270f1808a4b186c936e612cab0b565ff1e00"
      url: "https://pub.dev"
    source: hosted
    version: "0.7.6"
  test_core:
    dependency: transitive
    description:
      name: test_core
      sha256: "80bf5a02b60af04b09e14f6fe68b921aad119493e26e490deaca5993fef1b05a"
      url: "https://pub.dev"
    source: hosted
    version: "0.6.11"
  tuple:
    dependency: transitive
    description:
      name: tuple
      sha256: a97ce2013f240b2f3807bcbaf218765b6f301c3eff91092bcfa23a039e7dd151
      url: "https://pub.dev"
    source: hosted
    version: "2.0.2"
  typed_data:
    dependency: transitive
    description:
      name: typed_data
      sha256: f9049c039ebfeb4cf7a7104a675823cd72dba8297f264b6637062516699fa006
      url: "https://pub.dev"
    source: hosted
    version: "1.4.0"
  uuid:
    dependency: transitive
    description:
      name: uuid
      sha256: a11b666489b1954e01d992f3d601b1804a33937b5a8fe677bd26b8a9f96f96e8
      url: "https://pub.dev"
    source: hosted
    version: "4.5.2"
  vector_math:
    dependency: transitive
    description:
      name: vector_math
      sha256: d530bd74fea330e6e364cda7a85019c434070188383e1cd8d9777ee586914c5b
      url: "https://pub.dev"
    source: hosted
    version: "2.2.0"
  vm_service:
    dependency: transitive
    description:
      name: vm_service
      sha256: "45caa6c5917fa127b5dbcfbd1fa60b14e583afdc08bfc96dda38886ca252eb60"
      url: "https://pub.dev"
    source: hosted
    version: "15.0.2"
  watcher:
    dependency: transitive
    description:
      name: watcher
      sha256: "592ab6e2892f67760543fb712ff0177f4ec76c031f02f5b4ff8d3fc5eb9fb61a"
      url: "https://pub.dev"
    source: hosted
    version: "1.1.4"
  web:
    dependency: transitive
    description:
      name: web
      sha256: "868d88a33d8a87b18ffc05f9f030ba328ffefba92d6c127917a2ba740f9cfe4a"
      url: "https://pub.dev"
    source: hosted
    version: "1.1.1"
  web_socket:
    dependency: transitive
    description:
      name: web_socket
      sha256: "34d64019aa8e36bf9842ac014bb5d2f5586ca73df5e4d9bf5c936975cae6982c"
      url: "https://pub.dev"
    source: hosted
    version: "1.0.1"
  web_socket_channel:
    dependency: transitive
    description:
      name: web_socket_channel
      sha256: d645757fb0f4773d602444000a8131ff5d48c9e47adfe9772652dd1a4f2d45c8
      url: "https://pub.dev"
    source: hosted
    version: "3.0.3"
  webkit_inspection_protocol:
    dependency: transitive
    description:
      name: webkit_inspection_protocol
      sha256: "87d3f2333bb240704cd3f1c6b5b7acd8a10e7f0bc28c28dcf14e782014f4a572"
      url: "https://pub.dev"
    source: hosted
    version: "1.2.1"
  win32:
    dependency: transitive
    description:
      name: win32
      sha256: d7cb55e04cd34096cd3a79b3330245f54cb96a370a1c27adb3c84b917de8b08e
      url: "https://pub.dev"
    source: hosted
    version: "5.15.0"
  xdg_directories:
    dependency: transitive
    description:
      name: xdg_directories
      sha256: "7a3f37b05d989967cdddcbb571f1ea834867ae2faa29725fd085180e0883aa15"
      url: "https://pub.dev"
    source: hosted
    version: "1.1.0"
  yaml:
    dependency: transitive
    description:
      name: yaml
      sha256: b9da305ac7c39faa3f030eccd175340f968459dae4af175130b3fc47e40d76ce
      url: "https://pub.dev"
    source: hosted
    version: "3.1.3"
sdks:
  dart: ">=3.9.2 <4.0.0"
  flutter: ">=3.35.0"
````

## File: pubspec.yaml
````yaml
name: heloilo
description: "Heloilo é um projeto que trabalho desde de 2023, agora que tenho mais experiência quero fazer um app completo pra eu e minha noiva, espero que ele seja util pra nós dois, te amo bem."
# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: "none" # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
# In Windows, build-name is used as the major, minor, and patch parts
# of the product and file versions while build-number is used as the build suffix.
version: 1.0.0+1

environment:
  sdk: ^3.9.2

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
  flutter:
    sdk: flutter

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.8
  shared_preferences: ^2.5.3
  flutter_riverpod: ^3.0.3
  dio: ^5.9.0
  signalr_netcore: ^1.4.4
  flutter_dotenv: ^6.0.0
  logger: ^2.6.2
  flutter_secure_storage: ^9.2.4
  go_router: ^17.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter

  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^6.0.0

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter packages.
flutter:
  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  assets:
    - assets/images/
    - assets/fonts/
    - .env

  # To add assets to your application, add an assets section, like this:
  # assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/to/resolution-aware-images

  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/to/asset-from-package

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/to/font-from-package
  fonts:
    - family: NunitoSans
      fonts:
        - asset: "assets/fonts/NunitoSans-VariableFont_YTLC,opsz,wdth,wght.ttf"

    - family: Poppins
      fonts:
        - asset: assets/fonts/Poppins-Light/Poppins-Thin.ttf
          weight: 100
        - asset: assets/fonts/Poppins-Light/Poppins-ExtraLight.ttf
          weight: 200
        - asset: assets/fonts/Poppins-Light/Poppins-Light.ttf
          weight: 300
        - asset: assets/fonts/Poppins-Light/Poppins-Regular.ttf
          weight: 400
        - asset: assets/fonts/Poppins-Light/Poppins-Medium.ttf
          weight: 500
        - asset: assets/fonts/Poppins-Light/Poppins-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Poppins-Light/Poppins-Bold.ttf
          weight: 700
        - asset: assets/fonts/Poppins-Light/Poppins-ExtraBold.ttf
          weight: 800
        - asset: assets/fonts/Poppins-Light/Poppins-Black.ttf
          weight: 900
        - asset: assets/fonts/Poppins-Light/Poppins-Italic.ttf
          style: italic
        - asset: assets/fonts/Poppins-Light/Poppins-LightItalic.ttf
          style: italic
        - asset: assets/fonts/Poppins-Light/Poppins-BoldItalic.ttf
          weight: 700
          style: italic
        - asset: assets/fonts/Poppins-Light/Poppins-BlackItalic.ttf
          weight: 900
          style: italic
````

## File: requirements.md
````markdown
# 📋 Requisitos do Sistema — Heloilo

---

## 🧩 1. Requisitos Funcionais (RF)

### 🧑‍❤️‍👩 Módulo: Cadastro e Perfis do Casal

- **RF01** – O sistema deve permitir o cadastro de dois usuários (um casal).

- **RF02** – Após o cadastro individual, um usuário deve enviar uma solicitação de vinculação ao outro parceiro.

- **RF03** – O sistema deve notificar o parceiro sobre a solicitação de vinculação pendente.

- **RF04** – Após ambos os usuários aceitarem a vinculação, o sistema deve liberar a etapa de configuração inicial do relacionamento.

- **RF05** – O sistema deve exibir uma etapa de configuração inicial (opcional) onde o casal pode definir dados históricos e datas especiais. Esta etapa pode ser completada ou pulada por ambos os usuários.

- **RF06** – O sistema deve ser liberado completamente apenas após ambos os usuários completarem ou pularem a etapa de configuração inicial.

- **RF07** – Cada usuário deve ter perfil individual, com:

  - Nome e apelido carinhoso
  - Foto de perfil personalizável
  - Cor/tema visual próprio (a aplicação deve possuir um padrão de cor e o usuário altera se quiser)

- **RF08** – O casal deve poder definir:

  - Data em que se conheceram
  - Local onde se conheceram
  - Data de início do relacionamento
  - Tipo de comemoração (anual ou mensal)

- **RF09** – O sistema deve calcular e exibir quantos dias o casal está junto.

- **RF10** – O sistema deve notificar o casal quando estiver próximo o aniversário de relacionamento.

- **RF11** – O sistema deve exibir uma tela especial ou destaque visual no dia do aniversário do casal.

- **RF12** – O sistema deve permitir login individual, com senha distinta para cada membro.

- **RF13** – O sistema deve permitir logout seguro e rápido.

- **RF14** – O casal deve poder criar sua história com imagens e texto em ordem cronológica. No frontend, cada página deve ser uma página de um livro.

- **RF65** – O sistema deve permitir desvinculação do relacionamento apenas com confirmação de ambos os usuários.

- **RF66** – Após a desvinculação, os dados de cada usuário devem ser mantidos separadamente, permitindo novo vínculo com outro parceiro.

- **RF67** – O sistema não deve permitir alteração de parceiro após vinculação ativa, sendo necessário desvincular primeiro.

---

### 💭 Módulo: Desejos e Presentes

- **RF15** – O usuário deve poder criar desejos, informando:

  - Título
  - Descrição (opcional)
  - Link (ex: loja online)
  - Imagem ilustrativa
  - Nível de importância (de 1 a 5)
  - Data de registro

- **RF16** – O usuário deve poder editar ou excluir seus desejos.

- **RF17** – O sistema deve exibir uma lista cronológica dos desejos.

- **RF18** – O usuário deve poder pesquisar desejos por título.

- **RF19** – O sistema deve diferenciar visualmente os desejos criados por cada pessoa (cores distintas).

- **RF20** – O sistema deve permitir comentários e notas em cada desejo.

- **RF21** – O sistema deve sincronizar em tempo real novos desejos e comentários entre os dois perfis.

- **RF83** – O sistema deve permitir ordenação configurável da lista de desejos por data de criação, nível de importância ou ambos combinados.

- **RF84** – O sistema deve implementar resolução de conflitos quando ambos os usuários editarem o mesmo desejo simultaneamente, aplicando last-write-wins e notificando o outro usuário da alteração.

- **RF85** – O sistema deve permitir categorizar desejos em uma das seguintes categorias predefinidas:

  - **Viagem** 🌍 – Lugares que o casal quer conhecer juntos (praias, cidades, resorts, trilhas)
  - **Compras / Presentes** 🎁 – Coisas que um quer ganhar ou comprar (roupas, eletrônicos, itens pessoais)
  - **Experiências** ✨ – Atividades e momentos a dois (shows, dantares, piqueniques, cinema, spa)
  - **Metas do Casal** 🎯 – Objetivos compartilhados (mudar de cidade, comprar um carro, juntar grana)
  - **Casa e Decoração** 🏡 – Ideias para o lar (móveis, plantas, decoração, eletros)
  - **Datas Especiais** 📅 – Planos pra aniversários, dia dos namorados, comemorações do casal
  - **Auto-cuidado** 🧘‍♀️ – Coisas individuais que melhoram o bem-estar (academia, massagem, skincare)
  - **Animais de Estimação** 🐾 – Desejos relacionados a pets (adotar, comprar acessórios, viagens pet-friendly)
  - **Projetos Criativos** 🎨 – Sonhos artísticos ou hobbies (fotografia, música, pintura, escrita)
  - **Gastronomia** 🍝 – Lugares pra comer, receitas pra testar juntos, experiências gastronômicas
  - **Sonhos Grandes** 🌠 – Coisas mais distantes ou inspiracionais (casa própria, casamento, filhos)
  - **Doações e Impacto** 💗 – Desejos voltados a ajudar outros (doar, voluntariado, causas sociais)

- **RF86** – O sistema deve permitir filtrar desejos por categoria, facilitando a organização e visualização.

- **RF87** – O sistema deve exibir o emoji da categoria junto ao desejo na lista, proporcionando identificação visual rápida.

---

### 🖼️ Módulo: Memórias e Momentos Especiais

- **RF22** – O sistema deve permitir upload de fotos para a página de memórias.

- **RF23** – O sistema deve exibir as fotos em carrossel com transições suaves.

- **RF24** – O usuário deve poder ouvir música ambiente romântica na página de memórias.

- **RF25** – O sistema deve permitir controlar a música (play/pause).

- **RF26** – O sistema deve permitir navegar facilmente entre memórias e tela inicial.

- **RF27** – O sistema deve armazenar metadados da memória (data, título, descrição opcional).

- **RF58** – O sistema deve permitir adicionar tags e categorias personalizadas para organizar memórias e fotos.

- **RF59** – O sistema deve aplicar compressão automática em imagens maiores que 5MB, mantendo qualidade visual adequada.

- **RF60** – O sistema deve definir limite máximo de 10MB por imagem após compressão e 50MB para vídeos curtos.

---

### 🔔 Módulo: Notificações e Sincronização

- **RF28** – O sistema deve enviar notificações em tempo real quando:

  - O parceiro adicionar ou editar um desejo
  - Houver um novo comentário
  - Aproximar-se uma data especial (aniversário ou mêsversário)

- **RF29** – As notificações devem aparecer tanto no app móvel quanto na versão web.

- **RF30** – O sistema deve manter as informações sincronizadas entre os dispositivos.

- **RF73** – O sistema deve permitir que cada usuário configure suas preferências de notificações, podendo ativar ou desativar por tipo (desejos, comentários, datas especiais, chat, humor do parceiro).

- **RF74** – O sistema deve permitir definir horários preferenciais para receber notificações não urgentes (ex: não notificar entre 22h e 7h).

- **RF75** – O sistema deve permitir controle granular de categorias de notificações, incluindo intensidade (silenciosa, normal, prioritária).

---

### 🔐 Módulo: Segurança e Privacidade

- **RF31** – Cada usuário deve possuir senha única e obrigatória.

- **RF32** – O sistema deve impedir acessos não autorizados.

- **RF33** – As informações do casal devem ser acessíveis apenas entre os dois usuários cadastrados.

- **RF34** – O sistema deve criptografar dados sensíveis (senhas, mensagens, links, imagens).

- **RF35** – O sistema não deve permitir integração com redes sociais externas.

- **RF36** – O sistema não deve exibir anúncios ou conteúdo de terceiros.

---

### 📋 Módulo: Validações e Regras de Dados

- **RF61** – O sistema deve aceitar datas no formato DD/MM/AAAA e validar a existência da data (ex: 31/02 é inválida).

- **RF62** – O sistema deve validar que a data de início do relacionamento não seja futura e não seja anterior a 1900.

- **RF63** – O sistema deve aplicar limite de 500 caracteres para títulos, 2000 caracteres para descrições e 5000 caracteres para textos longos (história do casal).

- **RF64** – O sistema deve validar URLs de links de desejos, aceitando apenas protocolos HTTP e HTTPS.

---

### 😊 Módulo: Registro de Humor Diário

- **RF38** – Cada membro do casal deve poder registrar diariamente como está se sentindo.

- **RF39** – O sistema deve oferecer as seguintes opções de humores positivos:

  - Feliz / contente: sensação de leveza ou satisfação com algo do dia
  - Animado / motivado: energia para fazer coisas, associado a conquistas ou expectativas positivas
  - Calmo / relaxado: paz interior, sem estresse, se sente bem consigo mesmo
  - Orgulhoso: quando sente que fez algo legal ou atingiu uma meta
  - Grato / satisfeito: aprecia o que tem ou momentos bons do dia

- **RF40** – O sistema deve oferecer as seguintes opções de humores negativos:

  - Triste / melancólico: desânimo, perda de interesse ou leve sofrimento emocional
  - Irritado / frustrado: raiva ou impaciência por situações externas ou falhas próprias
  - Ansioso / preocupado: sensação de tensão ou medo do que pode acontecer
  - Culpado / arrependido: quando pensa em erros ou decisões que poderia ter feito diferente
  - Cansado / desmotivado: falta de energia ou vontade de fazer coisas

- **RF41** – O sistema deve oferecer as seguintes opções de humores neutros / mistos:

  - Entediado: sem estímulo ou interesse, sensação de "vazio" momentâneo
  - Confuso / indeciso: não sabe bem o que pensar ou fazer
  - Curioso / intrigado: mente ativa, querendo aprender ou descobrir algo

- **RF42** – O sistema deve exibir um dashboard/relatório com gráficos mostrando o histórico de humores registrados.

- **RF43** – O usuário deve poder filtrar o relatório de humores por período customizável (dia, semana, mês, intervalo personalizado).

- **RF44** – O sistema deve permitir visualizar o humor do parceiro para fomentar empatia e comunicação no relacionamento.

- **RF76** – O sistema deve permitir múltiplos registros de humor por dia, mantendo histórico de todas as alterações com horário.

- **RF77** – O sistema deve permitir adicionar um comentário ou nota opcional junto ao registro de humor (ex: "Triste porque meu gato morreu").

- **RF78** – O sistema deve exibir a evolução do humor ao longo do dia em uma timeline visual, mostrando mudanças e comentários.

---

### 📅 Módulo: Agenda e Status Diário

- **RF46** – O usuário deve poder criar uma agenda do dia com uma lista de atividades/tarefas que pretende realizar.

- **RF47** – O usuário deve poder editar, marcar como concluída ou excluir atividades da agenda.

- **RF48** – O usuário deve poder informar o que está fazendo no momento através de um status em tempo real.

- **RF49** – O status atual do usuário deve ser visível para o parceiro.

- **RF50** – O sistema deve exibir a agenda do parceiro para que ambos possam acompanhar a rotina um do outro.

- **RF79** – O sistema deve permitir configurar alertas e lembretes para atividades agendadas, com antecedência configurável (5, 15, 30 minutos ou 1 hora antes).

- **RF80** – O status em tempo real deve ter frequência de atualização máxima de 30 segundos entre os dispositivos.

- **RF81** – O sistema deve expirar automaticamente um status após 4 horas sem atualização, marcando como "status desatualizado".

- **RF82** – O sistema deve manter histórico de status ao longo do dia, permitindo visualizar o que o parceiro fez durante todo o dia.

---

### 💬 Módulo: Chat e Comunicação

- **RF51** – O sistema deve fornecer um chat privado entre o casal.

- **RF52** – O chat deve suportar o envio de mensagens de texto em tempo real.

- **RF53** – O sistema deve notificar o usuário quando receber uma nova mensagem do parceiro.

- **RF54** – O chat deve permitir o envio de emojis e stickers românticos.

- **RF55** – O sistema deve manter o histórico de conversas do casal.

- **RF56** – O usuário deve poder pesquisar mensagens no histórico do chat.

- **RF68** – O chat deve permitir o envio de imagens com limite de 10MB por arquivo.

- **RF69** – O chat deve permitir o envio de mensagens de áudio com limite de 5 minutos e 20MB por arquivo.

- **RF70** – O sistema deve aplicar compressão automática em imagens e áudios enviados no chat para otimizar uso de armazenamento e transferência.

- **RF71** – O chat deve exibir status de mensagens: enviada (um check), entregue (dois checks) e lida (dois checks coloridos).

- **RF72** – O chat deve exibir indicador visual quando o parceiro estiver digitando uma mensagem.

---

### 🌐 Módulo: Multiplataforma

- **RF57** – O sistema deve estar disponível para:
  - Web (versão responsiva)

---

## ⚙️ 2. Requisitos Não Funcionais (RNF)

### 🚀 Desempenho

- **RNF01** – O sistema deve carregar a tela inicial em até 2 segundos.

- **RNF02** – As atualizações em tempo real devem ocorrer com latência inferior a 1 segundo.

- **RNF03** – O app deve suportar sincronização simultânea entre múltiplos dispositivos do casal.

- **RNF26** – O sistema deve implementar lazy loading e paginação para listas longas, carregando inicialmente apenas 20 itens e carregando mais sob demanda.

- **RNF27** – O sistema deve resolver conflitos de sincronização offline aplicando estratégia de mesclagem inteligente: operações locais têm prioridade para criação, last-write-wins para edição com timestamp do servidor.

- **RNF28** – O carregamento inicial da aplicação deve limitar-se aos dados essenciais: perfil do usuário, últimas 5 notificações e status atual do parceiro.

---

### 🔒 Segurança

- **RNF04** – As senhas devem ser armazenadas com hash seguro (ex: bcrypt, Argon2).

- **RNF05** – As requisições devem trafegar sobre HTTPS.

- **RNF06** – As imagens e dados pessoais devem ser armazenados em repositório seguro (ex: S3, Firebase Storage).

- **RNF07** – O sistema deve aplicar autenticação baseada em token (JWT).

- **RNF08** – O acesso ao backend deve exigir verificação de identidade e autorização por sessão.

- **RNF29** – O sistema deve definir claramente rotas públicas (login, cadastro) e rotas privadas (todas as demais, requerendo autenticação).

- **RNF30** – Os tokens JWT devem ter validade de 7 dias, com renovação automática silenciosa 24 horas antes da expiração.

- **RNF31** – O sistema deve implementar bloqueio anti-brute force: após 5 tentativas de login falhas, bloquear conta por 15 minutos.

- **RNF32** – Dados sensíveis no banco (mensagens, comentários, links) devem ser criptografados com AES-256 em repouso.

- **RNF33** – O sistema deve permitir renovação manual de token através de refresh token com validade de 30 dias.

---

### 💡 Usabilidade

- **RNF09** – A interface deve ser romântica, acolhedora e minimalista.

- **RNF10** – A navegação deve ser intuitiva e fluida, com poucas ações para alcançar as principais funções.

- **RNF11** – O design deve refletir a identidade do casal, com cores personalizáveis.

- **RNF12** – As fontes e elementos visuais devem manter consistência e legibilidade em todos os dispositivos.

- **RNF34** – O sistema deve suportar leitores de tela e seguir diretrizes WCAG 2.1 nível AA para acessibilidade.

- **RNF35** – O sistema deve garantir contraste mínimo de 4.5:1 para textos normais e 3:1 para textos grandes, permitindo tema de alto contraste.

- **RNF36** – O sistema deve oferecer modo reduzido de animações para usuários com sensibilidade a movimentos, respeitando preferência do sistema operacional.

- **RNF37** – O sistema deve permitir controle de volume e on/off para música ambiente, mantendo a preferência do usuário entre sessões.

---

### ⚡ Confiabilidade

- **RNF13** – O sistema deve manter disponibilidade mínima de 99%.

- **RNF14** – Deve haver mecanismo de backup automático dos dados do casal.

- **RNF15** – Em caso de falha de conexão, o app deve armazenar alterações localmente e sincronizar quando online.

- **RNF38** – O sistema deve implementar backup incremental diário automático dos dados do casal, com política de retenção de 30 dias.

- **RNF39** – O sistema deve notificar o usuário sobre falha de conexão e exibir indicador visual de operações pendentes na fila de sincronização.

- **RNF40** – O sistema deve implementar logging estruturado de erros, métricas de uso e performance, com monitoramento em tempo real e alertas para falhas críticas.

---

### 🧱 Manutenibilidade

- **RNF16** – O código deve seguir boas práticas de clean architecture.

- **RNF17** – O sistema deve ter camadas separadas (frontend, backend e banco).

- **RNF18** – O backend deve ser modular, permitindo expansão (ex: novos tipos de lembretes, timeline).

- **RNF19** – O banco de dados deve ser relacional e normalizado.

---

### 🌍 Portabilidade

- **RNF20** – O sistema deve funcionar corretamente em diferentes tamanhos de tela.

- **RNF21** – A versão web deve ser responsiva.

- **RNF22** – O app deve permitir login e sincronização entre dispositivos sem perda de dados.

- **RNF41** – O sistema deve implementar layouts adaptativos específicos para mobile (< 768px), tablet (768px - 1024px) e desktop (> 1024px).

- **RNF42** – A aplicação web deve suportar tanto orientação portrait quanto landscape, ajustando o layout automaticamente conforme a orientação do dispositivo.

---

### 🎨 Experiência Sensorial

- **RNF23** – O app deve ter animações suaves (ex: corações flutuando, transições com fade).

- **RNF24** – Deve reproduzir músicas temáticas na página de memórias.

- **RNF25** – O modo de celebração (aniversário/mêsversário) deve ter efeitos visuais especiais.
````
