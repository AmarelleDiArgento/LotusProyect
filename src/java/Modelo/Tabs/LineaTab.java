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
public class LineaTab {
    
    private int LinId;
    private Boolean Estado;
    private int poscosecha_PosId;
    private int PosId;
    private String PosNombre;

    public LineaTab(Boolean Estado, int poscosecha_PosId, int PosId) {
        this.Estado = Estado;
        this.poscosecha_PosId = poscosecha_PosId;
        this.PosId = PosId;
    }

    public LineaTab(int LinId, Boolean Estado, int poscosecha_PosId, int PosId) {
        this.LinId = LinId;
        this.Estado = Estado;
        this.poscosecha_PosId = poscosecha_PosId;
        this.PosId = PosId;
    }

    public LineaTab(int LinId, Boolean Estado, int poscosecha_PosId, int PosId, String PosNombre) {
        this.LinId = LinId;
        this.Estado = Estado;
        this.poscosecha_PosId = poscosecha_PosId;
        this.PosId = PosId;
        this.PosNombre = PosNombre;
    }

    public LineaTab(int LinId, Boolean Estado) {
        this.LinId = LinId;
        this.Estado = Estado;
    }
    

    /**
     * @return the LinId
     */
    public int getLinId() {
        return LinId;
    }

    /**
     * @param LinId the LinId to set
     */
    public void setLinId(int LinId) {
        this.LinId = LinId;
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
     * @return the poscosecha_PosId
     */
    public int getPoscosecha_PosId() {
        return poscosecha_PosId;
    }

    /**
     * @param poscosecha_PosId the poscosecha_PosId to set
     */
    public void setPoscosecha_PosId(int poscosecha_PosId) {
        this.poscosecha_PosId = poscosecha_PosId;
    }

    /**
     * @return the PosId
     */
    public int getPosId() {
        return PosId;
    }

    /**
     * @param PosId the PosId to set
     */
    public void setPosId(int PosId) {
        this.PosId = PosId;
    }

    /**
     * @return the PosNombre
     */
    public String getPosNombre() {
        return PosNombre;
    }

    /**
     * @param PosNombre the PosNombre to set
     */
    public void setPosNombre(String PosNombre) {
        this.PosNombre = PosNombre;
    }

    @Override
    public String toString() {
        return "LineaTab{" + "LinId=" + LinId + ", Estado=" + Estado + ", poscosecha_PosId=" + poscosecha_PosId + ", PosId=" + PosId + ", PosNombre=" + PosNombre + '}';
    }

    public boolean isLinEstado() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}

   
    
    

   

   
