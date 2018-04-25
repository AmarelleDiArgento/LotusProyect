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
    private Boolean Estado;
    private int Paso_PasId;

    public ArmadoTab(int ArmId, String ArmNombre, String ArmDescripcion, Boolean Estado, int Paso_PasId) {
        this.ArmId = ArmId;
        this.ArmNombre = ArmNombre;
        this.ArmDescripcion = ArmDescripcion;
        this.Estado = Estado;
        this.Paso_PasId = Paso_PasId;
    }

    public int getArmId() {
        return ArmId;
    }

    public void setArmId(int ArmId) {
        this.ArmId = ArmId;
    }

    public String getArmNombre() {
        return ArmNombre;
    }

    public void setArmNombre(String ArmNombre) {
        this.ArmNombre = ArmNombre;
    }

    public String getArmDescripcion() {
        return ArmDescripcion;
    }

    public void setArmDescripcion(String ArmDescripcion) {
        this.ArmDescripcion = ArmDescripcion;
    }

    public Boolean getEstado() {
        return Estado;
    }

    public void setEstado(Boolean Estado) {
        this.Estado = Estado;
    }

    public int getPaso_PasId() {
        return Paso_PasId;
    }

    public void setPaso_PasId(int Paso_PasId) {
        this.Paso_PasId = Paso_PasId;
    }
            
    
    
}
