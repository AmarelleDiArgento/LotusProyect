/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Tabs;

import java.io.Serializable;

/**
 *
 * @author Amarelle
 */
public class UsuarioTab implements Serializable {

    private String Cedula;
    private String Nombre;
    private String Apellido;
    private String Loger;
    private String Password;
    private String Extencion;
    private String Telefono;
    private String Email;
    private String Genero;
    private String Avatar;
    private Boolean Estado;
    private int RolId;
    private String nRol;

    public UsuarioTab(String Cedula, String Nombre, String Apellido, String Loger, String Password, String Extencion, String Telefono, String Email, String Genero, String Avatar, Boolean Estado, int RolId) {
        this.Cedula = Cedula;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Loger = Loger;
        this.Password = Password;
        this.Extencion = Extencion;
        this.Telefono = Telefono;
        this.Email = Email;
        this.Genero = Genero;
        this.Avatar = Avatar;
        this.Estado = Estado;
        this.RolId = RolId;
    }

    public UsuarioTab(String Cedula, String Nombre, String Apellido, String Loger, String Password, String Extencion, String Telefono, String Email, String Genero, String Avatar, Boolean Estado, int RolId, String nRol) {
        this.Cedula = Cedula;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Loger = Loger;
        this.Password = Password;
        this.Extencion = Extencion;
        this.Telefono = Telefono;
        this.Email = Email;
        this.Genero = Genero;
        this.Avatar = Avatar;
        this.Estado = Estado;
        this.RolId = RolId;
        this.nRol = nRol;
    }

    public UsuarioTab(String Cedula, String Nombre, String Apellido, String Loger, String Extencion, String Telefono, String Email, String Genero, Boolean Estado, int RolId) {
        this.Cedula = Cedula;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Loger = Loger;
        this.Extencion = Extencion;
        this.Telefono = Telefono;
        this.Email = Email;
        this.Genero = Genero;
        this.Estado = Estado;
        this.RolId = RolId;
    }
    
    public String toFullName() {
        return getNombre() + " " + getApellido();
    }

    @Override
    public String toString() {
        return "UsuarioTab{" + "Nombre=" + Nombre + ", Apellido=" + Apellido + ", Loger=" + Loger + ", Password=" + Password + ", Extencion=" + Extencion + ", Telefono=" + Telefono + ", Email=" + Email + ", Genero=" + Genero + ", Avatar=" + Avatar + ", Estado=" + Estado + ", nRol=" + nRol + '}';
    }

    /**
     * @return the Cedula
     */
    public String getCedula() {
        return Cedula;
    }

    /**
     * @param Cedula the Cedula to set
     */
    public void setCedula(String Cedula) {
        this.Cedula = Cedula;
    }

    /**
     * @return the Nombre
     */
    public String getNombre() {
        return Nombre;
    }

    /**
     * @param Nombre the Nombre to set
     */
    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    /**
     * @return the Apellido
     */
    public String getApellido() {
        return Apellido;
    }

    /**
     * @param Apellido the Apellido to set
     */
    public void setApellido(String Apellido) {
        this.Apellido = Apellido;
    }

    /**
     * @return the Loger
     */
    public String getLoger() {
        return Loger;
    }

    /**
     * @param Loger the Loger to set
     */
    public void setLoger(String Loger) {
        this.Loger = Loger;
    }

    /**
     * @return the Password
     */
    public String getPassword() {
        return Password;
    }

    /**
     * @param Password the Password to set
     */
    public void setPassword(String Password) {
        this.Password = Password;
    }

    /**
     * @return the Extencion
     */
    public String getExtencion() {
        return Extencion;
    }

    /**
     * @param Extencion the Extencion to set
     */
    public void setExtencion(String Extencion) {
        this.Extencion = Extencion;
    }

    /**
     * @return the Telefono
     */
    public String getTelefono() {
        return Telefono;
    }

    /**
     * @param Telefono the Telefono to set
     */
    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    /**
     * @return the Email
     */
    public String getEmail() {
        return Email;
    }

    /**
     * @param Email the Email to set
     */
    public void setEmail(String Email) {
        this.Email = Email;
    }

    /**
     * @return the Genero
     */
    public String getGenero() {
        return Genero;
    }

    /**
     * @param Genero the Genero to set
     */
    public void setGenero(String Genero) {
        this.Genero = Genero;
    }

    /**
     * @return the Avatar
     */
    public String getAvatar() {
        return Avatar;
    }

    /**
     * @param Avatar the Avatar to set
     */
    public void setAvatar(String Avatar) {
        this.Avatar = Avatar;
    }

    /**
     * @return the Estado
     */
    public Boolean getEstado() {
        return Estado;
    }

    /**
     * @param Estado the Estado to set
     */
    public void setEstado(Boolean Estado) {
        this.Estado = Estado;
    }

    /**
     * @return the RolId
     */
    public int getRolId() {
        return RolId;
    }

    /**
     * @param RolId the RolId to set
     */
    public void setRolId(int RolId) {
        this.RolId = RolId;
    }

    /**
     * @return the nRol
     */
    public String getnRol() {
        return nRol;
    }

    /**
     * @param nRol the nRol to set
     */
    public void setnRol(String nRol) {
        this.nRol = nRol;
    }
}
