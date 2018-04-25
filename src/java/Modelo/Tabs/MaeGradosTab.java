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

    public int getMaeId() {
        return MaeId;
    }

    public void setMaeId(int MaeId) {
        this.MaeId = MaeId;
    }

    public int getGraID() {
        return GraID;
    }

    public void setGraID(int GraID) {
        this.GraID = GraID;
    }
   
   
    
    
}
