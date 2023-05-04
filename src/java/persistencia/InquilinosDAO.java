package persistencia;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;
import modelo.Inquilino;

public class InquilinosDAO extends ConexionBD {

    public void agregar(Inquilino inquilino) throws SQLException {
        String sql = "INSERT INTO inquilinos"
                + "(id_inquilino, nombre, numero_telefono, inicio_contrato,"
                + "monto_pago_contrato, id_departamento, estado)"
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try ( PreparedStatement pst = getConexion().prepareStatement(sql)) {
            pst.setInt(1, inquilino.getId());
            pst.setString(2, inquilino.getNombre());
            pst.setString(3, inquilino.getNumeroTelefono());
            pst.setDate(4, Date.valueOf(inquilino.getInicioContrato()));
            pst.setInt(5, inquilino.getMontoPagoContrato());
            pst.setString(6, inquilino.getIdDepartamento());
            pst.setBoolean(7, inquilino.getEstado());
            pst.executeUpdate();
        }
    }

    public void actualizar(Inquilino inquilino) throws SQLException {
        String sql = "UPDATE inquilinos SET "
                + "nombre = ?, numero_telefono = ?, inicio_contrato = ?,"
                + "monto_pago_contrato = ?, id_departamento = ?, estado = ? "
                + "WHERE id_inquilino = ?";
        
        try ( PreparedStatement pst = getConexion().prepareStatement(sql)) {
            pst.setString(1, inquilino.getNombre());
            pst.setString(2, inquilino.getNumeroTelefono());
            pst.setDate(3, Date.valueOf(inquilino.getInicioContrato()));
            pst.setInt(4, inquilino.getMontoPagoContrato());
            pst.setString(5, inquilino.getIdDepartamento());
            pst.setBoolean(6, inquilino.getEstado());
            pst.setInt(7, inquilino.getId());
            pst.executeUpdate();
        }
    }

    public void eliminar(String id) throws SQLException {
        String sql = "DELETE FROM inquilinos WHERE id_inquilino = ?";
        try ( PreparedStatement pst = getConexion().prepareStatement(sql)) {
            pst.setString(1, id);
            pst.executeUpdate();
        }
    }
    
        public Inquilino consultar(String id) throws SQLException {
        Inquilino inquilino = null;
        String sql = "CALL selectInquilino(?)";
        try ( PreparedStatement pst = getConexion().prepareCall(sql)) {
            pst.setString(1, id);
            try ( ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    inquilino = new Inquilino(
                            rs.getInt("id_inquilino"),
                            rs.getString("nombre"),
                            rs.getString("nombre"),
                            LocalDate.parse(rs.getString("inicio_contrato")),
                            rs.getInt("monto_pago_contrato"),
                            rs.getString("id_departamento"),
                            rs.getBoolean("estado")
                    );
                }
            }
        }
        return inquilino;
    }

    public List<Inquilino> consultarTodos() throws SQLException {
        List<Inquilino> inquilinos = new ArrayList<>();
        String sql = "CALL selectInquilinos()";
        try ( PreparedStatement pst = getConexion().prepareStatement(sql);  ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                Inquilino inquilino = new Inquilino(
                        rs.getInt("id_inquilino"),
                        rs.getString("nombre"),
                        rs.getString("numero_telefono"),
                        LocalDate.parse(rs.getString("inicio_contrato")),
                        rs.getInt("monto_pago_contrato"),
                        rs.getString("id_departamento"),
                        rs.getBoolean("estado"));
                inquilinos.add(inquilino);
            }
        }
        return inquilinos;
    }
}
