package br.com.lifebf.dao;

import br.com.lifebf.model.Hospital;

import java.math.BigDecimal;
import java.sql.*;

public class HospitalDao {
    public void adicionarHospital(Hospital hospital){
        try(Connection conn = DatabaseConnection.getConnection()){
            String sql = "INSERT INTO hospital (nome, cep, rua, numero, bairro, estado, latitude, longitude) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement psmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            psmt.setString(1, hospital.getNome());
            psmt.setString(2, hospital.getCep());
            psmt.setString(3, hospital.getRua());
            psmt.setString(4, hospital.getNumero());
            psmt.setString(5, hospital.getBairro());
            psmt.setString(6, hospital.getEstado());
            psmt.setBigDecimal(7, hospital.getLatitude());
            psmt.setBigDecimal(8, hospital.getLongitude());
            int rowsAffected = psmt.executeUpdate();
            if(rowsAffected > 0){
                ResultSet rs = psmt.getGeneratedKeys();
                if(rs.next()){
                    int idHospital = rs.getInt(1);
                    adicionarMembroHospital(idHospital, hospital.getIdMembro());
                }
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void adicionarMembroHospital(int idHospital, int idMembro){
        try(Connection conn = DatabaseConnection.getConnection()){
             String sql = "INSERT INTO membro_hospital (id_membro, id_hospital) VALUES(?,?)";
             PreparedStatement psmt = conn.prepareStatement(sql);
             psmt.setInt(1, idMembro);
             psmt.setInt(2, idHospital);
             psmt.execute();
             System.out.println("Membro hospital adicionado");
        }
        catch (SQLException e){
            throw  new RuntimeException(e);
        }
    }

}
