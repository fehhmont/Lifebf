package br.com.lifebf.servlet;

import br.com.lifebf.dao.ClienteDao;
import br.com.lifebf.model.Cliente;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/painel")
public class painelServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cliente cliente = (Cliente) session.getAttribute("cliente");


        if (cliente == null) {
            response.sendRedirect("login.html");
            return;
        }

        int idCliente = cliente.getId_cliente();


        ClienteDao clienteDao = new ClienteDao();
        int totalMembros = clienteDao.contarMembrosPorCliente(idCliente);
        int totalHospital = clienteDao.contarHospitalPorCliente(idCliente);

        request.setAttribute("totalMembros", totalMembros);
        request.setAttribute("totalHospital",totalHospital);
        request.getRequestDispatcher("/painel/painel.jsp").forward(request, response);
    }

}
