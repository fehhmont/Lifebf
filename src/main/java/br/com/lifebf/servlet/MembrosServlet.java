package br.com.lifebf.servlet;

import br.com.lifebf.dao.MembrosDao;
import br.com.lifebf.dao.PlanoDao;
import br.com.lifebf.model.Cliente;
import br.com.lifebf.model.Membros;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/membros")
public class MembrosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MembrosDao membrosDao = new MembrosDao();

        Cliente cliente = (Cliente) req.getSession().getAttribute("cliente");

        if (cliente == null) {
            resp.sendRedirect("login.html");
            return;
        }

        int idCliente = cliente.getId_cliente();
        List<Membros> lsMembro = membrosDao.getMembroByCliente(idCliente);
        req.setAttribute("membro", lsMembro);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/painel/membros.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cliente cliente = (Cliente) req.getSession().getAttribute("cliente");

        if (cliente == null) {
            resp.sendRedirect("login.html");
            return;
        }

        PlanoDao planoDao = new PlanoDao();
        MembrosDao membrosDao = new MembrosDao();

        boolean validarQuantidadeMembros = planoDao.validarQuantidadeMembros(cliente);
        String nomeMembro = req.getParameter("nome_membro");
        String descricao = req.getParameter("descricao");

        if (!validarQuantidadeMembros) {
            Membros membro = new Membros();
            membro.setNome(nomeMembro);
            membro.setDescricao(descricao);
            membro.setId_cliente(cliente.getId_cliente());
            boolean result = membrosDao.adicionarMembro(membro);

            if (result) {

                resp.sendRedirect("membros?sucesso=1");
            } else {
                // Encaminha com mensagem de erro
                req.setAttribute("mensagemErro", "Falha ao adicionar membro.");
                doGet(req, resp);
            }
        } else {
            // Encaminha com mensagem de erro
            req.setAttribute("mensagemErro", "Quantidade máxima de membros atingida.");
            doGet(req, resp);
        }
    }
}