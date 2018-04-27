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
public class Productos_Has_Menu_Tab {
    private int  Productos_ProId;
    private int Menu_MenuId;
    private String productos;
    private String Menu;

    public Productos_Has_Menu_Tab(int Productos_ProId, String productos) {
        this.Productos_ProId = Productos_ProId;
        this.productos = productos;
    }

    public Productos_Has_Menu_Tab(int Productos_ProId, int Menu_MenuId, String Menu) {
        this.Productos_ProId = Productos_ProId;
        this.Menu_MenuId = Menu_MenuId;
        this.Menu = Menu;
    }

    public Productos_Has_Menu_Tab(int Productos_ProId, int Menu_MenuId, String productos, String Menu) {
        this.Productos_ProId = Productos_ProId;
        this.Menu_MenuId = Menu_MenuId;
        this.productos = productos;
        this.Menu = Menu;
    }

    /**
     * @return the Productos_ProId
     */
    public int getProductos_ProId() {
        return Productos_ProId;
    }

    /**
     * @param Productos_ProId the Productos_ProId to set
     */
    public void setProductos_ProId(int Productos_ProId) {
        this.Productos_ProId = Productos_ProId;
    }

    /**
     * @return the Menu_MenuId
     */
    public int getMenu_MenuId() {
        return Menu_MenuId;
    }

    /**
     * @param Menu_MenuId the Menu_MenuId to set
     */
    public void setMenu_MenuId(int Menu_MenuId) {
        this.Menu_MenuId = Menu_MenuId;
    }

    /**
     * @return the productos
     */
    public String getProductos() {
        return productos;
    }

    /**
     * @param productos the productos to set
     */
    public void setProductos(String productos) {
        this.productos = productos;
    }

    /**
     * @return the Menu
     */
    public String getMenu() {
        return Menu;
    }

    /**
     * @param Menu the Menu to set
     */
    public void setMenu(String Menu) {
        this.Menu = Menu;
    }

    @Override
    public String toString() {
        return "Productos_Has_Menu_Tab{" + "Productos_ProId=" + Productos_ProId + ", Menu_MenuId=" + Menu_MenuId + ", productos=" + productos + ", Menu=" + Menu + '}';
    }
    
    }

    


    
    
    
    
