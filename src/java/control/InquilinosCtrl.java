package control;

import java.sql.SQLException;
import java.util.List;
import modelo.Inquilino;
import persistencia.InquilinosDAO;

public class InquilinosCtrl {

    private InquilinosDAO inquilinosDAO = new InquilinosDAO();
    
    public void agregar(Inquilino inquilino) throws SQLException {
        inquilinosDAO.agregar(inquilino);
    }
    
    public void actualizar(Inquilino inquilino) throws SQLException {
        inquilinosDAO.actualizar(inquilino);
    }
    
    public void eliminar(String id) throws SQLException {
        inquilinosDAO.eliminar(id);
    }
    
    public Inquilino consultar(String id) throws SQLException {
        return inquilinosDAO.consultar(id);
    }
    
    public List<Inquilino> consultarTodos() throws SQLException {
        return inquilinosDAO.consultarTodos();
    }
}
