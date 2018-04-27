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
    private Boolean Estado;
    private  int MsAlto;
    private int MsAncho;
    private int MsProfundo;

    public MaterialSecoTab(int MsId, int TipoMs_TimId, String MsNombre, Boolean Estado, int MsAlto, int MsAncho, int MsProfundo) {
        this.MsId = MsId;
        this.TipoMs_TimId = TipoMs_TimId;
        this.MsNombre = MsNombre;
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
        return "MaterialSecoTab{" + "MsId=" + MsId + ", TipoMs_TimId=" + TipoMs_TimId + ", MsNombre=" + MsNombre + ", Estado=" + Estado + ", MsAlto=" + MsAlto + ", MsAncho=" + MsAncho + ", MsProfundo=" + MsProfundo + '}';
    }
}
    
    
    

