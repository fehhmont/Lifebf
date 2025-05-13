package br.com.lifebf.dao;

import br.com.lifebf.model.Cliente;
import br.com.lifebf.model.Plano;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlanoDao {

    public List<Plano> getPlanos() {
        ResultSet rs = null;
        List<Plano> lsPlanos = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM plano";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Plano plano = new Plano(
                        rs.getInt("id_plano"),
                        rs.getString("nome_plano"),
                        rs.getDouble("preco_plano"),
                        rs.getInt("quantidade_membros"),
                        rs.getInt("quantidade_endereco")
                );
                lsPlanos.add(plano);
            }

        } catch (SQLException ex) {
            System.out.println("Erro ao buscar planos: " + ex.getMessage());
        }

        return lsPlanos;
    }

    public Plano getPlano(int id) {
        Plano plano = new Plano();
        String sql = "SELECT * FROM plano WHERE id_plano = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {

            psmt.setInt(1, id);
            ResultSet rs = psmt.executeQuery();

            if (rs.next()) {
                plano.setid_plano(rs.getInt("id_plano"));
                plano.setNomePlano(rs.getString("nome_plano"));
                plano.setPrecoPlano(rs.getDouble("preco_plano"));
                plano.setQuantidadeMembros(rs.getInt("quantidade_membros"));
            }

        } catch (SQLException ex) {
            System.out.println("Erro ao buscar plano: " + ex.getMessage());
        }

        return plano;
    }

    public boolean validarQuantidadeMembros(Cliente cliente) {
        int quantidadeMembros = getPlano(cliente.getId_plano()).getQuantidadeMembros();
        boolean limitePlano = false;

        String sql = "SELECT COUNT(*) AS quantidade_membros FROM membro WHERE id_cliente = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {

            psmt.setInt(1, cliente.getId_cliente());
            ResultSet rs = psmt.executeQuery();

            if (rs.next()) {
                int membrosAtuais = rs.getInt("quantidade_membros");
                limitePlano = membrosAtuais >= quantidadeMembros;
            }

        } catch (SQLException sqlException) {
            System.out.println("Erro ao validar limite de membros: " + sqlException.getMessage());
        }

        return limitePlano;
    }
}
