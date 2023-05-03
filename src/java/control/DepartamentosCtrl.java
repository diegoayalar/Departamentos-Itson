package control;

import java.sql.SQLException;
import java.util.List;
import modelo.Departamento;
import persistencia.DepartamentosDAO;

public class DepartamentosCtrl {

    private final DepartamentosDAO departamentosDAO = new DepartamentosDAO();
    
    public Departamento consultar(String id) throws SQLException {
        return departamentosDAO.consultar(id);
    }
    
    public List<Departamento> consultarTodos() throws SQLException {
        return departamentosDAO.consultarTodos();
    }
}
