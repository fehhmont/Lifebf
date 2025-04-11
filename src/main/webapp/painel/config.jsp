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
<body>
    <div class="container">
        <div class="sidebar">
                            <div class="user-name"><%= cliente.getNome() %></div>
                            <a href="#s" class="nav-item">Painel</a>
                            <a href="/membros" class="nav-item">Membros</a>
                            <a href="/planos" class="nav-item">Planos</a>
                            <a href="config.jsp" class="nav-item active">Configurações</a>
                            <a href="logout.jsp" class="excluir">Sair</a>
                        </div>

        <div class="main-content">
            <div class="header">
                <h1>Configurações</h1>
                <div class="header-buttons">
                    <button class="editar-info">Editar informações</button>
                    <button class="alterar-senha">Alterar senha</button>
                </div>
            </div>

            <div class="profile-section">

                <h2><%= cliente.getNome() %></h2>

                <div class="plan-info">
                    <p><strong>Plano contratado:</strong> Gratuito</p>
                    <p><strong>Plano de saude:</strong> <%= cliente.getPlanoSaude() %></p>
                </div>

                <div class="personal-info">
                    <h3>informações pessoais:</h3>
                    <ul>
                        <li><strong>CPF:</strong> <%= cliente.getCpf() %></li>
                        <li><strong>Numero:</strong><%= cliente.getNumero() %></li>
                        <li><strong>Endereco:</strong><%= cliente.getRua() %></li>
                        <li><strong>Bairro:</strong><%= cliente.getBairro() %></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>


    <script src="main.js"></script>
</body>
</html>