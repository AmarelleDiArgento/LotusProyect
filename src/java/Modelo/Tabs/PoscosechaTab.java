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
public class PoscosechaTab {
    
  private int Idposcosecha;  
  private String PosNombre;
  private String PosDireccion;
  private String PosTelefono;
  private Boolean PosEstado;

    public PoscosechaTab(int Idposcosecha, String PosNombre, String PosDireccion, String PosTelefono, Boolean PosEstado) {
        this.Idposcosecha = Idposcosecha;
        this.PosNombre = PosNombre;
        this.PosDireccion = PosDireccion;
        this.PosTelefono = PosTelefono;
        this.PosEstado = PosEstado;
    }


    public boolean isPosEstado() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    /**
     * @return the Idposcosecha
     */
    public int getIdposcosecha() {
        return Idposcosecha;
    }

    /**
     * @param Idposcosecha the Idposcosecha to set
     */
    public void setIdposcosecha(int Idposcosecha) {
        this.Idposcosecha = Idposcosecha;
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
     * @return the PosEstado
     */
    public Boolean getPosEstado() {
        return PosEstado;
    }

    /**
     * @param PosEstado the PosEstado to set
     */
    public void setPosEstado(Boolean PosEstado) {
        this.PosEstado = PosEstado;
    }
    


    @Override
    public String toString() {
        return "PoscosechaTab{" + "Idposcosecha=" + Idposcosecha + ", PosNombre=" + PosNombre + ", PosDireccion=" + PosDireccion + ", PosTelefono=" + PosTelefono + ", PosEstado=" + PosEstado + '}';
    }
}
  
    
   
