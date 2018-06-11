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
public class MarcacionTab implements Serializable {

    private int MarId;
    private String MarNombre;
    private String MarPortada;
    private Boolean MarEstado;
    private int ArmId;
    private String ArmNombre;
    private int CliId;
    private String CliNombre;

    public MarcacionTab(String MarNombre, String MarPortada, Boolean MarEstado, int ArmId, int CliId) {
        this.MarNombre = MarNombre;
        this.MarPortada = MarPortada;
        this.MarEstado = MarEstado;
        this.ArmId = ArmId;
        this.CliId = CliId;
    }
    public MarcacionTab(int MarId, String MarNombre, String MarPortada, Boolean MarEstado, int ArmId, int CliId) {
        this.MarId = MarId;
        this.MarNombre = MarNombre;
        this.MarPortada = MarPortada;
        this.MarEstado = MarEstado;
        this.ArmId = ArmId;
        this.CliId = CliId;
    }

    public MarcacionTab(int MarId, String MarNombre, String MarPortada, Boolean MarEstado, int ArmId, String ArmNombre, int CliId, String CliNombre) {
        this.MarId = MarId;
        this.MarNombre = MarNombre;
        this.MarPortada = MarPortada;
        this.MarEstado = MarEstado;
        this.ArmId = ArmId;
        this.ArmNombre = ArmNombre;
        this.CliId = CliId;
        this.CliNombre = CliNombre;
    }

    /**
     * @return the MarId
     */
    public int getMarId() {
        return MarId;
    }

    /**
     * @param MarId the MarId to set
     */
    public void setMarId(int MarId) {
        this.MarId = MarId;
    }

    /**
     * @return the MarNombre
     */
    public String getMarNombre() {
        return MarNombre;
    }

    /**
     * @param MarNombre the MarNombre to set
     */
    public void setMarNombre(String MarNombre) {
        this.MarNombre = MarNombre;
    }

    /**
     * @return the MarPortada
     */
    public String getMarPortada() {
        return MarPortada;
    }

    /**
     * @param MarPortada the MarPortada to set
     */
    public void setMarPortada(String MarPortada) {
        this.MarPortada = MarPortada;
    }

    /**
     * @return the MarEstado
     */
    public Boolean isMarEstado() {
        return MarEstado;
    }

    /**
     * @param MarEstado the MarEstado to set
     */
    public void setMarEstado(Boolean MarEstado) {
        this.MarEstado = MarEstado;
    }

    /**
     * @return the ArmId
     */
    public int getArmId() {
        return ArmId;
    }

    /**
     * @param ArmId the ArmId to set
     */
    public void setArmId(int ArmId) {
        this.ArmId = ArmId;
    }

    /**
     * @return the ArmNombre
     */
    public String getArmNombre() {
        return ArmNombre;
    }

    /**
     * @param ArmNombre the ArmNombre to set
     */
    public void setArmNombre(String ArmNombre) {
        this.ArmNombre = ArmNombre;
    }

    /**
     * @return the CliId
     */
    public int getCliId() {
        return CliId;
    }

    /**
     * @param CliId the CliId to set
     */
    public void setCliId(int CliId) {
        this.CliId = CliId;
    }

    /**
     * @return the CliNombre
     */
    public String getCliNombre() {
        return CliNombre;
    }

    /**
     * @param CliNombre the CliNombre to set
     */
    public void setCliNombre(String CliNombre) {
        this.CliNombre = CliNombre;
    }

    @Override
    public String toString() {
        return "MarcacionTab{" + "MarId=" + MarId + ", MarNombre=" + MarNombre + ", MarPortada=" + MarPortada + ", MarEstado=" + MarEstado + ", ArmId=" + ArmId + ", ArmNombre=" + ArmNombre + ", CliId=" + CliId + ", CliNombre=" + CliNombre + '}';
    }

    
    
}
