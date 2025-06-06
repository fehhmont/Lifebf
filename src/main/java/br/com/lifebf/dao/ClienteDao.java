package br.com.lifebf.dao;

import br.com.lifebf.model.Cliente;
import java.sql.*;

public class ClienteDao {

    public void createCliente(Cliente cliente) {
        String SQL = "INSERT INTO cliente (nome, email, cpf, senha, plano_saude, cep, rua, numero, bairro, cidade, estado, id_plano) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(SQL)) {

            preparedStatement.setString(1, cliente.getNome());
            preparedStatement.setString(2, cliente.getEmail());
            preparedStatement.setString(3, cliente.getCpf());
            preparedStatement.setString(4, cliente.getSenha());
            preparedStatement.setString(5, cliente.getPlanoSaude());
            preparedStatement.setString(6, cliente.getCep());
            preparedStatement.setString(7, cliente.getRua());
            preparedStatement.setString(8, cliente.getNumero());
            preparedStatement.setString(9, cliente.getBairro());
            preparedStatement.setString(10, cliente.getCidade());
            preparedStatement.setString(11, cliente.getEstado());

            preparedStatement.execute();
            System.out.println("Cliente cadastrado com sucesso");

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao cadastrar cliente: " + e.getMessage(), e);
        }
    }

    public boolean loginCliente(Cliente cliente) {
        String sql = "SELECT * FROM cliente WHERE email = ? AND senha = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {

            preparedStatement.setString(1, cliente.getEmail());
            preparedStatement.setString(2, cliente.getSenha());

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next(); // Se houver resultado, login é válido
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao tentar logar: " + e.getMessage(), e);
        }
    }

    public Cliente getClienteDetalhadoByEmailAndSenha(String email, String senha) {
        String sql = "SELECT * FROM cliente c " +
                "INNER JOIN plano p ON c.id_plano = p.id_plano " +
                "WHERE c.email = ? AND c.senha = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, senha);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return new Cliente(
                            resultSet.getInt("id_cliente"),
                            resultSet.getString("nome"),
                            resultSet.getString("email"),
                            resultSet.getString("cpf"),
                            resultSet.getString("senha"),
                            resultSet.getString("plano_saude"),
                            resultSet.getString("cep"),
                            resultSet.getString("rua"),
                            resultSet.getString("numero"),
                            resultSet.getString("bairro"),
                            resultSet.getString("cidade"),
                            resultSet.getString("estado"),
                            resultSet.getInt("id_plano"),
                            resultSet.getString("nome_plano")
                    );
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar cliente detalhado", e);
        }

        return null;
    }

    public int contarMembrosPorCliente(int idCliente) {
        int total = 0;
        String sql = "SELECT COUNT(m.id_cliente) FROM membro m " +
                "INNER JOIN cliente c ON m.id_cliente = c.id_cliente " +
                "WHERE m.id_cliente = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idCliente);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                total = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return total;
    }
    public int contarHospitalPorCliente(int idCliente) {
        int total = 0;
        String sql = "SELECT COUNT(m.id_membro) " +
                "FROM hospital h " +
                "JOIN membro_hospital mh ON h.id_hospital = mh.id_hospital " +
                "JOIN membro m ON mh.id_membro = m.id_membro " +
                "JOIN cliente c ON m.id_cliente = c.id_cliente " +
                "WHERE c.id_cliente = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idCliente);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                total = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return total;
    }
}
