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
public class ParProductoTab {
    
    private int  grados_GraID;
     private int parametros_ParId;
     private int productos_ProId;
   private int  variedad_VarId;
 private String PaProDescripcion;
  private String PaProFoto;  

    public ParProductoTab(int grados_GraID, int parametros_ParId, int productos_ProId, int variedad_VarId, String PaProDescripcion, String PaProFoto) {
        this.grados_GraID = grados_GraID;
        this.parametros_ParId = parametros_ParId;
        this.productos_ProId = productos_ProId;
        this.variedad_VarId = variedad_VarId;
        this.PaProDescripcion = PaProDescripcion;
        this.PaProFoto = PaProFoto;
    }

    public int getGrados_GraID() {
        return grados_GraID;
    }

    public void setGrados_GraID(int grados_GraID) {
        this.grados_GraID = grados_GraID;
    }

    public int getParametros_ParId() {
        return parametros_ParId;
    }

    public void setParametros_ParId(int parametros_ParId) {
        this.parametros_ParId = parametros_ParId;
    }

    public int getProductos_ProId() {
        return productos_ProId;
    }

    public void setProductos_ProId(int productos_ProId) {
        this.productos_ProId = productos_ProId;
    }

    public int getVariedad_VarId() {
        return variedad_VarId;
    }

    public void setVariedad_VarId(int variedad_VarId) {
        this.variedad_VarId = variedad_VarId;
    }

    public String getPaProDescripcion() {
        return PaProDescripcion;
    }

    public void setPaProDescripcion(String PaProDescripcion) {
        this.PaProDescripcion = PaProDescripcion;
    }

    public String getPaProFoto() {
        return PaProFoto;
    }

    public void setPaProFoto(String PaProFoto) {
        this.PaProFoto = PaProFoto;
    }
  
  
  

}
