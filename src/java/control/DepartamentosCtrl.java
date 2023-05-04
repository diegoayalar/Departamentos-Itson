package control;

import java.sql.SQLException;
import java.util.List;
import modelo.Departamento;
import persistencia.DepartamentosDAO;

public class DepartamentosCtrl {

    private DepartamentosDAO departamentosDAO = new DepartamentosDAO();
    
    public void agregar(Departamento departamento) throws SQLException {
        departamentosDAO.agregar(departamento);
    }
    
    public void actualizar(Departamento departamento) throws SQLException {
        departamentosDAO.actualizar(departamento);
    }
    
    public void eliminar(String id) throws SQLException {
        departamentosDAO.eliminar(id);
    }
    
    public Departamento consultar(String id) throws SQLException {
        return departamentosDAO.consultar(id);
    }
    
    public List<Departamento> consultarTodos() throws SQLException {
        return departamentosDAO.consultarTodos();
    }
}
