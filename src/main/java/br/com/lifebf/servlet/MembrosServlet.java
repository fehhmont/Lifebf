package br.com.lifebf.servlet;

import br.com.lifebf.dao.MembrosDao;
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
}
