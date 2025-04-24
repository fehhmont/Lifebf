<%@ page import="br.com.lifebf.model.Cliente" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Cliente cliente = (Cliente) session.getAttribute("cliente");
    if (cliente == null) {
        response.sendRedirect("../login.html");
        return;
    }
%>


<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Membros</title>
    <link rel="stylesheet" href="css/config.css">
</head>

<style>

.modal-overlay {
  display: none;
  position: fixed;
  top: 0; left: 0;
  width: 100vw;
  height: 100vh;
  background: rgba(0, 0, 0, 0.5);
  justify-content: center;
  align-items: center;
  z-index: 999;
}
.form-container input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            gap: 5px;
        }
.modal {
  background: #fff;
  padding: 20px;
  border-radius: 8px;
  width: 90%;
  max-width: 400px;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
}




.submit-btn, .close-btn {
  padding: 10px 15px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.submit-btn {
  background-color: #4CAF50;
  color: white;
}

.close-btn {
  background-color: #e74c3c;
  color: white;
  margin-left: 10px;
}

.modal input[type="password"]:focus {
  border-color: #4CAF50;
  box-shadow: 0 0 5px rgba(76, 175, 80, 0.4);
  background-color: #fff;
}
.mensagem.erro {
    background-color: #f8d7da;
    color: #721c24;
    padding: 10px;
    border-radius: 5px;
    margin: 10px 0;
}

</style>
<body>
    <div class="container">
        <div class="sidebar">
                            <div class="user-name"><%= cliente.getNome() %></div>
                            <a href="#s" class="nav-item">Painel</a>
                            <a href="/membros" class="nav-item">Membros</a>
                            <a href="/planos" class="nav-item">Planos</a>
                            <a href="config.jsp" class="nav-item active">Configurações</a>
                            <a href="/logout" class="excluir">Sair</a>
                        </div>

        <div class="main-content">



            <div class="header">
                <h1>Configurações</h1>
                <div class="header-buttons">
                    <button class="editar-info" onclick="openEditar()">Editar informações</button>
                    <button class="alterar-senha" onclick="openAlterar()">Alterar senha</button>
                </div>
            </div>

 <%
            String mensagemErro = (String) session.getAttribute("mensagemErro");
            if (mensagemErro != null) {
        %>
            <div class="mensagem erro"><%= mensagemErro %></div>
        <%
                session.removeAttribute("mensagemErro");
            }
        %>


            <div class="profile-section">

                <h2><%= cliente.getNome() %></h2>

                <div class="plan-info">
                    <p><strong>Plano de saude:</strong> <%= cliente.getPlanoSaude() %></p>
                    <p><strong>Plano contratado:</strong> <%= cliente.getNome_plano() %></p>

                </div>

                <div class="personal-info">
                    <h3>informações pessoais:</h3>
                    <ul>
                        <li><strong>Email:</strong> <%= cliente.getEmail() %></li>
                        <li><strong>CPF:</strong> <%= cliente.getCpf() %></li>
                        <li><strong>Numero:</strong><%= cliente.getNumero() %></li>
                        <li><strong>Endereco:</strong><%= cliente.getRua() %></li>
                        <li><strong>Bairro:</strong><%= cliente.getBairro() %></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="modal-overlay" id="modalAlterarOverlay">
                            <div class="modal">
                                <h3>Inserir uma nova senha</h3>
                                <form action="/alterarSenha" method="post" class="form-container">
                                    <input type="password" id="senha" name="novaSenha" placeholder="***********">
                                    <input type="password" id="senha" name="confirmarSenha" placeholder="Confirme a Senha">
                                    <div style="text-align: right;">
                                        <button type="submit" class="submit-btn">Alterar Senha</button>
                                        <button type="button" class="close-btn" onclick="closeAlterarModal()">Cancelar</button>
                                    </div>
                                </form>
                            </div>
    </div>


<div class="modal-overlay" id="modalEditarOverlay">
    <div class="modal">
        <h3>Editar Informações</h3>
        <form action="/editarInformacoes" method="post" class="form-container">
            <input type="text" name="nome" placeholder="Nome" value="<%= cliente.getNome() %>" required>
            <input type="email" name="email" placeholder="Email" value="<%= cliente.getEmail() %>" required>
            <input type="text" name="numero" placeholder="Número" value="<%= cliente.getNumero() %>" required>
            <input type="text" name="rua" placeholder="Endereço" value="<%= cliente.getRua() %>" required>
            <input type="text" name="bairro" placeholder="Bairro" value="<%= cliente.getBairro() %>" required>

            <div style="text-align: right;">
                <button type="submit" class="submit-btn">Salvar</button>
                <button type="button" class="close-btn" onclick="closeEditarModal()">Cancelar</button>
            </div>
        </form>
    </div>
</div>


    <script>

    function openAlterar() {
        document.getElementById('modalAlterarOverlay').style.display = 'flex';
    }

    function closeAlterarModal() {
        document.getElementById('modalAlterarOverlay').style.display = 'none';
    }

    function openEditar() {
        document.getElementById('modalEditarOverlay').style.display = 'flex';
    }

    function closeEditarModal() {
        document.getElementById('modalEditarOverlay').style.display = 'none';
    }

    // Esconde automaticamente mensagens após 3 segundos
    setTimeout(() => {
        const mensagens = document.querySelectorAll('.mensagem');
        mensagens.forEach(el => el.style.opacity = '0');
    }, 3000);


    </script>



</body>
</html>