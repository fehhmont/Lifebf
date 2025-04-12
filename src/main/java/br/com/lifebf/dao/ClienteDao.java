package br.com.lifebf.dao;


import br.com.lifebf.model.Cliente;
import java.sql.*;
import com.mysql.cj.protocol.Resultset;

public class ClienteDao {

    public void createCliente(Cliente cliente) {

        String SQL = "INSERT INTO cliente (nome,email,cpf,senha,plano_saude,cep,rua,numero,bairro,cidade,estado,id_plano) VALUES (?,?,?,?,?,?,?,?,?,?,?,1)";

        Connection conn = null;

        try {

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifebf", "root", "Admin@local");

            System.out.println("Success in database connection");

            PreparedStatement preparedStatement = conn.prepareStatement(SQL);


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
            System.out.println("cadastrado com sucesso");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            // Fecha a conexão no bloco finally para garantir que será fechada mesmo em caso de erro
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error closing connection: " + ex.getMessage());
            }
        }
    }


    public boolean loginCliente(Cliente cliente) {
        String sql = "SELECT * FROM cliente WHERE email = ? AND senha = ?";
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifebf", "root", "Admin@local");
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {

            preparedStatement.setString(1, cliente.getEmail());
            preparedStatement.setString(2, cliente.getSenha());

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next(); // Se houver um resultado, o login está correto
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao tentar logar: " + e.getMessage());
        }
    }

    public Cliente getClienteDetalhadoByEmailAndSenha(String email, String senha) {
        String sql = "SELECT * FROM cliente WHERE email = ? AND senha = ?";
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lifebf", "root", "Admin@local");
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, senha);
            ResultSet resultSet = preparedStatement.executeQuery();

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
                        resultSet.getString("estado")
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar cliente", e);
        }
        return null;
    }
}


