package br.com.lifebf.servlet;

import br.com.lifebf.dao.ClienteDao;
import br.com.lifebf.model.Cliente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-life")
public class ClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String lifeName = request.getParameter("nome");
        String lifeemail = request.getParameter("email");
        String lifecpf = request.getParameter("cpf");
        String lifesenha = request.getParameter("senha");
        String lifeplanoSaude = request.getParameter("planoSaude");
        String lifecep = request.getParameter("cep");
        String liferua = request.getParameter("rua");
        String lifenumero = request.getParameter("numero");
        String lifebairro = request.getParameter("bairro");
        String lifecidade = request.getParameter("cidade");
        String lifeestado = request.getParameter("estado");

        Cliente cliente = new Cliente();

        cliente.setNome(lifeName);
        cliente.setEmail(lifeemail);
        cliente.setCpf(lifecpf);
        cliente.setSenha(lifesenha);
        cliente.setPlanoSaude(lifeplanoSaude);
        cliente.setCep(lifecep);
        cliente.setRua(liferua);
        cliente.setNumero(lifenumero);
        cliente.setBairro(lifebairro);
        cliente.setCidade(lifecidade);
        cliente.setEstado(lifeestado);

        ClienteDao clienteDao = new ClienteDao();

        try {
            clienteDao.createCliente(cliente);
            // Sucesso: encaminha para página de membros
            response.sendRedirect("login.html?sucesso=1");

        } catch (RuntimeException e) {
            // Falha: volta para tela de cadastro com parâmetro de erro
            response.sendRedirect("cadastro.html?erro=1");
        }
    }
}
