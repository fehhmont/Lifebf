<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>LifeBF - Serviços</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="css/servicos.css"/>
</head>
<body>
  <!-- HEADER IGUAL AO DA INDEX -->
  <header class="header">
    <div class="container header-content">
      <div class="logo">
        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="heart-icon" viewBox="0 0 24 24">
          <path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"/>
        </svg>
        <span>LifeBF</span>
      </div>
      <nav class="nav-menu">
        <a href="index.html">Início</a>
        <a href="sobre.html">Sobre</a>
        <a href="servicos.html">Serviços</a>
      </nav>
      <button class="login-btn" id="loginButton">Login</button>
    </div>
  </header>

  <!-- CONTEÚDO PRINCIPAL -->
  <main>
    <h1>Escolha o Serviço ideal Para Você</h1>
    <div class="service-info">
      <div>
        <h2>Serviços Flexíveis para todas as necessidades</h2>
        <p>Oferecemos opções que se adaptam ao seu crescimento, desde o serviço gratuito até soluções completas para toda a família.</p>
      </div>
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv3peSIV5P7FHAGpKkWRSv1iThQWwe2kkhQw&s" alt="Imagem decorativa"/>
    </div>



    <div class="card-container">
      <c:forEach var="plano" items="${planos}">
        <div class="card">
          <h3>${plano.nomePlano}</h3>
          <br>
          <ul>
            <li><i class="fas fa-check"></i>${plano.quantidadeMembros} Criação de Membros</li>
            <li><i class="fas fa-check"></i>${plano.quantidadeEndereco} endereços por membro</li>
          </ul>
          <br>
          <p>Preço: R$ ${plano.precoPlano}<span>/mês</span></p>
          <br>
          <c:choose>
            <c:when test="${plano.id_plano == cliente.getId_plano()}">
              <button class="btn-cinza" disabled>Selecionado</button>
            </c:when>
            <c:otherwise>
              <form action="/alterarPlano" method="post">
                <input type="hidden" name="idPlano" value="${plano.id_plano}" />
                <button type="submit" class="btn-azul">Selecionar</button>
              </form>
            </c:otherwise>
          </c:choose>
        </div>
      </c:forEach>
    </div>
  </main>

  <!-- FOOTER IGUAL AO DA INDEX -->
  <footer class="footer">
    <div class="container">
      <div class="footer-grid">
        <div class="footer-section">
          <h3>Sobre Nós</h3>
          <p>Com a LifeBF, você garante segurança e tranquilidade para você e sua família.</p>
        </div>
        <div class="footer-section">
          <h3>Contato</h3>
          <div class="contact-info">
            <p><i class="fas fa-phone-alt"></i> (11) 2326-3361</p>
            <p><i class="fas fa-envelope"></i> contato@lifebf.com</p>
            <p><i class="fas fa-map-marker-alt"></i> Av. Paulista, 1234 - São Paulo, SP</p>
          </div>
        </div>
        <div class="footer-section">
          <h3>Redes Sociais</h3>
          <div class="social-links">
            <a href="#"><i class="fab fa-facebook-f social-icon"></i></a>
            <a href="#"><i class="fab fa-twitter social-icon"></i></a>
            <a href="#"><i class="fab fa-instagram social-icon"></i></a>
          </div>
        </div>
      </div>
      <div class="footer-bottom">
        <p>&copy; 2024 LifeBF. Todos os direitos reservados.</p>
      </div>
    </div>
  </footer>

  <script src="js/script.js"></script>
</body>
</html>
