package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.LocalDate;
import modelo.Inquilino;
import control.InquilinosCtrl;

public class AgregarInquilino extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        String nombre = request.getParameter("nombre");
        String numeroTelefono = request.getParameter("numeroTelefono");
        String fechaInicio = request.getParameter("fechaInicioContrato");
        int montoPagoContrato = Integer.parseInt(request.getParameter("montoPagoContrato"));
        String idDepartamento = request.getParameter("idDepartamento");

        Inquilino inquilino = new Inquilino(nombre, numeroTelefono, LocalDate.parse(fechaInicio), montoPagoContrato, idDepartamento, true);
        InquilinosCtrl inquilinosCtrl = new InquilinosCtrl();
        inquilinosCtrl.agregar(inquilino);

        response.sendRedirect("inquilinos.jsp");
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
