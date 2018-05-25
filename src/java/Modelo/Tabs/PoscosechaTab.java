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
public class PoscosechaTab implements Serializable{
    
  private int PosId;  
  private String PosNombre;
  private String PosDireccion;
  private String PosTelefono;
  private Boolean PosEstado;

    public PoscosechaTab(int PosId, String PosNombre, String PosDireccion, String PosTelefono, Boolean PosEstado) {
        this.PosId = PosId;
        this.PosNombre = PosNombre;
        this.PosDireccion = PosDireccion;
        this.PosTelefono = PosTelefono;
        this.PosEstado = PosEstado;
    }

    public PoscosechaTab(String PosNombre, String PosDireccion, String PosTelefono, Boolean PosEstado) {
        this.PosNombre = PosNombre;
        this.PosDireccion = PosDireccion;
        this.PosTelefono = PosTelefono;
        this.PosEstado = PosEstado;
    }
    

    /**
     * @return the PosId
     */
    public int getPosId() {
        return PosId;
    }

    /**
     * @param PosId the PosId to set
     */
    public void setPosId(int PosId) {
        this.PosId = PosId;
    }

    /**
     * @return the PosNombre
     */
    public String getPosNombre() {
        return PosNombre;
    }

    /**
     * @param PosNombre the PosNombre to set
     */
    public void setPosNombre(String PosNombre) {
        this.PosNombre = PosNombre;
    }

    /**
     * @return the PosDireccion
     */
    public String getPosDireccion() {
        return PosDireccion;
    }

    /**
     * @param PosDireccion the PosDireccion to set
     */
    public void setPosDireccion(String PosDireccion) {
        this.PosDireccion = PosDireccion;
    }

    /**
     * @return the PosTelefono
     */
    public String getPosTelefono() {
        return PosTelefono;
    }

    /**
     * @param PosTelefono the PosTelefono to set
     */
    public void setPosTelefono(String PosTelefono) {
        this.PosTelefono = PosTelefono;
    }

  /**
     * @param PosEstado the PosEstado to set
     */
    public void setPosEstado(Boolean PosEstado) {
        this.PosEstado = PosEstado;
    }

    /**
     * @return the PosEstado
     */
    public Boolean isPosEstado() {
        return PosEstado;
    }
  
    @Override
    public String toString() {
        return "PoscosechaTab{" + "PosId=" + PosId + ", PosNombre=" + PosNombre + ", PosDireccion=" + PosDireccion + ", PosTelefono=" + PosTelefono + ", PosEstado=" + PosEstado + '}';
    }
}
  
    
   
