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
public class PreliminarTab {
   
    private int PreId;
    private Boolean Estado;
    private int Poscosecha_Posnombre;

    public PreliminarTab(int PreId, Boolean Estado, int Poscosecha_Posnombre) {
        this.PreId = PreId;
        this.Estado = Estado;
        this.Poscosecha_Posnombre = Poscosecha_Posnombre;
    }

    public int getPreId() {
        return PreId;
    }

    public void setPreId(int PreId) {
        this.PreId = PreId;
    }

    public Boolean getEstado() {
        return Estado;
    }

    public void setEstado(Boolean Estado) {
        this.Estado = Estado;
    }

    public int getPoscosecha_Posnombre() {
        return Poscosecha_Posnombre;
    }

    public void setPoscosecha_Posnombre(int Poscosecha_Posnombre) {
        this.Poscosecha_Posnombre = Poscosecha_Posnombre;
    }
    
      @Override
    public String toString() {
        return "PreliminarTab{" + "PreId=" + PreId + ", Estado=" + Estado + ", Poscosecha_Posnombre=" + Poscosecha_Posnombre +'}';
    }

    public String toFullName(){
     return Estado + " " +Poscosecha_Posnombre;
    }
}
  
