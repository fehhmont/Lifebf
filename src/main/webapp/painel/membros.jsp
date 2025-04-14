<%@ page import="br.com.lifebf.model.Cliente" %>
<%@ page import="java.util.List" %>
<%@ page import="br.com.lifebf.model.Membros" %>
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
    <link rel="stylesheet" href="/painel/css/membros.css">
</head>
<body>
<div class="container">
    <div class="sidebar">
        <div class="user-name"><%= cliente.getNome() %></div>
        <a href="#" class="nav-item">Painel</a>
        <a href="/membros" class="nav-item active">Membros</a>
        <a href="/planos" class="nav-item">Planos</a>
        <a href="painel/config.jsp" class="nav-item">Configurações</a>
        <a href="/logout" class="excluir">Sair</a>
    </div>

    <div class="main-content">
        <div class="header">
            <h1>Membros</h1>
            <button class="criar-membro" onclick="openModal()">Criar membro</button>
        </div>

        <% if ("1".equals(request.getParameter("sucesso"))) { %>
            <div class="mensagem sucesso">Membro adicionado com sucesso!</div>
        <% } %>

        <% if (request.getAttribute("mensagemErro") != null) { %>
            <div class="mensagem erro"><%= request.getAttribute("mensagemErro") %></div>
        <% } %>

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
            <%
                List<Membros> membros = (List<Membros>) request.getAttribute("membro");
                for (Membros m : membros) {
            %>
            <tr>
                <td><%= m.getNome() %></td>
                <td><%= m.getDescricao() %></td>
                <td><a href="#" class="gerar-qr">Gerar código QR</a></td>
                <td>
                    <a href="#" class="editar">Editar</a>
                    <a href="excluir-membro?id=<%= m.getId_membro() %>" onclick="return confirm('Deseja realmente excluir este membro? Isso irá excluir todos os hospitais cadastrados do membro <%= m.getNome() %>.');" class="excluir">Excluir</a>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <% if (request.getAttribute("mensagemModalErro") != null) { %>
                            <div class="mensagem erro modal-alert"><%= request.getAttribute("mensagemModalErro") %></div>
                        <% } %>

        <div class="modal-overlay" id="modalOverlay">
            <div class="modal">
                <h3>Preencha os dados</h3>



                <form action="membros" method="post" class="form-container">
                    <input type="text" name="nome_membro" placeholder="Nome" required>
                    <input type="text" name="descricao" placeholder="Descrição" required>
                    <div style="text-align: right;">
                        <button type="submit" class="submit-btn">Adicionar membro</button>
                        <button type="button" class="close-btn" onclick="closeModal()">Cancelar</button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>

<script>
    function openModal() {
        document.getElementById('modalOverlay').style.display = 'flex';
    }

    function closeModal() {
        document.getElementById('modalOverlay').style.display = 'none';
    }

    // Esconde automaticamente mensagens após 3 segundos
    setTimeout(() => {
        const mensagens = document.querySelectorAll('.mensagem');
        mensagens.forEach(el => el.style.opacity = '0');
    }, 3000);

    // Se houver flag para abrir modal
    <% if ("1".equals(String.valueOf(request.getAttribute("abrirModal")))) { %>
        openModal();
    <% } %>
</script>
</body>
</html>
