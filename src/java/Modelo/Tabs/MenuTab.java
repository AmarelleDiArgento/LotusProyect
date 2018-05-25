/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Tabs;

import java.io.Serializable;

/**
 *
 * @author ALEJANDRA MEDINA
 */
public class MenuTab implements Serializable{
    
    private int Id;
    private String Portada;
    private String Superior;
    private String Longitud;
    private String Cauchos;
    private Boolean Estado;
    private String Descripcion;
    private int MarId;
    private String Marcacion;

    public MenuTab(int Id, String Portada, String Superior, String Longitud, String Cauchos, Boolean Estado, String Descripcion) {
        this.Id = Id;
        this.Portada = Portada;
        this.Superior = Superior;
        this.Longitud = Longitud;
        this.Cauchos = Cauchos;
        this.Estado = Estado;
        this.Descripcion = Descripcion;
       
    }

    public MenuTab(int Id, String Portada, String Superior, String Longitud, String Cauchos, String Descripcion,String Marcacion, Boolean Estado) {
        this.Id = Id;
        this.Portada = Portada;
        this.Superior = Superior;
        this.Longitud = Longitud;
        this.Cauchos = Cauchos;
        this.Descripcion = Descripcion;
        this.Marcacion = Marcacion;
        this.Estado = Estado;

    }

    public MenuTab(String Portada, String Superior, String Longitud, String Cauchos,String Descripcion,String Marcacion, Boolean Estado) {
        this.Portada = Portada;
        this.Superior = Superior;
        this.Longitud = Longitud;
        this.Cauchos = Cauchos;
        this.Descripcion = Descripcion;
        this.Marcacion = Marcacion;
        this.Estado = Estado;
    }
    

    /**
     * @return the Id
     */
    public int getId() {
        return Id;
    }

    /**
     * @param Id the Id to set
     */
    public void setId(int Id) {
        this.Id = Id;
    }

    /**
     * @return the Portada
     */
    public String getPortada() {
        return Portada;
    }

    /**
     * @param Portada the Portada to set
     */
    public void setPortada(String Portada) {
        this.Portada = Portada;
    }

    /**
     * @return the Superior
     */
    public String getSuperior() {
        return Superior;
    }

    /**
     * @param Superior the Superior to set
     */
    public void setSuperior(String Superior) {
        this.Superior = Superior;
    }

    /**
     * @return the Longitud
     */
    public String getLongitud() {
        return Longitud;
    }

    /**
     * @param Longitud the Longitud to set
     */
    public void setLongitud(String Longitud) {
        this.Longitud = Longitud;
    }

    /**
     * @return the Cauchos
     */
    public String getCauchos() {
        return Cauchos;
    }

    /**
     * @param Cauchos the Cauchos to set
     */
    public void setCauchos(String Cauchos) {
        this.Cauchos = Cauchos;
    }

   
    /**
     * @param Estado the Estado to set
     */
    public void setEstado(Boolean Estado) {
        this.Estado = Estado;
    }

    /**
     * @return the ArmEstado
     */
    public Boolean isEstado() {
        return Estado;
    }

    /**
     * @return the Descripcion
     */
    public String getDescripcion() {
        return Descripcion;
    }

    /**
     * @param Descripcion the Descripcion to set
     */
    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    /**
     * @return the MarId
     */
    public int getMarId() {
        return MarId;
    }

    /**
     * @param MarId the MarId to set
     */
    public void setMarId(int MarId) {
        this.MarId = MarId;
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
        return "MenuTab{" + "Id=" + Id + ", Portada=" + Portada + ", Superior=" + Superior + ", Longitud=" + Longitud + ", Cauchos=" + Cauchos + ", Estado=" + Estado + ", Descripcion=" + Descripcion + ", MarId=" + MarId + ", Marcacion=" + Marcacion + '}';
    }
}
   



   