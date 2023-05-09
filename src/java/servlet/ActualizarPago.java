package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.LocalDate;
import control.PagosCtrl;
import modelo.Pago;

public class ActualizarPago extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        int idInquilino = Integer.parseInt(request.getParameter("idInquilino"));
        int mes = Integer.parseInt(request.getParameter("mes"));
        String fecha = request.getParameter("fecha");
        int monto = Integer.parseInt(request.getParameter("monto"));
        boolean estado = Boolean.parseBoolean(request.getParameter("estado"));

        Pago pago = new Pago(id, idInquilino, mes, LocalDate.parse(fecha), monto, estado);
        PagosCtrl pagosCtrl = new PagosCtrl();
        pagosCtrl.actualizar(pago);

        response.sendRedirect("pagos.jsp");
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
