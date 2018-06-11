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
public class ClienteTab implements Serializable{
    private int Id;
    private String Nombre;
    private String IdUsu;
    private String NombreUsu;
    private String Local;
    private String Logo;
    private Boolean Estado;

    public ClienteTab(String Nombre, String IdUsu, String Local, String Logo, Boolean Estado) {
        this.Nombre = Nombre;
        this.IdUsu = IdUsu;
        this.Local = Local;
        this.Logo = Logo;
        this.Estado = Estado;
    }

    public ClienteTab(int Id, String Nombre, String IdUsu, String Local, String Logo, Boolean Estado) {
        this.Id = Id;
        this.Nombre = Nombre;
        this.IdUsu = IdUsu;
        this.Local = Local;
        this.Logo = Logo;
        this.Estado = Estado;
    }

    public ClienteTab(int Id, String Nombre, String IdUsu, String NombreUsu, String Local, String Logo, Boolean Estado) {
        this.Id = Id;
        this.Nombre = Nombre;
        this.IdUsu = IdUsu;
        this.NombreUsu = NombreUsu;
        this.Local = Local;
        this.Logo = Logo;
        this.Estado = Estado;
    }

    /**
     * @return the Id
     */
    public int getId() {
        return Id;
    }

    /**
     * @param Id the Id to set
     */
    public void setId(int Id) {
        this.Id = Id;
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
     * @return the IdUsu
     */
    public String getIdUsu() {
        return IdUsu;
    }

    /**
     * @param IdUsu the IdUsu to set
     */
    public void setIdUsu(String IdUsu) {
        this.IdUsu = IdUsu;
    }

    /**
     * @return the NombreUsu
     */
    public String getNombreUsu() {
        return NombreUsu;
    }

    /**
     * @param NombreUsu the NombreUsu to set
     */
    public void setNombreUsu(String NombreUsu) {
        this.NombreUsu = NombreUsu;
    }

    /**
     * @return the Local
     */
    public String getLocal() {
        return Local;
    }

    /**
     * @param Local the Local to set
     */
    public void setLocal(String Local) {
        this.Local = Local;
    }

    /**
     * @return the Logo
     */
    public String getLogo() {
        return Logo;
    }

    /**
     * @param Logo the Logo to set
     */
    public void setLogo(String Logo) {
        this.Logo = Logo;
    }

    /**
     * @return the Estado
     */
    public Boolean isEstado() {
        return Estado;
    }

    /**
     * @param Estado the Estado to set
     */
    public void setEstado(Boolean Estado) {
        this.Estado = Estado;
    }

    @Override
    public String toString() {
        return "ClienteTab{" + "Id=" + Id + ", Nombre=" + Nombre + ", IdUsu=" + IdUsu + ", NombreUsu=" + NombreUsu + ", Local=" + Local + ", Logo=" + Logo + ", Estado=" + Estado + '}';
    }
    
    
    
            

    
}
