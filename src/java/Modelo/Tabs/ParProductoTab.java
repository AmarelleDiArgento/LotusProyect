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

    /**
     * @return the grados_GraID
     */
    public int getGrados_GraID() {
        return grados_GraID;
    }

    /**
     * @param grados_GraID the grados_GraID to set
     */
    public void setGrados_GraID(int grados_GraID) {
        this.grados_GraID = grados_GraID;
    }

    /**
     * @return the parametros_ParId
     */
    public int getParametros_ParId() {
        return parametros_ParId;
    }

    /**
     * @param parametros_ParId the parametros_ParId to set
     */
    public void setParametros_ParId(int parametros_ParId) {
        this.parametros_ParId = parametros_ParId;
    }

    /**
     * @return the productos_ProId
     */
    public int getProductos_ProId() {
        return productos_ProId;
    }

    /**
     * @param productos_ProId the productos_ProId to set
     */
    public void setProductos_ProId(int productos_ProId) {
        this.productos_ProId = productos_ProId;
    }

    /**
     * @return the variedad_VarId
     */
    public int getVariedad_VarId() {
        return variedad_VarId;
    }

    /**
     * @param variedad_VarId the variedad_VarId to set
     */
    public void setVariedad_VarId(int variedad_VarId) {
        this.variedad_VarId = variedad_VarId;
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

    @Override
    public String toString() {
        return "ParProductoTab{" + "grados_GraID=" + grados_GraID + ", parametros_ParId=" + parametros_ParId + ", productos_ProId=" + productos_ProId + ", variedad_VarId=" + variedad_VarId + ", PaProDescripcion=" + PaProDescripcion + ", PaProFoto=" + PaProFoto + '}';
    }

  

}
