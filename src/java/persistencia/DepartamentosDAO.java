package persistencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Departamento;

public class DepartamentosDAO extends ConexionBD {

    public void agregar(Departamento departamento) throws SQLException {
        String sql = "INSERT INTO departamentos (id_departamento, ubicacion, precio) VALUES (?, ?, ?)";
        try ( PreparedStatement pst = getConexion().prepareStatement(sql)) {
            pst.setString(1, departamento.getId());
            pst.setString(2, departamento.getUbicacion());
            pst.setInt(3, departamento.getPrecio());
            pst.executeUpdate();
        }
    }

    public void actualizar(Departamento departamento) throws SQLException {
        String sql = "UPDATE departamentos SET id_departamento = ?, ubicacion = ?, precio = ? WHERE id_departamento = ?";
        try ( PreparedStatement pst = getConexion().prepareStatement(sql)) {
            pst.setString(1, departamento.getId());
            pst.setString(2, departamento.getUbicacion());
            pst.setInt(3, departamento.getPrecio());
            pst.setString(4, departamento.getId());
            pst.executeUpdate();
        }
    }

    public void eliminar(String id) throws SQLException {
        String sql = "DELETE FROM departamentos WHERE id_departamento = ?";
        try ( PreparedStatement pst = getConexion().prepareStatement(sql)) {
            pst.setString(1, id);
            pst.executeUpdate();
        }
    }

    public Departamento consultar(String id) throws SQLException {
        Departamento departamento = null;
        String sql = "CALL selectDepartamento(?)";
        try ( PreparedStatement pst = getConexion().prepareCall(sql)) {
            pst.setString(1, id);
            try ( ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    departamento = new Departamento(
                            rs.getString("id_departamento"),
                            rs.getString("ubicacion"),
                            rs.getInt("precio")
                    );
                }
            }
        }
        return departamento;
    }

    public List<Departamento> consultarTodos() throws SQLException {
        List<Departamento> departamentos = new ArrayList<>();
        String sql = "CALL selectDepartamentos()";
        try ( PreparedStatement pst = getConexion().prepareStatement(sql);  ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                Departamento departamento = new Departamento(
                        rs.getString("id_departamento"),
                        rs.getString("ubicacion"),
                        rs.getInt("precio"));
                departamentos.add(departamento);
            }
        }
        return departamentos;
    }
}
