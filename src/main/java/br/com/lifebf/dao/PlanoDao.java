package br.com.lifebf.dao;


import br.com.lifebf.model.Plano;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlanoDao {
    protected String database="lifebf";
    protected String user="root";
    protected String password="";
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
                Plano plano = new Plano(rs.getString("nome_plano"),rs.getDouble("preco_plano"),rs.getInt("quantidade_membros") );
                lsPlanos.add(plano);
            }
        }
        catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return lsPlanos;
    }
}
