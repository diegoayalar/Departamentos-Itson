package servlet;

import control.DepartamentosCtrl;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

public class EliminarDepartamento extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        String id = request.getParameter("id");

        DepartamentosCtrl departamentosCtrl = new DepartamentosCtrl();
        try {
            // Intentar eliminar el departamento
            departamentosCtrl.eliminar(id);

            // Si el departamento se elimina correctamente, redirigir a la página de inicio
            response.sendRedirect("departamentos.jsp");

        } catch (SQLIntegrityConstraintViolationException e) {
            // Si se produce una excepción de violación de integridad de clave externa,
            // mostrar un mensaje de error y redirigir a la página de inicio
            request.setAttribute("mensaje", "No se puede eliminar el departamento porque tiene referencias.");
            response.sendRedirect("departamentos.jsp");

        } catch (SQLException e) {
            // Si se produce cualquier otra excepción de SQL, mostrar un mensaje de error y redirigir a la página de inicio
            request.setAttribute("mensaje", "Error al eliminar el departamento: " + e.getMessage());
            response.sendRedirect("departamentos.jsp");
        }
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