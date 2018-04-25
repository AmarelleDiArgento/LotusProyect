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
public class MenuTab {
    
    private int MenuId;
    private int Marcacion_MarId;
    private String MenPortada;
    private String MenSuperior;
    private String MenLongitud;
    private String MenCauchos;
    private Boolean MenEstado;
    private String MenDescripcion;

    public MenuTab(int MenuId, int Marcacion_MarId, String MenPortada, String MenSuperior, String MenLongitud, String MenCauchos, Boolean MenEstado, String MenDescripcion) {
        this.MenuId = MenuId;
        this.Marcacion_MarId = Marcacion_MarId;
        this.MenPortada = MenPortada;
        this.MenSuperior = MenSuperior;
        this.MenLongitud = MenLongitud;
        this.MenCauchos = MenCauchos;
        this.MenEstado = MenEstado;
        this.MenDescripcion = MenDescripcion;
    }

    public int getMenuId() {
        return MenuId;
    }

    public void setMenuId(int MenuId) {
        this.MenuId = MenuId;
    }

    public int getMarcacion_MarId() {
        return Marcacion_MarId;
    }

    public void setMarcacion_MarId(int Marcacion_MarId) {
        this.Marcacion_MarId = Marcacion_MarId;
    }

    public String getMenPortada() {
        return MenPortada;
    }

    public void setMenPortada(String MenPortada) {
        this.MenPortada = MenPortada;
    }

    public String getMenSuperior() {
        return MenSuperior;
    }

    public void setMenSuperior(String MenSuperior) {
        this.MenSuperior = MenSuperior;
    }

    public String getMenLongitud() {
        return MenLongitud;
    }

    public void setMenLongitud(String MenLongitud) {
        this.MenLongitud = MenLongitud;
    }

    public String getMenCauchos() {
        return MenCauchos;
    }

    public void setMenCauchos(String MenCauchos) {
        this.MenCauchos = MenCauchos;
    }

    public Boolean getMenEstado() {
        return MenEstado;
    }

    public void setMenEstado(Boolean MenEstado) {
        this.MenEstado = MenEstado;
    }

    public String getMenDescripcion() {
        return MenDescripcion;
    }

    public void setMenDescripcion(String MenDescripcion) {
        this.MenDescripcion = MenDescripcion;
    }
    
    
    
}
