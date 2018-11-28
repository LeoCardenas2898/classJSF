/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Cardenas Salas
 */
public class Conexion {

    protected Connection cn = null;
    protected String url = "jdbc:mysql://localhost/tienda1";
    protected String usuario = "root";
    protected String clave = "";
    protected PreparedStatement ps;
    protected ResultSet rs;

    public Connection abrirConexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cn = DriverManager.getConnection(url, usuario, clave);
        } catch (Exception ex) {
            System.out.println("cn:" + ex);
        }
        return cn;
    }
    
    protected void cerrar(Connection con) throws RuntimeException {
        try {
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (SQLException se) {
            System.err.println("Error: cerrarConexion: " + se);
        }
    }

    protected void cerrar(ResultSet rs) throws RuntimeException {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException se) {
            System.err.println("Error: cerrarResultSet: " + se);
        }
    }

    protected void cerrar(PreparedStatement ps)
            throws RuntimeException {
        try {
            if (ps != null) {
                ps.close();
            }
        } catch (SQLException se) {
            System.err.println("Error: cerrarStatement: " + se);
        }
}

}
