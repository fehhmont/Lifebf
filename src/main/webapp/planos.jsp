
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Planos</title>
    <link rel="stylesheet" href="planos.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        
        <div class="sidebar">
            <div class="user-name">Felipe</div>
            <nav>
                <div class="nav-item">Painel</div>
                <div class="nav-item">Membros</div>
                <div class="nav-item active">Planos</div>
                <div class="nav-item">Configurações</div>
            </nav>
        </div>

        
        <div class="main-content">

            <h1>Planos</h1>
            <div class="content">
         <c:forEach var="plano" items="${planos}">
          <p>Plano: ${plano.nome_plano} | Preço: R$ ${plano.preco_plano} | Duração: ${plano.quantidade_membros} meses</p>

         </c:forEach>

            <p>teseste</p>
            </div>
        </div>
    </div>
    <div class="navigation">
        <button class="arrow left-arrow"><i class="fas fa-angle-left"></i></button>
        <button class="arrow right-arrow"><i class="fas fa-angle-right"></i></button>
    </div>
</body>
</html>
