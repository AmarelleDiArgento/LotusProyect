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

    public int getIdposcosecha() {
        return Idposcosecha;
    }

    public void setIdposcosecha(int Idposcosecha) {
        this.Idposcosecha = Idposcosecha;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public Boolean getEstado() {
        return Estado;
    }

    public void setEstado(Boolean Estado) {
        this.Estado = Estado;
    }


    @Override
    public String toString() {
        return "PoscosechaTab{" + "Idposcosecha=" + Idposcosecha + ", Nombre=" + Nombre + ", Direccion=" + Direccion + ", Telefono=" + Telefono + ", Estado=" + Estado +  '}';
    }

    public String toFullName(){
     return Nombre + " " +Direccion;
    }
}

  
    
   
