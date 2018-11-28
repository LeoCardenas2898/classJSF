/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import store.bean.Empleado;
import store.connection.Conexion;

/**
 *
 * @author Cardenas Salas
 */
public class EmpleadoDAO extends Conexion {

    Empleado emp;

    public Empleado buscarSegunUsuario(int id) {
        String sql = "select * from empleado where idempleado=?";
        cn = abrirConexion();
        try {
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            if(rs.next()){
                emp = new Empleado();
                emp.setIdempleado(rs.getInt(1));
                emp.setNombre(rs.getString(2));
                emp.setPaterno(rs.getString(3));
                emp.setMaterno(rs.getString(4));
                emp.setCargo(rs.getString(5));
            }
        } catch (SQLException ex) {
            emp = null;
        } finally {
            cerrar(cn);
            cerrar(ps);
            cerrar(rs);
        }
        return emp;
    }
    
    public ArrayList<Empleado> list() {
        ArrayList<Empleado> lista = new ArrayList<>();
        Empleado emp;
        String sql = "select * from empleado";
        try {
            cn = abrirConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                emp = new Empleado();
                emp.setIdempleado(rs.getInt(1));
                emp.setNombre(rs.getString(2));
                emp.setPaterno(rs.getString(3));
                emp.setMaterno(rs.getString(4));
                emp.setCargo(rs.getString(5));
                lista.add(emp);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrar(cn);
            cerrar(ps);
            cerrar(rs);
        }
        return lista;

    }

    public void insert(Empleado e) {
        String sql = "INSERT INTO empleado (nombre,apepaterno,apematerno,cargo) VALUES (?,?,?,?)";
        try {
            cn = abrirConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getPaterno());
            ps.setString(3, e.getMaterno());
            ps.setString(4, e.getCargo());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrar(cn);
            cerrar(ps);
        }
    }

    public void update(Empleado e) {
        String sql = "update empleado set nombre=?, apepaterno=?, apematerno=?, cargo=? where idempleado=?";
        try {
            cn = abrirConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, e.getNombre());
            ps.setString(2, e.getPaterno());
            ps.setString(3, e.getMaterno());
            ps.setString(4, e.getCargo());
            ps.setInt(5, e.getIdempleado());
            ps.executeUpdate();
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrar(cn);
            cerrar(ps);
            cerrar(rs);
        }
    }
    
        public void delete(int cod) {
        String sql = "delete from empleado where idempleado=?";
        try {
            cn = abrirConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, cod);
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrar(cn);
            cerrar(ps);
            cerrar(rs);
        }
    }
}
