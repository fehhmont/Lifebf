<%@ page import="br.com.lifebf.model.Cliente" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    Cliente cliente = (Cliente) session.getAttribute("cliente");
    if (cliente == null) {
        response.sendRedirect("login.html");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Planos</title>
    <link rel="stylesheet" href="css/planos.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        
        <div class="sidebar">
                            <div class="user-name"><%= cliente.getNome() %></div>
                            <a href="painel.html" class="nav-item">Painel</a>
                            <a href="membros.jsp" class="nav-item">Membros</a>
                            <a href="planos.jsp" class="nav-item active">Planos</a>
                            <a href="config.jsp" class="nav-item">Configurações</a>
                            <a href="logout.jsp" class="excluir">Sair</a>
                        </div>

        
        <div class="main-content">
            <h1>Planos</h1>
            <div class="content">
                <div class="text-image-container">
                    <p>Procurando uma maneira simples e eficiente de gerenciar informações essenciais? Temos a solução perfeita para você! Nossos planos foram pensados para atender diferentes necessidades, desde quem está começando até quem precisa de recursos ilimitados.
<br>
                        <br>
                        🔹 Plano Gratuito (Free) – Comece sem custos! Cadastre até 2 membros e 5 endereços sem pagar nada.
                        <br>
                        <br>
                        🔹 Plano Individual – Mais flexibilidade para quem precisa de um pouco mais. Por apenas R$ 7,50/mês, gerencie até 4 membros e 10 endereços.
                        <br>
                        <br>
                        🔹 Plano Família – O máximo de liberdade! Com R$ 15,90/mês, você pode adicionar quantos membros e endereços quiser, sem limites.

                        Escolha o plano que melhor atende às suas necessidades e aproveite uma solução prática e segura!</p>

                </div>
            </div>

            <h2>Confira nossos planos:</h2>
            <div class="plans">
                <div class="plan">
                    <img src="https://viverbem.unimedbh.com.br/wp-content/uploads/2025/01/Plano-de-saude-por-adesao-300x150.webp" alt="Plano Free">
                    <div class="p-4">
                        <h3>Free</h3>
                        <ul>
                            <li>2x Criação de membros</li>
                            <li>5x Cadastro de endereço em cada membro</li>
                        </ul>
                        <p>Plano gratuito</p>
                        <button class="selected">Selecionado</button>
                    </div>
                </div>

                <div class="plan">
                    <img src="https://viverbem.unimedbh.com.br/wp-content/uploads/2025/01/Plano-de-saude-por-adesao-300x150.webp" alt="Plano Individual">
                    <div class="p-4">
                        <h3>Individual</h3>
                        <ul>
                            <li>4x Criação de membros</li>
                            <li>10x Cadastro de endereço em cada membro</li>
                        </ul>
                        <p>Por: R$ 7,50 / Mês</p>
                        <button class="contract">Contratar</button>
                    </div>
                </div>

                <div class="plan">
                    <img src="https://viverbem.unimedbh.com.br/wp-content/uploads/2025/01/Plano-de-saude-por-adesao-300x150.webp" alt="Plano Família">
                    <div class="p-4">
                        <h3>Família</h3>
                        <ul>
                            <li>Ilimitado Criação de membros</li>
                            <li>Ilimitado Cadastro de endereço em cada membro</li>
                        </ul>
                        <p>Por: R$ 15,90 / Mês</p>
                        <button class="contract">Contratar</button>
                                              
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
