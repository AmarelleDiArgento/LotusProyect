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
public class Preliminar_Has_Marcacion_Tab {
 private int Preliminar_PreId;
 private int Marcacion_MarId;

    public Preliminar_Has_Marcacion_Tab(int Preliminar_PreId, int Marcacion_MarId) {
        this.Preliminar_PreId = Preliminar_PreId;
        this.Marcacion_MarId = Marcacion_MarId;
    }

    public int getPreliminar_PreId() {
        return Preliminar_PreId;
    }

    public void setPreliminar_PreId(int Preliminar_PreId) {
        this.Preliminar_PreId = Preliminar_PreId;
    }

    public int getMarcacion_MarId() {
        return Marcacion_MarId;
    }

    public void setMarcacion_MarId(int Marcacion_MarId) {
        this.Marcacion_MarId = Marcacion_MarId;
    }

    
    
    
    
}



