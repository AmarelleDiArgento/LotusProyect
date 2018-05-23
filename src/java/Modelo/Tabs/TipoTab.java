/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Tabs;

import java.io.Serializable;

/**
 *
 * @author ALEJANDRA MEDINA
 */
public class TipoTab implements Serializable{
    
    private int TiMId;
    private String TiMNombre;
    private String TiMDescripcion;

    public TipoTab(int TiMId, String TiMNombre, String TiMDescripcion) {
        this.TiMId = TiMId;
        this.TiMNombre = TiMNombre;
        this.TiMDescripcion = TiMDescripcion;
    }

    /**
     * @return the TiMId
     */
    public int getTiMId() {
        return TiMId;
    }

    /**
     * @param TiMId the TiMId to set
     */
    public void setTiMId(int TiMId) {
        this.TiMId = TiMId;
    }

    /**
     * @return the TiMNombre
     */
    public String getTiMNombre() {
        return TiMNombre;
    }

    /**
     * @param TiMNombre the TiMNombre to set
     */
    public void setTiMNombre(String TiMNombre) {
        this.TiMNombre = TiMNombre;
    }

    /**
     * @return the TiMDescripcion
     */
    public String getTiMDescripcion() {
        return TiMDescripcion;
    }

    /**
     * @param TiMDescripcion the TiMDescripcion to set
     */
    public void setTiMDescripcion(String TiMDescripcion) {
        this.TiMDescripcion = TiMDescripcion;
    }

    @Override
    public String toString() {
        return "TipoTab{" + "TiMId=" + TiMId + ", TiMNombre=" + TiMNombre + ", TiMDescripcion=" + TiMDescripcion + '}';
    }
    
    
    
}
