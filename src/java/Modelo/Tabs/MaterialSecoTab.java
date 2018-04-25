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

    public int getMsId() {
        return MsId;
    }

    public void setMsId(int MsId) {
        this.MsId = MsId;
    }

    public int getTipoMs_TimId() {
        return TipoMs_TimId;
    }

    public void setTipoMs_TimId(int TipoMs_TimId) {
        this.TipoMs_TimId = TipoMs_TimId;
    }

    public String getMsNombre() {
        return MsNombre;
    }

    public void setMsNombre(String MsNombre) {
        this.MsNombre = MsNombre;
    }

    public Boolean getEstado() {
        return Estado;
    }

    public void setEstado(Boolean Estado) {
        this.Estado = Estado;
    }

    public int getMsAlto() {
        return MsAlto;
    }

    public void setMsAlto(int MsAlto) {
        this.MsAlto = MsAlto;
    }

    public int getMsAncho() {
        return MsAncho;
    }

    public void setMsAncho(int MsAncho) {
        this.MsAncho = MsAncho;
    }

    public int getMsProfundo() {
        return MsProfundo;
    }

    public void setMsProfundo(int MsProfundo) {
        this.MsProfundo = MsProfundo;
    }
    
     @Override
    public String toString() {
        return "MaterialSecoTab{" + "MsId=" + MsId + ", TipoMs_TimId=" + TipoMs_TimId + ", MsNombre=" + MsNombre +", Estado=" + Estado + ", MsAlto=" + MsAlto + ", MsAncho=" + MsAncho +", MsProfundo=" + MsProfundo +'}';
    }

    public String toFullName(){
     return MsId + " " +TipoMs_TimId;
    }
}
    
    

