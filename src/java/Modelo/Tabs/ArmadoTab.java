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
public class ArmadoTab {
    
    private int ArmId;
    private String ArmNombre;
    private String ArmDescripcion;
    private Boolean ArmEstado;
    private int Paso_PasId;

    public ArmadoTab(int ArmId, String ArmNombre, String ArmDescripcion, Boolean Estado, int Paso_PasId) {
        this.ArmId = ArmId;
        this.ArmNombre = ArmNombre;
        this.ArmDescripcion = ArmDescripcion;
        this.ArmEstado = Estado;
        this.Paso_PasId = Paso_PasId;
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
     * @return the ArmDescripcion
     */
    public String getArmDescripcion() {
        return ArmDescripcion;
    }

    /**
     * @param ArmDescripcion the ArmDescripcion to set
     */
    public void setArmDescripcion(String ArmDescripcion) {
        this.ArmDescripcion = ArmDescripcion;
    }

    /**
     * @param ArmEstado the ArmEstado to set
     */
    public void setArmEstado(Boolean ArmEstado) {
        this.ArmEstado = ArmEstado;
    }
    /**
     * @return the ArmEstado
     */
        public Boolean isArmEstado() {
        return ArmEstado;
    }

    /**
     * @return the Paso_PasId
     */
    public int getPaso_PasId() {
        return Paso_PasId;
    }

    /**
     * @param Paso_PasId the Paso_PasId to set
     */
    public void setPaso_PasId(int Paso_PasId) {
        this.Paso_PasId = Paso_PasId;
    }
 @Override
    public String toString() {
        return "ArmadoTab{" + "ArmId=" + getArmId() + ", ArmNombre=" + getArmNombre() + ", ArmDescripcion=" + getArmDescripcion() + ", Estado=" + getArmEstado() + ", Paso_PasId=" + getPaso_PasId() + '}';
    }

    private String getArmEstado() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   
}
