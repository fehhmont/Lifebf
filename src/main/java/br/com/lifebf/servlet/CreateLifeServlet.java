package br.com.lifebf.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-life")

public class CreateLifeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String lifeName = request.getParameter("life-name");

        System.out.println(lifeName);

        request.getRequestDispatcher("index.html").forward(request, response);

    }

}
