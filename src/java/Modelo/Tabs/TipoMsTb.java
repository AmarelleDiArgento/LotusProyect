/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Tabs;

/**
 *
 * @author ALEJANDRA MEDINA
 */
public class TipoMsTb {
   
    private int TiMId;
    private String TiMNombre;
    private String TiMDescripcion;

    public TipoMsTb(int TiMId, String TiMNombre, String TiMDescripcion) {
        this.TiMId = TiMId;
        this.TiMNombre = TiMNombre;
        this.TiMDescripcion = TiMDescripcion;
    }

    public int getTiMId() {
        return TiMId;
    }

    public void setTiMId(int TiMId) {
        this.TiMId = TiMId;
    }

    public String getTiMNombre() {
        return TiMNombre;
    }

    public void setTiMNombre(String TiMNombre) {
        this.TiMNombre = TiMNombre;
    }

    public String getTiMDescripcion() {
        return TiMDescripcion;
    }

    public void setTiMDescripcion(String TiMDescripcion) {
        this.TiMDescripcion = TiMDescripcion;
    }
    
    
    
    
    
}
