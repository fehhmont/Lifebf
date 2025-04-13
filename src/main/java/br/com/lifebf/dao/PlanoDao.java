package br.com.lifebf.dao;


import br.com.lifebf.model.Cliente;
import br.com.lifebf.model.Plano;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlanoDao {
    protected String database="lifebf";
    protected String user="root";
    protected String password="Admin@local";

    public Connection getConnection() throws SQLException {
        Connection conn = null;
        try {
            String url = "jdbc:mysql://localhost:3306/" + database + "?user=" + user + "&password=" + password;
            conn = DriverManager.getConnection(url);
        } catch (SQLException exception) {
            throw new SQLException(exception);
        }
        return conn;
    }
    public List<Plano> getPlanos(){
        ResultSet rs = null;
        List<Plano> lsPlanos = new ArrayList<>();
        try(Connection conn = getConnection()){
          String sql = "SELECT * FROM plano";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
                System.out.println(rs.getString("nome_plano"));
                Plano plano = new Plano(rs.getInt("id_plano"),rs.getString("nome_plano"),rs.getDouble("preco_plano"),rs.getInt("quantidade_membros") );
                lsPlanos.add(plano);
            }
        }
        catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return lsPlanos;
    }
    public Plano getPlano(int id){
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/" + database + "?user=" + user + "&password=" + password;
        String sql = "SELECT * FROM plano WHERE id_plano = ?";
        ResultSet rs = null;
        PreparedStatement psmt = null;
        Plano plano = new Plano();
        try{
            conn = DriverManager.getConnection(url);
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, id);
            rs = psmt.executeQuery();

            if(rs.next()){

                plano.setid_plano(rs.getInt("id_plano"));
                plano.setNomePlano(rs.getString("nome_plano"));
                plano.setPrecoPlano(rs.getDouble("preco_plano"));
                plano.setQuantidadeMembros(rs.getInt("quantidade_membros"));
            }
        }
        catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return plano;
    }
    public boolean validarQuantidadeMembros(Cliente cliente) {
        int quantidadeMembros = getPlano(cliente.getId_plano()).getQuantidadeMembros();
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        boolean limitePlano = false;

        try {
            String url = "jdbc:mysql://localhost:3306/" + database + "?user=" + user + "&password=" + password;
            conn = DriverManager.getConnection(url);

            String sql = "SELECT COUNT(*) AS quantidade_membros FROM membro WHERE id_cliente = ?";
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, cliente.getId_cliente());
            rs = psmt.executeQuery();

            if (rs.next()) {

                int membrosAtuais = rs.getInt("quantidade_membros");
                System.out.println("Membros atuais: " + membrosAtuais);
                System.out.println("Permitidos pelo plano: " + quantidadeMembros);
                System.out.println(membrosAtuais >= quantidadeMembros);
                limitePlano =  membrosAtuais >= quantidadeMembros;
            }

        } catch (SQLException sqlException) {
            System.out.println("Erro: " + sqlException.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (psmt != null) psmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Erro ao fechar recursos: " + e.getMessage());
            }
        }

        return limitePlano;

    }
}
