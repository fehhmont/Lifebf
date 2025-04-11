package br.com.lifebf.servlet;

import br.com.lifebf.dao.MembrosDao;
import br.com.lifebf.model.Cliente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/excluir-membro")
public class ExcluirMembroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Cliente cliente = (Cliente) req.getSession().getAttribute("cliente");
        if (cliente == null) {
            resp.sendRedirect("login.html");
            return;
        }

        String idStr = req.getParameter("id");

        if (idStr != null) {
            try {
                int idMembro = Integer.parseInt(idStr);
                int idCliente = cliente.getId_cliente();

                MembrosDao dao = new MembrosDao();
                dao.excluirMembroComVinculos(idMembro, idCliente);

            } catch (NumberFormatException e) {
                e.printStackTrace(); // log
            }
        }

        resp.sendRedirect("/membros"); // volta pra lista
    }
}
