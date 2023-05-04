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

public class ActualizarInquilino extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String numeroTelefono = request.getParameter("numeroTelefono");
        String fechaInicio = request.getParameter("fechaInicioContrato");
        int montoPagoContrato = Integer.parseInt(request.getParameter("montoPagoContrato"));
        String idDepartamento = request.getParameter("idDepartamento");
        boolean estado = Boolean.parseBoolean(request.getParameter("estado"));

        Inquilino inquilino = new Inquilino(id, nombre, numeroTelefono, LocalDate.parse(fechaInicio), montoPagoContrato, idDepartamento, estado);
        InquilinosCtrl inquilinosCtrl = new InquilinosCtrl();
        inquilinosCtrl.actualizar(inquilino);

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
