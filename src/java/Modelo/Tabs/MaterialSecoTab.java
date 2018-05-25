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
public class MaterialSecoTab implements Serializable {
    
    private int MsId;
    private int TipoMs_TimId;
    private String MsNombre;
    private String MsImagen;
    private String MsDescripcion;
    private Boolean MsEstado;
    private  int MsAlto;
    private int MsAncho;
    private int MsProfundo;
    private String TiMNombre;

    public MaterialSecoTab(String MsNombre,String MsImagen,String MsDescripcion, int MsAlto, int MsAncho, int MsProfundo,String TiMNombre,Boolean MsEstado) {
        this.MsNombre = MsNombre;
        this.MsImagen = MsImagen;
        this.MsImagen = MsDescripcion;
        this.MsAlto = MsAlto;
        this.MsAncho = MsAncho;
        this.MsProfundo = MsProfundo;
        this.TiMNombre = TiMNombre;
        this.MsEstado = MsEstado;
    } 

    public MaterialSecoTab(int MsId, String MsNombre, String MsImagen, String MsDescripcion,int MsAlto, int MsAncho, int MsProfundo,String TiMNombre, Boolean MsEstado) {
        this.MsId = MsId;
        this.MsNombre = MsNombre;
        this.MsImagen = MsImagen;
        this.MsDescripcion = MsDescripcion;
        this.MsAlto = MsAlto;
        this.MsAncho = MsAncho;
        this.MsProfundo = MsProfundo;
        this.TiMNombre = TiMNombre;
        this.MsEstado = MsEstado;
     
    }

    public MaterialSecoTab(int MsId, String MsNombre, String MsImagen, String MsDescripcion, Boolean MsEstado, int MsAlto, int MsAncho, int MsProfundo) {
        this.MsId = MsId;
        this.MsNombre = MsNombre;
        this.MsImagen = MsImagen;
        this.MsDescripcion = MsDescripcion;
        this.MsEstado = MsEstado;
        this.MsAlto = MsAlto;
        this.MsAncho = MsAncho;
        this.MsProfundo = MsProfundo;
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
     * @return the TipoMs_TimId
     */
    public int getTipoMs_TimId() {
        return TipoMs_TimId;
    }

    /**
     * @param TipoMs_TimId the TipoMs_TimId to set
     */
    public void setTipoMs_TimId(int TipoMs_TimId) {
        this.TipoMs_TimId = TipoMs_TimId;
    }

    /**
     * @return the MsNombre
     */
    public String getMsNombre() {
        return MsNombre;
    }

    /**
     * @param MsNombre the MsNombre to set
     */
    public void setMsNombre(String MsNombre) {
        this.MsNombre = MsNombre;
    }

    /**
     * @return the MsImagen
     */
    public String getMsImagen() {
        return MsImagen;
    }

    /**
     * @param MsImagen the MsImagen to set
     */
    public void setMsImagen(String MsImagen) {
        this.MsImagen = MsImagen;
    }

    /**
     * @return the MsDescripcion
     */
    public String getMsDescripcion() {
        return MsDescripcion;
    }

    /**
     * @param MsDescripcion the MsDescripcion to set
     */
    public void setMsDescripcion(String MsDescripcion) {
        this.MsDescripcion = MsDescripcion;
    }
 /**
     * @param MsEstado the MsEstado to set
     */
    public void setMsEstado(Boolean MsEstado) {
        this.MsEstado = MsEstado;
    }

    /**
     * @return the MsEstado
     */
    public Boolean isMsEstado() {
        return MsEstado;
    }

    /**
     * @return the MsAlto
     */
    public int getMsAlto() {
        return MsAlto;
    }

    /**
     * @param MsAlto the MsAlto to set
     */
    public void setMsAlto(int MsAlto) {
        this.MsAlto = MsAlto;
    }

    /**
     * @return the MsAncho
     */
    public int getMsAncho() {
        return MsAncho;
    }

    /**
     * @param MsAncho the MsAncho to set
     */
    public void setMsAncho(int MsAncho) {
        this.MsAncho = MsAncho;
    }

    /**
     * @return the MsProfundo
     */
    public int getMsProfundo() {
        return MsProfundo;
    }

    /**
     * @param MsProfundo the MsProfundo to set
     */
    public void setMsProfundo(int MsProfundo) {
        this.MsProfundo = MsProfundo;
    }

    /**
     * @return the TiMNombre
     */
    public String getTiMNombre() {
        return TiMNombre;
    }

    /**
     * @param TiMNombre the TiMNombre to set
     */
    public void setTiMNombre(String TiMNombre) {
        this.TiMNombre = TiMNombre;
    }

    @Override
    public String toString() {
        return "MaterialSecoTab{" + "MsId=" + MsId + ", TipoMs_TimId=" + TipoMs_TimId + ", MsNombre=" + MsNombre + ", MsImagen=" + MsImagen + ", MsDescripcion=" + MsDescripcion + ", MsEstado=" + MsEstado + ", MsAlto=" + MsAlto + ", MsAncho=" + MsAncho + ", MsProfundo=" + MsProfundo + ", TiMNombre=" + TiMNombre + '}';
    }
   }

    
    