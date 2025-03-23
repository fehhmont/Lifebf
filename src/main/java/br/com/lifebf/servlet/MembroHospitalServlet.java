package br.com.lifebf.servlet;

import br.com.lifebf.dao.DatabaseConnection;
import br.com.lifebf.model.Hospital;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/membro/hospital")
public class MembroHospitalServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String membroIdParam = request.getParameter("id_membro");

        if (membroIdParam == null || membroIdParam.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"erro\": \"ID do membro é obrigatório\"}");
            return;
        }

        int membroId;
        try {
            membroId = Integer.parseInt(membroIdParam);
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"erro\": \"ID do membro deve ser um número válido\"}");
            return;
        }

        List<Hospital> hospitais = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT h.id_hospital, h.nome, h.cep, h.rua, h.numero, h.bairro, h.estado, m.id_membro, h.latitude, h.longitude " +
                    "FROM hospital h " +
                    "JOIN membro_hospital mh ON h.id_hospital = mh.id_hospital " +
                    "JOIN membro m ON mh.id_membro = m.id_membro " +
                    "WHERE m.id_membro = ?";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, membroId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                hospitais.add(new Hospital(
                        rs.getInt("id_hospital"),
                        rs.getString("nome"),
                        rs.getString("cep"),
                        rs.getString("rua"),
                        rs.getInt("numero"),
                        rs.getString("bairro"),
                        rs.getString("estado"),
                        rs.getBigDecimal("latitude"),
                        rs.getBigDecimal("longitude"),
                        rs.getInt("id_membro")
                ));
            }

            String json = new Gson().toJson(hospitais);
            PrintWriter out = response.getWriter();
            out.print(json);
            out.flush();

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"erro\": \"Erro ao buscar hospitais: " + e.getMessage() + "\"}");
        }
    }
}
