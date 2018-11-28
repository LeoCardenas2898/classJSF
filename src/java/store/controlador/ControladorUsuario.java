/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.controlador;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import store.DAO.EmpleadoDAO;
import store.DAO.UsuarioDAO;
import store.bean.Empleado;
import store.bean.Usuario;

/**
 *
 * @author Cardenas Salas
 */
@ManagedBean
@RequestScoped
public class ControladorUsuario {

    private String usuario;
    private String password;
    private Usuario user;
    private Empleado emp;
    private String message;

        
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Usuario getUser() {
        return user;
    }

    public void setUser(Usuario user) {
        this.user = user;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    public Empleado getEmp() {
        return emp;
    }

    public void setEmp(Empleado emp) {
        this.emp = emp;
    }
    
    public ControladorUsuario() {
        
    }
    
    public String login() {
        UsuarioDAO udao = new UsuarioDAO();
        EmpleadoDAO edao = new EmpleadoDAO();
        user = udao.validarUsuario(usuario, password);
        if (user != null) {
                emp = edao.buscarSegunUsuario(user.getIdempleado());  
                return "welcome.xhtml";
        } else {
               message = "No se encuentra estos datos en nuestra base de datos.";
               return "index.xhtml";
        }        
        
    }
}
