package br.com.lifebf.servlet;

import br.com.lifebf.dao.DatabaseConnection;
import br.com.lifebf.model.Cliente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/editarInformacoes")
public class EditarInformacoesServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cliente cliente = (Cliente) session.getAttribute("cliente");

        if (cliente == null) {
            response.sendRedirect("login.html");
            return;
        }

        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String numero = request.getParameter("numero");
        String rua = request.getParameter("rua");
        String bairro = request.getParameter("bairro");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "UPDATE cliente SET nome = ?, email = ?, numero = ?, rua = ?, bairro = ? WHERE id_cliente = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nome);
            stmt.setString(2, email);
            stmt.setString(3, numero);
            stmt.setString(4, rua);
            stmt.setString(5, bairro);
            stmt.setInt(6, cliente.getId_cliente());

            stmt.executeUpdate();

            // Atualiza o cliente na sessão
            cliente.setNome(nome);
            cliente.setEmail(email);
            cliente.setNumero(numero);
            cliente.setRua(rua);
            cliente.setBairro(bairro);

            session.setAttribute("cliente", cliente);
            response.sendRedirect("painel/config.jsp");

        } catch (Exception e) {
            throw new ServletException("Erro ao editar informações", e);
        }
    }
}
