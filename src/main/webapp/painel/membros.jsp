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
                <td><a href="#" class="gerar-qr" onclick="mostrarQRCodeModal(<%= m.getId_membro() %>)">Gerar código QR</a></td>
                <td>
                    <a href="#" class="editar" onclick="openEditModal(<%=m.getId_membro() %>)">Editar</a>
                    <a href="excluir-membro?id=<%= m.getId_membro()%>" onclick="return confirm('Deseja realmente excluir este membro? Isso irá excluir todos os hospitais cadastrados do membro <%= m.getNome() %>.');" class="excluir">Excluir</a>
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
         <div class="modal-overlay" id="modalEditOverlay">
                <div class="modal">
                     <h2>Adicionar hospital</h2>
                    <form action="membros" method="post" class="form-container">
                        <input type="text" name="nome_membro" placeholder="Nome do hospital" required>
                        <input type="text" name="cep" placeholder="CEP" required id="cep" onblur="getAddress()">
                        <input type="text" name="rua" placeholder="Rua" required>
                        <input type="text" name="estado" placeholder="Estado" required>
                         <input type="text" name="bairro" placeholder="Bairro" required>
                         <input type="text" name="numero" placeholder="Numero" required>
                            <div class="hospital-list">
                              <h3>Hospitais cadastrados:</h3>

                     </div>
                     <div style="text-align: right;">
                        <button type="submit" class="submit-btn">Adicionar hospital</button>
                        <button type="button" class="close-btn" onclick="closeEditModal()">Cancelar</button>
                    </div>
                    </form>
                </div>
            </div>

        </div>



    <!-- Biblioteca QRCode.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>

</div>

<div class="modal-overlay" id="modal">
        <div class="modal">
            <h2>QR Code do Membro</h2>
            <div id="qrcode"></div>
            <div class="btn-group">
                <a id="downloadBtn"class="gerar-qr" href="#" download>Download</a>
                <button onclick="imprimirQRCode()"class="submit-btn">Imprimir</button>
                <button class="close-btn" onclick="fecharQRCodeModal()">Fechar</button>
            </div>
        </div>
    </div>
    <!-- Biblioteca QRCode.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>

<script>
function mostrarQRCodeModal(idMembro) {
    const qr = document.getElementById("qrcode");
    const url = "http://localhost:8080/hospitalMaisProximo.html?id_membro=" + idMembro;

    qr.innerHTML = "";
    new QRCode(qr, {
        text: url,
        width: 200,
        height: 200
    });

    document.getElementById("modal").style.display = "flex";


    setTimeout(() => {
        const img = qr.querySelector("img");
        const downloadBtn = document.getElementById("downloadBtn");
        downloadBtn.href = img.src;
        downloadBtn.download = `qrcode_membro_${idMembro}.png`;
    }, 500);
}

function fecharQRCodeModal() {
    document.getElementById("modal").style.display = "none";
}

function imprimirQRCode() {
    const printWindow = window.open('', '_blank');
    const qrImg = document.getElementById("qrcode").querySelector("img").src;
    printWindow.document.write(`<img src="${qrImg}" style="width:200px;height:200px;">`);
    printWindow.document.close();
    printWindow.print();
}
async function getAddress(){
    const cep = document.getElementById("cep").value;
    if (cep.length < 8) {
        alert("CEP inválido!");
        return;
    }
    const url = "https://cep.awesomeapi.com.br/json/" + cep;
    try {
        const response = await fetch(url);
        const data = await response.json();
        document.querySelector("input[name='rua']").value = data.address;
        document.querySelector("input[name='estado']").value = data.state;
        document.querySelector("input[name='bairro']").value = data.district;
    } catch (error) {
        console.error('Erro ao buscar o CEP:', error);
    }

}
async function getHospitais(id){
    const url = "http://localhost:8080/membro/hospital?id_membro=" + id;
    const containerHospitalList = document.querySelector('.hospital-list');
     // Limpa a lista antes de adicionar novos hospitais
    let data = [];
    await fetch(url)
    .then((res) => res.json())
    .then((resp) => data = resp)
    .catch((error) => console.error('Erro ao buscar hospitais:', error));
    if(data.length >0){
        data.map((index) =>{
            console.log(index);
            containerHospitalList.innerHTML +=
                '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor"' +
                ' stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="hospital-icon">' +
                '<path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"></path>' +
                '<circle cx="12" cy="10" r="3"></circle>' +
                '</svg>' +
                '<div class="hospital-info">' +
                '<h4 class="hospital-name">'+ index.nome + '</h4>' +
                '<p class="hospital-address">' + index.rua + '</p>' +
                '<button class="hospital-delete" onclick="deleteHospital('+ index.idHospital +')">Excluir</button>' +
                '</div>';
        })
    }
}
function openModal() {
    document.getElementById('modalOverlay').style.display = 'flex';
}
function openEditModal(id_membro) {
    document.getElementById('modalEditOverlay').style.display = 'flex';
    getHospitais(id_membro);
}
function closeEditModal(){
    document.getElementById('modalEditOverlay').style.display = 'none';
}
function closeModal() {
    document.getElementById('modalOverlay').style.display = 'none';
}
function deleteHospital(id_hospital){
    const url = "http://localhost:8080/membro/hospital?id_hospital=" + id_hospital;
    fetch(url, {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => {
        if (response.ok) {
            alert("Hospital excluído com sucesso!");
            location.reload();
        } else {
            alert("Erro ao excluir hospital.");
        }
    })
    .catch(error => console.error('Erro ao excluir hospital:', error));
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
