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
public class VariedadTab {
    
    private int VarId;
    private String VarNombre;
    private Boolean VarEstado;
    private String Varimagen;
    private String VarColor;

    public VariedadTab(int VarId, String VarNombre, Boolean VarEstado, String Varimagen, String VarColor) {
        this.VarId = VarId;
        this.VarNombre = VarNombre;
        this.VarEstado = VarEstado;
        this.Varimagen = Varimagen;
        this.VarColor = VarColor;
    }

    public int getVarId() {
        return VarId;
    }

    public void setVarId(int VarId) {
        this.VarId = VarId;
    }

    public String getVarNombre() {
        return VarNombre;
    }

    public void setVarNombre(String VarNombre) {
        this.VarNombre = VarNombre;
    }

    public Boolean getVarEstado() {
        return VarEstado;
    }

    public void setVarEstado(Boolean VarEstado) {
        this.VarEstado = VarEstado;
    }

    public String getVarimagen() {
        return Varimagen;
    }

    public void setVarimagen(String Varimagen) {
        this.Varimagen = Varimagen;
    }

    public String getVarColor() {
        return VarColor;
    }

    public void setVarColor(String VarColor) {
        this.VarColor = VarColor;
    }
    
    
    
}
