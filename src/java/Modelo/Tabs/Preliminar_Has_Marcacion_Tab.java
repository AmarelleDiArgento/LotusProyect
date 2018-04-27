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
 private String Preliminar;
 private String Marcacion;

    public Preliminar_Has_Marcacion_Tab(int Preliminar_PreId, String Preliminar) {
        this.Preliminar_PreId = Preliminar_PreId;
        this.Preliminar = Preliminar;
    }

    public Preliminar_Has_Marcacion_Tab(int Preliminar_PreId, int Marcacion_MarId, String Preliminar) {
        this.Preliminar_PreId = Preliminar_PreId;
        this.Marcacion_MarId = Marcacion_MarId;
        this.Preliminar = Preliminar;
    }

    public Preliminar_Has_Marcacion_Tab(int Preliminar_PreId, int Marcacion_MarId, String Preliminar, String Marcacion) {
        this.Preliminar_PreId = Preliminar_PreId;
        this.Marcacion_MarId = Marcacion_MarId;
        this.Preliminar = Preliminar;
        this.Marcacion = Marcacion;
    }

    /**
     * @return the Preliminar_PreId
     */
    public int getPreliminar_PreId() {
        return Preliminar_PreId;
    }

    /**
     * @param Preliminar_PreId the Preliminar_PreId to set
     */
    public void setPreliminar_PreId(int Preliminar_PreId) {
        this.Preliminar_PreId = Preliminar_PreId;
    }

    /**
     * @return the Marcacion_MarId
     */
    public int getMarcacion_MarId() {
        return Marcacion_MarId;
    }

    /**
     * @param Marcacion_MarId the Marcacion_MarId to set
     */
    public void setMarcacion_MarId(int Marcacion_MarId) {
        this.Marcacion_MarId = Marcacion_MarId;
    }

    /**
     * @return the Preliminar
     */
    public String getPreliminar() {
        return Preliminar;
    }

    /**
     * @param Preliminar the Preliminar to set
     */
    public void setPreliminar(String Preliminar) {
        this.Preliminar = Preliminar;
    }

    /**
     * @return the Marcacion
     */
    public String getMarcacion() {
        return Marcacion;
    }

    /**
     * @param Marcacion the Marcacion to set
     */
    public void setMarcacion(String Marcacion) {
        this.Marcacion = Marcacion;
    }

    @Override
    public String toString() {
        return "Preliminar_Has_Marcacion_Tab{" + "Preliminar_PreId=" + Preliminar_PreId + ", Marcacion_MarId=" + Marcacion_MarId + ", Preliminar=" + Preliminar + ", Marcacion=" + Marcacion + '}';
    }
 
 
 

   
    
}



