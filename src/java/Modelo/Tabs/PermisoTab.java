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
public class PermisoTab implements Serializable{

    private int PerId;
    private String PerNombre;
    private String PerModulo;
    private String PerDescripcion;
    private String PerIco;
    private String PerUrl;
    private Boolean PerEstado;

    public PermisoTab(String PerNombre, String PerModulo, String PerDescripcion, String PerIco, String PerUrl, Boolean PerEstado) {
        this.PerNombre = PerNombre;
        this.PerModulo = PerModulo;
        this.PerDescripcion = PerDescripcion;
        this.PerIco = PerIco;
        this.PerUrl = PerUrl;
        this.PerEstado = PerEstado;
    }

    public PermisoTab(int PerId, String PerNombre, String PerModulo, String PerDescripcion, String PerIco, String PerUrl, Boolean PerEstado) {
        this.PerId = PerId;
        this.PerNombre = PerNombre;
        this.PerModulo = PerModulo;
        this.PerDescripcion = PerDescripcion;
        this.PerIco = PerIco;
        this.PerUrl = PerUrl;
        this.PerEstado = PerEstado;
    }

    public PermisoTab(String PerModulo, String PerIco, String PerUrl) {
        this.PerModulo = PerModulo;
        this.PerIco = PerIco;
        this.PerUrl = PerUrl;
    }

    /**
     * @return the PerId
     */
    public int getPerId() {
        return PerId;
    }

    /**
     * @param PerId the PerId to set
     */
    public void setPerId(int PerId) {
        this.PerId = PerId;
    }

    /**
     * @return the PerNombre
     */
    public String getPerNombre() {
        return PerNombre;
    }

    /**
     * @param PerNombre the PerNombre to set
     */
    public void setPerNombre(String PerNombre) {
        this.PerNombre = PerNombre;
    }

    /**
     * @return the PerModulo
     */
    public String getPerModulo() {
        return PerModulo;
    }

    /**
     * @param PerModulo the PerModulo to set
     */
    public void setPerModulo(String PerModulo) {
        this.PerModulo = PerModulo;
    }

    /**
     * @return the PerDescripcion
     */
    public String getPerDescripcion() {
        return PerDescripcion;
    }

    /**
     * @param PerDescripcion the PerDescripcion to set
     */
    public void setPerDescripcion(String PerDescripcion) {
        this.PerDescripcion = PerDescripcion;
    }

    /**
     * @return the PerIco
     */
    public String getPerIco() {
        return PerIco;
    }

    /**
     * @param PerIco the PerIco to set
     */
    public void setPerIco(String PerIco) {
        this.PerIco = PerIco;
    }

    /**
     * @return the PerUrl
     */
    public String getPerUrl() {
        return PerUrl;
    }

    /**
     * @param PerUrl the PerUrl to set
     */
    public void setPerUrl(String PerUrl) {
        this.PerUrl = PerUrl;
    }

    /**
     * @return the PerEstado
     */
    public Boolean getPerEstado() {
        return PerEstado;
    }

    /**
     * @param PerEstado the PerEstado to set
     */
    public void setPerEstado(Boolean PerEstado) {
        this.PerEstado = PerEstado;
    }
    

}
