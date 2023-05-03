package servlet;

import control.DepartamentosCtrl;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import modelo.Departamento;

public class ActualizarDepartamento extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        String id = request.getParameter("id");
        String ubicacion = request.getParameter("ubicacion");
        int precio = Integer.parseInt(request.getParameter("precio"));

        Departamento departamento = new Departamento(id, ubicacion, precio);
        DepartamentosCtrl departamentosCtrl = new DepartamentosCtrl();
        departamentosCtrl.actualizar(departamento);

        response.sendRedirect("departamentos.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

}
