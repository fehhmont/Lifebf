package br.com.lifebf.servlet;

import br.com.lifebf.dao.ClienteDao;
import br.com.lifebf.model.Cliente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ClienteDao clienteDao = new ClienteDao();
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");

        Cliente cliente = clienteDao.getClienteDetalhadoByEmailAndSenha(email, senha);

        if (cliente != null) {
            req.getSession().setAttribute("cliente", cliente); // Salva o cliente na sessão
            resp.sendRedirect("/membros"); // Redireciona para o painel
        } else {
            resp.getWriter().write("E-mail ou senha incorretos!");
        }
    }
}