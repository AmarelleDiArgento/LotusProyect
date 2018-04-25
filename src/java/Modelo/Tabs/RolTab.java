/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Tabs;

/**
 *
 * @author Amarelle
 */
public class RolTab {

    private int RolId;
    private String RolNombre;
    private String RolDescripcion;
    private boolean RolEstado;

    public RolTab(int RolId, String RolNombre, String RolDescripcion, boolean RolEstado) {
        this.RolId = RolId;
        this.RolNombre = RolNombre;
        this.RolDescripcion = RolDescripcion;
        this.RolEstado = RolEstado;
    }

    public RolTab(String RolNombre, String RolDescripcion, boolean RolEstado) {
        this.RolNombre = RolNombre;
        this.RolDescripcion = RolDescripcion;
        this.RolEstado = RolEstado;
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
     * @return the RolNombre
     */
    public String getRolNombre() {
        return RolNombre;
    }

    /**
     * @param RolNombre the RolNombre to set
     */
    public void setRolNombre(String RolNombre) {
        this.RolNombre = RolNombre;
    }

    /**
     * @return the RolDescripcion
     */
    public String getRolDescripcion() {
        return RolDescripcion;
    }

    /**
     * @param RolDescripcion the RolDescripcion to set
     */
    public void setRolDescripcion(String RolDescripcion) {
        this.RolDescripcion = RolDescripcion;
    }

    /**
     * @return the RolEstado
     */
    public boolean isRolEstado() {
        return RolEstado;
    }

    /**
     * @param RolEstado the RolEstado to set
     */
    public void setRolEstado(boolean RolEstado) {
        this.RolEstado = RolEstado;
    }

    @Override
    public String toString() {
        return "RolTab{" + "RolId=" + RolId + ", RolNombre=" + RolNombre + ", RolDescripcion=" + RolDescripcion + ", RolEstado=" + RolEstado + '}';
    }

}
