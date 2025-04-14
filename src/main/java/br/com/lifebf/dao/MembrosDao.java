package br.com.lifebf.dao;

import br.com.lifebf.model.Membros;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MembrosDao {

    public boolean adicionarMembro(Membros membro) {
        String sql = "INSERT INTO membro (nome, descricao, id_cliente) VALUES (?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement psmt = conn.prepareStatement(sql)) {

            psmt.setString(1, membro.getNome());
            psmt.setString(2, membro.getDescricao());
            psmt.setInt(3, membro.getId_cliente());

            int linhasAfetadas = psmt.executeUpdate();
            return linhasAfetadas > 0;

        } catch (SQLException sqlException) {
            System.out.println(sqlException.getMessage());
            return false;
        }
    }

    public List<Membros> getMembro() {
        ResultSet rs = null;
        List<Membros> lsMembros = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT m.id_membro, m.nome, m.descricao, m.id_cliente " +
                    "FROM membro m " +
                    "JOIN cliente c ON m.id_cliente = c.id_cliente";

            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Membros membros = new Membros(
                        rs.getInt("id_membro"),
                        rs.getString("nome"),
                        rs.getString("descricao"),
                        rs.getInt("id_cliente")
                );
                lsMembros.add(membros);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return lsMembros;
    }

    public List<Membros> getMembroByCliente(int idCliente) {
        ResultSet rs = null;
        List<Membros> lsMembros = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT m.id_membro, m.nome, m.descricao, m.id_cliente " +
                    "FROM membro m " +
                    "JOIN cliente c ON m.id_cliente = c.id_cliente " +
                    "WHERE c.id_cliente = ?";

            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1, idCliente);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Membros membros = new Membros(
                        rs.getInt("id_membro"),
                        rs.getString("nome"),
                        rs.getString("descricao"),
                        rs.getInt("id_cliente")
                );
                lsMembros.add(membros);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return lsMembros;
    }

    public void excluirMembroComVinculos(int idMembro, int idCliente) {
        String sqlDeleteVinculos = "DELETE FROM membro_hospital WHERE id_membro = ?";
        String sqlDeleteMembro = "DELETE FROM membro WHERE id_membro = ? AND id_cliente = ?";

        try (Connection conn = DatabaseConnection.getConnection()) {
            conn.setAutoCommit(false); // inicia transação

            try (PreparedStatement ps1 = conn.prepareStatement(sqlDeleteVinculos);
                 PreparedStatement ps2 = conn.prepareStatement(sqlDeleteMembro)) {

                ps1.setInt(1, idMembro);
                ps1.executeUpdate();

                ps2.setInt(1, idMembro);
                ps2.setInt(2, idCliente);
                ps2.executeUpdate();

                conn.commit(); // sucesso

            } catch (SQLException e) {
                conn.rollback(); // erro => desfaz tudo
                throw new RuntimeException("Erro ao excluir membro", e);
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro de conexão", e);
        }
    }
}
