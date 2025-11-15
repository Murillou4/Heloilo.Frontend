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