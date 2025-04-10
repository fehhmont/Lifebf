<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="br.com.lifebf.model.Cliente" %>
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
    <title>Planos</title>
    <link rel="stylesheet" href="/painel/css/planos.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        

        <div class="sidebar">
                            <div class="user-name"><%= cliente.getNome() %></div>
                            <a href="#" class="nav-item">Painel</a>
                            <a href="painel/membros.jsp" class="nav-item ">Membros</a>
                            <a href="/planos" class="nav-item active">Planos</a>
                            <a href="painel/config.jsp" class="nav-item">Configurações</a>
                            <a href="painel/logout.jsp" class="excluir">Sair</a>
                        </div>

        
        <div class="main-content">

            <h1>Planos</h1>
            <div class="content">

    <div class="plans">
        <c:forEach var="plano" items="${planos}">
            <div class="plan">
                <div class="p-4">
                    <h3>${plano.nomePlano}</h3>
                    <ul>
                        <li>Criação de Membros: ${plano.quantidadeMembros}</li>
                    </ul>
                    <p>Preço: R$ ${plano.precoPlano}</p>
                    <button class="selected">Selecionado</button>
                </div>
            </div>
        </c:forEach>
    </div>

</body>
</html>
