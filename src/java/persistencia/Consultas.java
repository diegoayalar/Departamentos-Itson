package persistencia;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Consultas extends ConexionBD {

    public boolean autenticacion(String usuario, String clave) {
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String consulta = "SELECT * FROM usuarios WHERE nombre=? AND password=?";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, clave);
            rs = pst.executeQuery();

            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.err.println("Error en autenticación: " + e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
            } catch (SQLException e) {
                System.err.println("Error cerrando objetos: " + e);
            }
        }
        return false;
    }

    public boolean registrar(String usuario, String clave) {
        PreparedStatement pst = null;
        try {
            String consulta = "INSERT INTO usuarios (nombre, password) VALUES (?, ?)";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, clave);
            return pst.executeUpdate() == 1;
        } catch (SQLException e) {
            System.err.println("Error en registro: " + e);
        } finally {
            try {
                if (pst != null) pst.close();
            } catch (SQLException e) {
                System.err.println("Error cerrando objeto PreparedStatement: " + e);
            }
        }
        return false;
    }
}