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
public class MaestroTab {
    
    private int MaeId;
    private String MaeNombre;
    private String MaeDescripcion;

    public MaestroTab(int MaeId, String MaeNombre, String MaeDescripcion) {
        this.MaeId = MaeId;
        this.MaeNombre = MaeNombre;
        this.MaeDescripcion = MaeDescripcion;
    }

    public int getMaeId() {
        return MaeId;
    }

    public void setMaeId(int MaeId) {
        this.MaeId = MaeId;
    }

    public String getMaeNombre() {
        return MaeNombre;
    }

    public void setMaeNombre(String MaeNombre) {
        this.MaeNombre = MaeNombre;
    }

    public String getMaeDescripcion() {
        return MaeDescripcion;
    }

    public void setMaeDescripcion(String MaeDescripcion) {
        this.MaeDescripcion = MaeDescripcion;
    }
    
    
    
    
}
