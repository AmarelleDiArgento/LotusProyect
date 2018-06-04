/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Tabs;

import java.io.Serializable;

/**
 *
 * @author ale-j
 */
public class AsignaProductoTab implements Serializable{
    
    private int ProId;
    private int MenuId;
    private int Tallos;
    private String Color;
    private String MenuNombre;

    public AsignaProductoTab(int ProId, int MenuId, int Tallos, String Color, String MenuNombre) {
        this.ProId = ProId;
        this.MenuId = MenuId;
        this.Tallos = Tallos;
        this.Color = Color;
        this.MenuNombre = MenuNombre;
    }

    public AsignaProductoTab(int ProId, int MenuId, int Tallos, String Color) {
        this.ProId = ProId;
        this.MenuId = MenuId;
        this.Tallos = Tallos;
        this.Color = Color;
    }

    /**
     * @return the ProId
     */
    public int getProId() {
        return ProId;
    }

    /**
     * @param ProId the ProId to set
     */
    public void setProId(int ProId) {
        this.ProId = ProId;
    }

    /**
     * @return the MenuId
     */
    public int getMenuId() {
        return MenuId;
    }

    /**
     * @param MenuId the MenuId to set
     */
    public void setMenuId(int MenuId) {
        this.MenuId = MenuId;
    }

    /**
     * @return the Tallos
     */
    public int getTallos() {
        return Tallos;
    }

    /**
     * @param Tallos the Tallos to set
     */
    public void setTallos(int Tallos) {
        this.Tallos = Tallos;
    }

    /**
     * @return the Color
     */
    public String getColor() {
        return Color;
    }

    /**
     * @param Color the Color to set
     */
    public void setColor(String Color) {
        this.Color = Color;
    }

    /**
     * @return the MenuNombre
     */
    public String getMenuNombre() {
        return MenuNombre;
    }

    /**
     * @param MenuNombre the MenuNombre to set
     */
    public void setMenuNombre(String MenuNombre) {
        this.MenuNombre = MenuNombre;
    }

    @Override
    public String toString() {
        return "AsignaProductoTab{" + "ProId=" + ProId + ", MenuId=" + MenuId + ", Tallos=" + Tallos + ", Color=" + Color + ", MenuNombre=" + MenuNombre + '}';
    }
    
    
    
    
    
}
