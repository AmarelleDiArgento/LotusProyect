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
public class MaterialSeco_Has_Menu_Tab {
   
    private String MsMenUbicacion;
    private String MsMenImagen;
    private int MsMenCantidad ;
    private int MsId;
    private String MaterialSeco;
     private int MenuId ;
    private String Menu;

    public MaterialSeco_Has_Menu_Tab(String MsMenUbicacion, String MsMenImagen, int MsMenCantidad, String MaterialSeco, int MenuId) {
        this.MsMenUbicacion = MsMenUbicacion;
        this.MsMenImagen = MsMenImagen;
        this.MsMenCantidad = MsMenCantidad;
        this.MaterialSeco = MaterialSeco;
        this.MenuId = MenuId;
    }

    public MaterialSeco_Has_Menu_Tab(String MsMenUbicacion, String MsMenImagen, int MsMenCantidad, int MsId, String MaterialSeco, int MenuId) {
        this.MsMenUbicacion = MsMenUbicacion;
        this.MsMenImagen = MsMenImagen;
        this.MsMenCantidad = MsMenCantidad;
        this.MsId = MsId;
        this.MaterialSeco = MaterialSeco;
        this.MenuId = MenuId;
    }

    public MaterialSeco_Has_Menu_Tab(String MsMenUbicacion, String MsMenImagen, int MsMenCantidad, int MsId, String MaterialSeco, int MenuId, String Menu) {
        this.MsMenUbicacion = MsMenUbicacion;
        this.MsMenImagen = MsMenImagen;
        this.MsMenCantidad = MsMenCantidad;
        this.MsId = MsId;
        this.MaterialSeco = MaterialSeco;
        this.MenuId = MenuId;
        this.Menu = Menu;
    }

    /**
     * @return the MsMenUbicacion
     */
    public String getMsMenUbicacion() {
        return MsMenUbicacion;
    }

    /**
     * @param MsMenUbicacion the MsMenUbicacion to set
     */
    public void setMsMenUbicacion(String MsMenUbicacion) {
        this.MsMenUbicacion = MsMenUbicacion;
    }

    /**
     * @return the MsMenImagen
     */
    public String getMsMenImagen() {
        return MsMenImagen;
    }

    /**
     * @param MsMenImagen the MsMenImagen to set
     */
    public void setMsMenImagen(String MsMenImagen) {
        this.MsMenImagen = MsMenImagen;
    }

    /**
     * @return the MsMenCantidad
     */
    public int getMsMenCantidad() {
        return MsMenCantidad;
    }

    /**
     * @param MsMenCantidad the MsMenCantidad to set
     */
    public void setMsMenCantidad(int MsMenCantidad) {
        this.MsMenCantidad = MsMenCantidad;
    }

    /**
     * @return the MsId
     */
    public int getMsId() {
        return MsId;
    }

    /**
     * @param MsId the MsId to set
     */
    public void setMsId(int MsId) {
        this.MsId = MsId;
    }

    /**
     * @return the MaterialSeco
     */
    public String getMaterialSeco() {
        return MaterialSeco;
    }

    /**
     * @param MaterialSeco the MaterialSeco to set
     */
    public void setMaterialSeco(String MaterialSeco) {
        this.MaterialSeco = MaterialSeco;
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
        return "MaterialSeco_Has_Menu{" + "MsMenUbicacion=" + MsMenUbicacion + ", MsMenImagen=" + MsMenImagen + ", MsMenCantidad=" + MsMenCantidad + ", MsId=" + MsId + ", MaterialSeco=" + MaterialSeco + ", MenuId=" + MenuId + ", Menu=" + Menu + '}';
    }
    
    }


   
    
