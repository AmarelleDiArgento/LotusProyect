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
public class MarcacionTab {
    
    private int MarId;
    private String MarNombre;
    private String MarPortada;
    private Boolean MarEstado;
    private int ArmId;
    private String ArmNombre;

    public MarcacionTab(String MarNombre, String MarPortada, Boolean MarEstado, int ArmId) {
        this.MarNombre = MarNombre;
        this.MarPortada = MarPortada;
        this.MarEstado = MarEstado;
        this.ArmId = ArmId;
    }

    public MarcacionTab(int MarId, String MarNombre, String MarPortada, Boolean MarEstado, int ArmId) {
        this.MarId = MarId;
        this.MarNombre = MarNombre;
        this.MarPortada = MarPortada;
        this.MarEstado = MarEstado;
        this.ArmId = ArmId;
    }

    public MarcacionTab(int MarId, String MarNombre, String MarPortada, Boolean MarEstado, int ArmId, String ArmNombre) {
        this.MarId = MarId;
        this.MarNombre = MarNombre;
        this.MarPortada = MarPortada;
        this.MarEstado = MarEstado;
        this.ArmId = ArmId;
        this.ArmNombre = ArmNombre;
    }

    public MarcacionTab(int Id, String nombre, String portada, boolean status) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
     * @param MarEstado the ArmEstado to set
     */
    public void setMarEstado(Boolean MarEstado) {
        this.MarEstado = MarEstado;
    }

    /**
     * @return the ArmEstado
     */
    public Boolean isMarEstado() {
        return MarEstado;
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

    @Override
    public String toString() {
        return "MarcacionTab{" + "MarId=" + MarId + ", MarNombre=" + MarNombre + ", MarPortada=" + MarPortada + ", MarEstado=" + MarEstado + ", ArmNombre=" + ArmNombre + '}';
    }

}
