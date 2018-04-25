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
    private int  productos_ProId;
    private int menu_MenuId;

    public Productos_Has_Menu_Tab(int productos_ProId, int menu_MenuId) {
        this.productos_ProId = productos_ProId;
        this.menu_MenuId = menu_MenuId;
    }

    public int getProductos_ProId() {
        return productos_ProId;
    }

    public void setProductos_ProId(int productos_ProId) {
        this.productos_ProId = productos_ProId;
    }

    public int getMenu_MenuId() {
        return menu_MenuId;
    }

    public void setMenu_MenuId(int menu_MenuId) {
        this.menu_MenuId = menu_MenuId;
    }
    
    
    
    
    
    
    
}
