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
    <title>Dashboard</title>
</head>
<body>
    <h1>Bem-vindo, <%= cliente.getNome() %>!</h1>
    <p>Seu plano de saúde: <%= cliente.getPlanoSaude() %></p>
    <p>Email: <%= cliente.getEmail() %></p>
    <p>CPF: <%= cliente.getCpf() %></p>
    <p>CPF: <%= cliente.getBairro() %></p>

    <a href="logout.jsp">Sair</a>
</body>
</html>
