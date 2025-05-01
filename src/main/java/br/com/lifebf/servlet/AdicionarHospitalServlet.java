package br.com.lifebf.servlet;


import br.com.lifebf.dao.HospitalDao;
import br.com.lifebf.model.Hospital;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/hospital")
@MultipartConfig
public class AdicionarHospitalServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HospitalDao hospitalDao = new HospitalDao();
        String nome = req.getParameter("nome");
        String  cep = req.getParameter("cep");
        String rua = req.getParameter("rua");
        String estado = req.getParameter("estado");
        String numero = req.getParameter("numero");
        String bairro = req.getParameter("bairro");
        int idMembro = Integer.parseInt(req.getParameter("id_membro"));
        BigDecimal latitude = new BigDecimal(req.getParameter("latitude"));
        BigDecimal longitude = new BigDecimal(req.getParameter("longitude"));
        Hospital hospital = new Hospital();
        hospital.setNome(nome);
        hospital.setCep(cep);
        hospital.setRua(rua);
        hospital.setEstado(estado);
        hospital.setNumero(numero);
        hospital.setBairro(bairro);
        hospital.setLatitude(latitude);
        hospital.setLongitude(longitude);
        hospital.setIdMembro(idMembro);

        hospitalDao.adicionarHospital(hospital);

    }
}
