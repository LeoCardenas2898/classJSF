/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store.controlador;

import java.util.ArrayList;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import store.DAO.EmpleadoDAO;
import store.bean.Empleado;

/**
 *
 * @author Cardenas Salas
 */
@ManagedBean
@RequestScoped
public class ControladorEmpleado {

    private Empleado emp = new Empleado();
    ArrayList<Empleado> listEmpleado;   
    private String resultado;

    public String getResultado() {
        return resultado;
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }

    public Empleado getEmp() {
        return emp;
    }

    public void setEmp(Empleado emp) {
        this.emp = emp;
    }

    public ArrayList<Empleado> getListEmpleado() {
        return listEmpleado;
    }

    public void setListEmpleado(ArrayList<Empleado> listEmpleado) {
        this.listEmpleado = listEmpleado;
    }

    @PostConstruct
    public void init() {
        listar();
    }

    public void listar() {
        EmpleadoDAO edao = new EmpleadoDAO();
        listEmpleado = edao.list();
    }

    public void agregar() {
        EmpleadoDAO edao = new EmpleadoDAO();
        if (emp.getNombre().isEmpty()) {
            resultado = "Alerta: No se puede dejar el campo nombre vacio";
        } else if (emp.getPaterno().isEmpty()) {
            resultado = "Alerta: No se puede dejar el campo Paterno vacio";
        } else if (emp.getMaterno().isEmpty()) {
            resultado = "Alerta: No se puede dejar el campo Materno vacio";
        } else if (emp.getCargo().isEmpty()) {
            resultado = "Alerta: No se puede dejar el campo Cargo vacio";
        } else {
            edao.insert(emp);
            listar();
        }
    }

    public void eliminar() {
        EmpleadoDAO edao = new EmpleadoDAO();
        edao.delete(emp.getIdempleado());
        if (edao.buscarSegunUsuario(emp.getIdempleado()) == null) {
            resultado = "Empleado eliminado con éxito";
        }
        listar();
    }

    public void modificar() {
        EmpleadoDAO edao = new EmpleadoDAO();
        if (edao.buscarSegunUsuario(emp.getIdempleado()) == null) {
            resultado = "No se encuentra el usuario correspondiente";
        } else if (emp.getNombre().isEmpty()) {
            resultado = "Alerta: No se puede dejar el campo Nombre vacio";
        } else if (emp.getPaterno().isEmpty()) {
            resultado = "Alerta: No se puede dejar el campo Paterno vacio";
        } else if (emp.getMaterno().isEmpty()) {
            resultado = "Alerta: No se puede dejar el campo Materno vacio";
        } else if (emp.getCargo().isEmpty()) {
            resultado = "Alerta: No se puede dejar el campo Cargo vacio";
        } else {
            edao.update(emp);
            listar();
        }
    }
    public ControladorEmpleado() {

    }

}
