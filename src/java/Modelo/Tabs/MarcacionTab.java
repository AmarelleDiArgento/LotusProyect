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
public class MarcacionTab {
    
    private int MarId;
    private String MarNombre;
    private String MarPortada;
    private Boolean MarEstado;

    public MarcacionTab(int MarId, String MarNombre, String MarPortada, Boolean MarEstado) {
        this.MarId = MarId;
        this.MarNombre = MarNombre;
        this.MarPortada = MarPortada;
        this.MarEstado = MarEstado;
    }

    public int getMarId() {
        return MarId;
    }

    public void setMarId(int MarId) {
        this.MarId = MarId;
    }

    public String getMarNombre() {
        return MarNombre;
    }

    public void setMarNombre(String MarNombre) {
        this.MarNombre = MarNombre;
    }

    public String getMarPortada() {
        return MarPortada;
    }

    public void setMarPortada(String MarPortada) {
        this.MarPortada = MarPortada;
    }

    public Boolean getMarEstado() {
        return MarEstado;
    }

    public void setMarEstado(Boolean MarEstado) {
        this.MarEstado = MarEstado;
    }

    
}
