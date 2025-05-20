package br.com.lifebf.servlet;

import br.com.lifebf.dao.PlanoDao;
import br.com.lifebf.model.Plano;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/plano")
public class PlanoIndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        PlanoDao planoDao = new PlanoDao();
        List<Plano> lsPlanos = planoDao.getPlanos();
        req.setAttribute("planos", lsPlanos);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/servicos.jsp");
        dispatcher.forward(req, resp);
    }
}