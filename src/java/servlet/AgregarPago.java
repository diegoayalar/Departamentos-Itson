package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.LocalDate;
import control.PagosCtrl;
import java.time.temporal.ChronoUnit;
import modelo.Pago;

public class AgregarPago extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        int idInquilino = Integer.parseInt(request.getParameter("idInquilino"));
        int mes = Integer.parseInt(request.getParameter("mes"));
        LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));
        int monto = Integer.parseInt(request.getParameter("monto"));

        String estado;
         LocalDate fechaActual = LocalDate.now();
        long diasDiferencia = ChronoUnit.DAYS.between(fechaActual, fecha);
        
        if(diasDiferencia >= 1){
            estado = "Pendiente";
        } else{
            estado = "Pagado";
        }
        Pago pago = new Pago(idInquilino, mes, fecha, monto, estado);
        PagosCtrl pagosCtrl = new PagosCtrl();
        pagosCtrl.agregar(pago);

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
