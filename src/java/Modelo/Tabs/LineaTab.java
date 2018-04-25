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

    public LineaTab(int LinId, Boolean Estado, int poscosecha_PosId) {
        this.LinId = LinId;
        this.Estado = Estado;
        this.poscosecha_PosId = poscosecha_PosId;
    }

    public int getLinId() {
        return LinId;
    }

    public void setLinId(int LinId) {
        this.LinId = LinId;
    }

    public Boolean getEstado() {
        return Estado;
    }

    public void setEstado(Boolean Estado) {
        this.Estado = Estado;
    }

    public int getPoscosecha_PosId() {
        return poscosecha_PosId;
    }

    public void setPoscosecha_PosId(int poscosecha_PosId) {
        this.poscosecha_PosId = poscosecha_PosId;
    }
    
       @Override
    public String toString() {
        return "LineaTab{" + "LinId=" + LinId + ", Estado=" + Estado + ", poscosecha_PosId=" + poscosecha_PosId +'}';
    }

    public String toFullName(){
     return Estado + " " +poscosecha_PosId;
    }
}

   
