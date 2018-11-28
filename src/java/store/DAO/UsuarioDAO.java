/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.DAO;

import java.sql.SQLException;
import store.bean.Usuario;
import store.connection.Conexion;

/**
 *
 * @author Cardenas Salas
 */
public class UsuarioDAO extends Conexion{
    
    public Usuario validarUsuario(String us, String pas) {
        Usuario user = null;
        String sql = "select * from usuario where usuario=? and password=?";
        cn = abrirConexion();
        try {
            ps = cn.prepareStatement(sql);
            ps.setString(1, us);
            ps.setString(2, pas);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                user = new Usuario();
                user.setIdusuario(rs.getInt(1));
                user.setUsuario(rs.getString(2));
                user.setClave(rs.getString(3));
                user.setEstado(rs.getString(4));
                user.setIdempleado(rs.getInt(5));
            }

        } catch (SQLException ex) {
            user = null;
        } finally {
            cerrar(cn);
            cerrar(ps);
            cerrar(rs);
        }
        return user;
    }
   
}
