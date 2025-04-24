package br.com.lifebf.servlet;


import br.com.lifebf.dao.DatabaseConnection;
import br.com.lifebf.model.Cliente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/alterarSenha")
public class AlterarSenhaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        HttpSession session = request.getSession();
        Cliente cliente =(Cliente) session.getAttribute("cliente");

        if (cliente== null){
            response.sendRedirect("login.html");
            return;
        }

        String novaSenha = request.getParameter("novaSenha");
        String confirmarSenha = request.getParameter("confirmarSenha");

        if ( novaSenha != null && novaSenha.equals(confirmarSenha)){
            try(Connection conn = DatabaseConnection.getConnection()){
            String sql = "UPDATE cliente SET senha = ? WHERE id_cliente =?";

                PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1,novaSenha);
                stmt.setInt(2, cliente.getId_cliente());

                stmt.executeUpdate();

                session.invalidate(); // Remove os dados da sessão
                response.sendRedirect("login.html");


            }catch (Exception e){

                throw new ServletException("Erro ao alterar Senha", e);

            }
            }





        }



    }




