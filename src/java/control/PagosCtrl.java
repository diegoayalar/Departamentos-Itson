package control;

import java.sql.SQLException;
import java.util.List;
import modelo.Pago;
import persistencia.PagosDAO;

public class PagosCtrl {

    private PagosDAO pagosDAO = new PagosDAO();
    
    public void agregar(Pago pago) throws SQLException {
        pagosDAO.agregar(pago);
    }
    
    public void actualizar(Pago pago) throws SQLException {
        pagosDAO.actualizar(pago);
    }
    
    public void eliminar(String id) throws SQLException {
        pagosDAO.eliminar(id);
    }
    
    public Pago consultar(String id) throws SQLException {
        return pagosDAO.consultar(id);
    }
    
    public List<Pago> consultarTodos() throws SQLException {
        return pagosDAO.consultarTodos();
    }
}
