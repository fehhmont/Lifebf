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
    <title>Planos</title>
    <link rel="stylesheet" href="/painel/css/planos.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
    .dashboard {
        padding: 30px;
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;

      flex-direction: column;
      }

      .card {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        border-left: 5px solid #2563eb;
        margin-bottom: 20px;
        transition: 0.3s;
      }

      .card:hover {
        transform: translateY(-5px);
      }

      .card h3 {
        font-size: 18px;
        margin-bottom: 10px;
        color: #333;
      }

      .card p {
        font-size: 26px;
        color: #2563eb;
        font-weight: bold;
      }

    </style>
</head>

<body>
    <div class="container">


        <div class="sidebar">
                            <div class="user-name">Felipe</div>
                            <a href="#" class="nav-item active">Painel</a>
                            <a href="/membros" class="nav-item ">Membros</a>
                            <a href="/planos" class="nav-item">Planos</a>
                            <a href="painel/config.jsp" class="nav-item">Configurações</a>
                            <a href="/logout" class="excluir">Sair</a>
                        </div>


        <div class="main-content">

            <h1></h1>
            <div class="content">


                <main class="dashboard">
                    <div class="card">
                      <h3>Quantiades de Membros</h3>
                      <p>${totalMembros}</p>
                    </div>
                    <div class="card">
                      <h3>Hospitais Cadastrado</h3>
                      <p>73</p>
                    </div>
                    <div class="card">
                      <h3>Profissionais de Plantão</h3>
                      <p>46</p>
                    </div>
                    <div class="card">
                      <h3>Leitos Disponíveis</h3>
                      <p>14</p>
                    </div>
                    <div class="card">
                      <h3>Consultas Realizadas</h3>
                      <p>215</p>
                    </div>
                  </main>

            </div>
        </div>
</body>
</html>
