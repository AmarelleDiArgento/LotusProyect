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
public class RolPermisoTab {
    private int RolId;
    private String Roln; 
    private int PerId;
    private String nPermiso;
    private boolean rpLeer;
    private boolean rpNuevo;
    private boolean rpEditar;
    private boolean rpEliminar;

    public RolPermisoTab(int RolId, int PerId, boolean rpLeer, boolean rpNuevo, boolean rpEditar, boolean rpEliminar) {
        this.RolId = RolId;
        this.PerId = PerId;
        this.rpLeer = rpLeer;
        this.rpNuevo = rpNuevo;
        this.rpEditar = rpEditar;
        this.rpEliminar = rpEliminar;
    }

    public RolPermisoTab(int RolId, String Roln, int PerId, String nPermiso, boolean rpLeer, boolean rpNuevo, boolean rpEditar, boolean rpEliminar) {
        this.RolId = RolId;
        this.Roln = Roln;
        this.PerId = PerId;
        this.nPermiso = nPermiso;
        this.rpLeer = rpLeer;
        this.rpNuevo = rpNuevo;
        this.rpEditar = rpEditar;
        this.rpEliminar = rpEliminar;
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
     * @return the Roln
     */
    public String getRoln() {
        return Roln;
    }

    /**
     * @param Roln the Roln to set
     */
    public void setRoln(String Roln) {
        this.Roln = Roln;
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
     * @return the nPermiso
     */
    public String getnPermiso() {
        return nPermiso;
    }

    /**
     * @param nPermiso the nPermiso to set
     */
    public void setnPermiso(String nPermiso) {
        this.nPermiso = nPermiso;
    }

    /**
     * @return the rpLeer
     */
    public boolean isRpLeer() {
        return rpLeer;
    }

    /**
     * @param rpLeer the rpLeer to set
     */
    public void setRpLeer(boolean rpLeer) {
        this.rpLeer = rpLeer;
    }

    /**
     * @return the rpNuevo
     */
    public boolean isRpNuevo() {
        return rpNuevo;
    }

    /**
     * @param rpNuevo the rpNuevo to set
     */
    public void setRpNuevo(boolean rpNuevo) {
        this.rpNuevo = rpNuevo;
    }

    /**
     * @return the rpEditar
     */
    public boolean isRpEditar() {
        return rpEditar;
    }

    /**
     * @param rpEditar the rpEditar to set
     */
    public void setRpEditar(boolean rpEditar) {
        this.rpEditar = rpEditar;
    }

    /**
     * @return the rpEliminar
     */
    public boolean isRpEliminar() {
        return rpEliminar;
    }

    /**
     * @param rpEliminar the rpEliminar to set
     */
    public void setRpEliminar(boolean rpEliminar) {
        this.rpEliminar = rpEliminar;
    }

    @Override
    public String toString() {
        return "RolPermisoTab{" + "RolId=" + RolId + ", Roln=" + Roln + ", PerId=" + PerId + ", nPermiso=" + nPermiso + ", rpLeer=" + rpLeer + ", rpNuevo=" + rpNuevo + ", rpEditar=" + rpEditar + ", rpEliminar=" + rpEliminar + '}';
    }
    
    
    
    
    
    
    
}
