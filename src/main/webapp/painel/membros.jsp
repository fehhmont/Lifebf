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
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
         <div class="sidebar">
                    <div class="user-name"><%= cliente.getNome() %></div>
                    <a href="#" class="nav-item">Painel</a>
                    <a href="membros.jsp" class="nav-item active">Membros</a>
                    <a href="/planos" class="nav-item">Planos</a>
                    <a href="config.jsp" class="nav-item">Configurações</a>
                    <a href="logout.jsp" class="excluir">Sair</a>
                </div>

        <div class="main-content">
            <div class="header">
                <h1>Membros</h1>
                <button class="criar-membro">Criar membro</button>
            </div>

            <div class="search-bar">
                <input type="text" placeholder="Pesquisar por nome">
            </div>

            <table>
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Descrição</th>
                        <th>Código QR</th>
                        <th>Alterar</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Felipe</td>
                        <td>Filho</td>
                        <td><a href="#" class="gerar-qr">Gerar código QR</a></td>
                        <td>
                            <a href="#" class="editar">Editar</a>
                            <a href="#" class="excluir">Excluir</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Felipe</td>
                        <td>bla bla</td>
                        <td><a href="#" class="gerar-qr">Gerar código QR</a></td>
                        <td>
                            <a href="#" class="editar">Editar</a>
                            <a href="#" class="excluir">Excluir</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Felipe</td>
                        <td>bla bla</td>
                        <td><a href="#" class="gerar-qr">Gerar código QR</a></td>
                        <td>
                            <a href="#" class="editar">Editar</a>
                            <a href="#" class="excluir">Excluir</a>
                        </td>
                    </tr>
                </tbody>
            </table>


        </div>
    </div>

    <script src="main.js"></script>
</body>
</html>
