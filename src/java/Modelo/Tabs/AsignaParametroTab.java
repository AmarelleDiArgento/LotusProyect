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
public class AsignaParametroTab implements Serializable{
    
    private int GraID;
    private int ParId;
    private int MaeId;
    private int ProId;
    private int VarId;
    private String PaProDescripcion;
    private String PaProFoto;
    private String GraNombre;
    private String ParNombre;
    private String MaeNombre;
    private String ProNombre;
    private String VarNombre;

    public AsignaParametroTab(int GraID, int ParId, int MaeId, int ProId, int VarId, String PaProDescripcion, String PaProFoto, String GraNombre, String ParNombre, String MaeNombre, String ProNombre, String VarNombre) {
        this.GraID = GraID;
        this.ParId = ParId;
        this.MaeId = MaeId;
        this.ProId = ProId;
        this.VarId = VarId;
        this.PaProDescripcion = PaProDescripcion;
        this.PaProFoto = PaProFoto;
        this.GraNombre = GraNombre;
        this.ParNombre = ParNombre;
        this.MaeNombre = MaeNombre;
        this.ProNombre = ProNombre;
        this.VarNombre = VarNombre;
    }

    public AsignaParametroTab(int GraID, int ParId, int MaeId, int ProId, int VarId, String PaProDescripcion, String PaProFoto) {
        this.GraID = GraID;
        this.ParId = ParId;
        this.MaeId = MaeId;
        this.ProId = ProId;
        this.VarId = VarId;
        this.PaProDescripcion = PaProDescripcion;
        this.PaProFoto = PaProFoto;
    }
    

    /**
     * @return the GraID
     */
    public int getGraID() {
        return GraID;
    }

    /**
     * @param GraID the GraID to set
     */
    public void setGraID(int GraID) {
        this.GraID = GraID;
    }

    /**
     * @return the ParId
     */
    public int getParId() {
        return ParId;
    }

    /**
     * @param ParId the ParId to set
     */
    public void setParId(int ParId) {
        this.ParId = ParId;
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
     * @return the VarId
     */
    public int getVarId() {
        return VarId;
    }

    /**
     * @param VarId the VarId to set
     */
    public void setVarId(int VarId) {
        this.VarId = VarId;
    }

    /**
     * @return the PaProDescripcion
     */
    public String getPaProDescripcion() {
        return PaProDescripcion;
    }

    /**
     * @param PaProDescripcion the PaProDescripcion to set
     */
    public void setPaProDescripcion(String PaProDescripcion) {
        this.PaProDescripcion = PaProDescripcion;
    }

    /**
     * @return the PaProFoto
     */
    public String getPaProFoto() {
        return PaProFoto;
    }

    /**
     * @param PaProFoto the PaProFoto to set
     */
    public void setPaProFoto(String PaProFoto) {
        this.PaProFoto = PaProFoto;
    }

    /**
     * @return the GraNombre
     */
    public String getGraNombre() {
        return GraNombre;
    }

    /**
     * @param GraNombre the GraNombre to set
     */
    public void setGraNombre(String GraNombre) {
        this.GraNombre = GraNombre;
    }

    /**
     * @return the ParNombre
     */
    public String getParNombre() {
        return ParNombre;
    }

    /**
     * @param ParNombre the ParNombre to set
     */
    public void setParNombre(String ParNombre) {
        this.ParNombre = ParNombre;
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
     * @return the VarNombre
     */
    public String getVarNombre() {
        return VarNombre;
    }

    /**
     * @param VarNombre the VarNombre to set
     */
    public void setVarNombre(String VarNombre) {
        this.VarNombre = VarNombre;
    }

    @Override
    public String toString() {
        return "AsignaParametroTab{" + "GraID=" + GraID + ", ParId=" + ParId + ", MaeId=" + MaeId + ", ProId=" + ProId + ", VarId=" + VarId + ", PaProDescripcion=" + PaProDescripcion + ", PaProFoto=" + PaProFoto + ", GraNombre=" + GraNombre + ", ParNombre=" + ParNombre + ", MaeNombre=" + MaeNombre + ", ProNombre=" + ProNombre + ", VarNombre=" + VarNombre + '}';
    }
    
    
    
}
