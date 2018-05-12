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

    /**
     * @return the MaeId
     */
    public int getMaeId() {
        return MaeId;
    }

    /**
     * @param MaeId the MaeId to set
     */
    public void setMaeId(int MaeId) {
        this.MaeId = MaeId;
    }

    /**
     * @return the MaeNombre
     */
    public String getMaeNombre() {
        return MaeNombre;
    }

    /**
     * @param MaeNombre the MaeNombre to set
     */
    public void setMaeNombre(String MaeNombre) {
        this.MaeNombre = MaeNombre;
    }

    /**
     * @return the MaeDescripcion
     */
    public String getMaeDescripcion() {
        return MaeDescripcion;
    }

    /**
     * @param MaeDescripcion the MaeDescripcion to set
     */
    public void setMaeDescripcion(String MaeDescripcion) {
        this.MaeDescripcion = MaeDescripcion;
    }

    @Override
    public String toString() {
        return "MaestroTab{" + "MaeId=" + MaeId + ", MaeNombre=" + MaeNombre + ", MaeDescripcion=" + MaeDescripcion + '}';
    }
    }
