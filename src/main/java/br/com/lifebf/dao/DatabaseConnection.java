package br.com.lifebf.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://switchyard.proxy.rlwy.net:25558/lifebf";
    private static final String USER = "root";
    private static final String PASSWORD = "qvGPMpjHqWZuTpKWdHLGeBFGamrbeGAx";

    public static Connection getConnection() {
        try {
            // 🔧 Importante: carregar explicitamente o driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Driver JDBC do MySQL não encontrado!", e);
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao conectar com o banco de dados", e);
        }
    }
}
