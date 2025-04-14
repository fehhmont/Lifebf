package br.com.lifebf.servlet;

import br.com.lifebf.dao.DatabaseConnection;
import br.com.lifebf.model.Cliente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/alterarPlano")
public class AlterarPlanoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Pega a sessão e o cliente logado
        HttpSession session = request.getSession();
        Cliente cliente = (Cliente) session.getAttribute("cliente");

        if (cliente == null) {
            response.sendRedirect("login.html");
            return;
        }

        int novoPlanoId = Integer.parseInt(request.getParameter("idPlano"));

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "UPDATE cliente SET id_plano = ? WHERE id_cliente = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, novoPlanoId);
            stmt.setInt(2, cliente.getId_cliente()); // esse é o id do cliente

            stmt.executeUpdate();

            // Atualiza na sessão
            cliente.setId_plano(novoPlanoId);
            session.setAttribute("cliente", cliente);

            response.sendRedirect("/planos");
        } catch (Exception e) {
            throw new ServletException("Erro ao alterar plano", e);
        }
    }
}
