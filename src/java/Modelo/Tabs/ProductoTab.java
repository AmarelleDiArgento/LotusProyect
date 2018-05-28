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
public class ProductoTab implements Serializable {

    private int ProId;
    private String ProNombre;
    private String ProImagen;
    private Boolean ProEstado;
    private int MaeId;
    private String MaeNombre;

    

    public ProductoTab(String ProNombre, String ProImagen, Boolean ProEstado) {
        this.ProNombre = ProNombre;
        this.ProImagen = ProImagen;
        this.ProEstado = ProEstado;
    }
    
    public ProductoTab(int ProId, String ProNombre, String ProImagen, Boolean ProEstado) {
        this.ProId = ProId;
        this.ProNombre = ProNombre;
        this.ProImagen = ProImagen;
        this.ProEstado = ProEstado;
    }
    
    public ProductoTab(int ProId, String ProNombre, String ProImagen, Boolean ProEstado, int MaeId, String MaeNombre) {
        this.ProId = ProId;
        this.ProNombre = ProNombre;
        this.ProImagen = ProImagen;
        this.ProEstado = ProEstado;
        this.MaeId = MaeId;
        this.MaeNombre = MaeNombre;
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
     * @return the ProNombre
     */
    public String getProNombre() {
        return ProNombre;
    }

    /**
     * @param ProNombre the ProNombre to set
     */
    public void setProNombre(String ProNombre) {
        this.ProNombre = ProNombre;
    }

    /**
     * @return the ProImagen
     */
    public String getProImagen() {
        return ProImagen;
    }

    /**
     * @param ProImagen the ProImagen to set
     */
    public void setProImagen(String ProImagen) {
        this.ProImagen = ProImagen;
    }

    /**
     * @return the ProEstado
     */
    public Boolean isProEstado() {
        return ProEstado;
    }

    /**
     * @param ProEstado the ProEstado to set
     */
    public void setProEstado(Boolean ProEstado) {
        this.ProEstado = ProEstado;
    }

    /**
     * @return the MaeId
     */
    public int getMaeId() {
        return MaeId;
    }

    /**
     * @param MaeId the MaeId to set
     */
    public void setMaeId(int MaeId) {
        this.MaeId = MaeId;
    }

    /**
     * @return the MaeNombre
     */
    public String getMaeNombre() {
        return MaeNombre;
    }

    /**
     * @param MaeNombre the MaeNombre to set
     */
    public void setMaeNombre(String MaeNombre) {
        this.MaeNombre = MaeNombre;
    }

    @Override
    public String toString() {
        return "ProductoTab{" + "ProId=" + ProId + ", ProNombre=" + ProNombre + ", ProImagen=" + ProImagen + ", ProEstado=" + ProEstado + ", MaeId=" + MaeId + ", MaeNombre=" + MaeNombre + '}';
    }

    

}
