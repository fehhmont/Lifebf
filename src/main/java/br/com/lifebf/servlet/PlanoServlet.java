package br.com.lifebf.servlet;

import br.com.lifebf.dao.PlanoDao;
import br.com.lifebf.model.Plano;
import com.google.gson.Gson;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/planos")
public class PlanoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PlanoDao planoDao = new PlanoDao();
        List<Plano> lsPlanos = planoDao.getPlanos();
        req.setAttribute("planos", lsPlanos);

        System.out.println(lsPlanos.size());
        for (Plano plano : lsPlanos) {
            System.out.println("DEBUG => " + plano.getNome_plano());
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher("/planos.jsp");
        dispatcher.forward(req, resp);
    }
}
