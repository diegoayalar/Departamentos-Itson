package persistencia;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;
import modelo.Pago;

public class PagosDAO extends ConexionBD {

    public void agregar(Pago pago) throws SQLException {
        String sql = "INSERT INTO pagos"
                + "(id_inquilino, mes, fecha,"
                + "monto, estado) VALUES (?, ?, ?, ?, ?)";
        try ( PreparedStatement pst = getConexion().prepareStatement(sql)) {
            pst.setInt(1, pago.getIdInquilino());
            pst.setInt(2, pago.getMes());
            pst.setDate(3, Date.valueOf(pago.getFecha()));
            pst.setInt(4, pago.getMonto());
            pst.setString(5, pago.getEstado());
            pst.executeUpdate();
        }
    }

    public void actualizar(Pago pago) throws SQLException {
        String sql = "UPDATE pagos SET "
                + "id_inquilino = ?, mes = ?, fecha = ?,"
                + "monto = ?, estado = ? "
                + "WHERE id_pago = ?";

        try ( PreparedStatement pst = getConexion().prepareStatement(sql)) {
            pst.setInt(1, pago.getIdInquilino());
            pst.setInt(2, pago.getMes());
            pst.setDate(3, Date.valueOf(pago.getFecha()));
            pst.setInt(4, pago.getMonto());
            pst.setString(5, pago.getEstado());
            pst.setInt(6, pago.getId());
            pst.executeUpdate();
        }
    }

    public void eliminar(String id) throws SQLException {
        String sql = "DELETE FROM pagos WHERE id_pago = ?";
        try ( PreparedStatement pst = getConexion().prepareStatement(sql)) {
            pst.setString(1, id);
            pst.executeUpdate();
        }
    }

    public Pago consultar(String id) throws SQLException {
        Pago pago = null;
        String sql = "CALL selectPago(?)";
        try ( PreparedStatement pst = getConexion().prepareCall(sql)) {
            pst.setString(1, id);
            try ( ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    pago = new Pago(
                            rs.getInt("id_pago"),
                            rs.getInt("id_inquilino"),
                            rs.getInt("mes"),
                            LocalDate.parse(rs.getString("fecha")),
                            rs.getInt("monto"),
                            rs.getString("estado")
                    );
                }
            }
        }
        return pago;
    }

    public List<Pago> consultarTodos() throws SQLException {
        List<Pago> pagos = new ArrayList<>();
        String sql = "CALL selectPagos()";
        try ( PreparedStatement pst = getConexion().prepareStatement(sql);  ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                Pago pago = new Pago(
                        rs.getInt("id_pago"),
                        rs.getInt("id_inquilino"),
                        rs.getInt("mes"),
                        LocalDate.parse(rs.getString("fecha")),
                        rs.getInt("monto"),
                        rs.getString("estado")
                );
                pagos.add(pago);
            }
        }
        return pagos;
    }
}
