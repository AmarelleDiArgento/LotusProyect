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
public class AsignaMatSecoTab implements Serializable{
    
    private int MsId;
    private int MenuId;
    private int MsMenCantidad;
    private String MsMenUbicacion;
    private String MsMenImagen;   
    private String MenuNombre;

    public AsignaMatSecoTab(int MsId, int MenuId, int MsMenCantidad, String MsMenUbicacion, String MsMenImagen, String MenuNombre) {
        this.MsId = MsId;
        this.MenuId = MenuId;
        this.MsMenCantidad = MsMenCantidad;
        this.MsMenUbicacion = MsMenUbicacion;
        this.MsMenImagen = MsMenImagen;
        this.MenuNombre = MenuNombre;
    }

    public AsignaMatSecoTab(int MsId, int MenuId, int MsMenCantidad, String MsMenUbicacion, String MsMenImagen) {
        this.MsId = MsId;
        this.MenuId = MenuId;
        this.MsMenCantidad = MsMenCantidad;
        this.MsMenUbicacion = MsMenUbicacion;
        this.MsMenImagen = MsMenImagen;
    }

    public AsignaMatSecoTab(int MsId,String MenuNombre,String MsMenUbicacion,String MsMenImagen,int MsMenCantidad) {
        this.MsId = MsId;
        this.MenuNombre = MenuNombre;
        this.MsMenUbicacion = MsMenUbicacion;
        this.MsMenImagen = MsMenImagen;
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
        return "AsignaMatSecoTab{" + "MsId=" + MsId + ", MenuId=" + MenuId + ", MsMenCantidad=" + MsMenCantidad + ", MsMenUbicacion=" + MsMenUbicacion + ", MsMenImagen=" + MsMenImagen + ", MenuNombre=" + MenuNombre + '}';
    }
    
    
   
    
}

