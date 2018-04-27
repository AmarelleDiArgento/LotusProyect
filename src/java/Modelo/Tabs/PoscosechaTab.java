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
  private String Nombre;
  private String Direccion;
  private String Telefono;
  private Boolean Estado;

    public PoscosechaTab(int Idposcosecha, String Nombre, String Direccion, String Telefono, Boolean Estado) {
        this.Idposcosecha = Idposcosecha;
        this.Nombre = Nombre;
        this.Direccion = Direccion;
        this.Telefono = Telefono;
        this.Estado = Estado;
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
     * @return the Nombre
     */
    public String getNombre() {
        return Nombre;
    }

    /**
     * @param Nombre the Nombre to set
     */
    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    /**
     * @return the Direccion
     */
    public String getDireccion() {
        return Direccion;
    }

    /**
     * @param Direccion the Direccion to set
     */
    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    /**
     * @return the Telefono
     */
    public String getTelefono() {
        return Telefono;
    }

    /**
     * @param Telefono the Telefono to set
     */
    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
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

    @Override
    public String toString() {
        return "PoscosechaTab{" + "Idposcosecha=" + Idposcosecha + ", Nombre=" + Nombre + ", Direccion=" + Direccion + ", Telefono=" + Telefono + ", Estado=" + Estado + '}';
    }
    

}

  
    
   
