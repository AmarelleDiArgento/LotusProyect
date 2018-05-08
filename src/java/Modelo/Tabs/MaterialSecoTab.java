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
public class MaterialSecoTab {
    
    private int MsId;
    private int TipoMs_TimId;
    private String MsNombre;
    private String MsImagen;
    private String MsDescripcion;
    private Boolean Estado;
    private  int MsAlto;
    private int MsAncho;
    private int MsProfundo;

    public MaterialSecoTab(int MsId, int TipoMs_TimId, String MsNombre,String MsImagen,String MsDescripcion, Boolean Estado, int MsAlto, int MsAncho, int MsProfundo) {
        this.MsId = MsId;
        this.TipoMs_TimId = TipoMs_TimId;
        this.MsNombre = MsNombre;
        this.MsImagen = MsImagen;
        this.MsImagen = MsDescripcion;
        this.Estado = Estado;
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
     * @return the Estado
     */
    public Boolean getEstado() {
        return Estado;
    }

    /**
     * @param Estado the Estado to set
     */
    public void setEstado(Boolean Estado) {
        this.Estado = Estado;
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
    @Override
    public String toString() {
        return "MaterialSecoTab{" + "MsId=" + getMsId() + ", TipoMs_TimId=" + getTipoMs_TimId() + ", MsNombre=" + getMsNombre() + ", Estado=" + getEstado() + ", MsAlto=" + getMsAlto() + ", MsAncho=" + getMsAncho() + ", MsProfundo=" + getMsProfundo() + '}';
    }

    public boolean isMsEstado() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
    
    
    

