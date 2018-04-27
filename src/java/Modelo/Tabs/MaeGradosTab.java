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
public class MaeGradosTab {
   private int  MaeId;
   private int GraID;

    public MaeGradosTab(int MaeId, int GraID) {
        this.MaeId = MaeId;
        this.GraID = GraID;
   
    
    
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
     * @return the GraID
     */
    public int getGraID() {
        return GraID;
    }

    /**
     * @param GraID the GraID to set
     */
    public void setGraID(int GraID) {
        this.GraID = GraID;
    }

    @Override
    public String toString() {
        return "MaeGradosTab{" + "MaeId=" + MaeId + ", GraID=" + GraID + '}';
    }
    }
