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
public class MenuTab {
    
    private int MenuId;
    private String MenPortada;
    private String MenSuperior;
    private String MenLongitud;
    private String MenCauchos;
    private Boolean Estado;
    private String MenDescripcion;
    private int MarId;
    private String Marcacion;

    public MenuTab(String MenPortada, String MenSuperior, String MenLongitud, String MenCauchos, Boolean MenEstado, String MenDescripcion, int MarId) {
        this.MenPortada = MenPortada;
        this.MenSuperior = MenSuperior;
        this.MenLongitud = MenLongitud;
        this.MenCauchos = MenCauchos;
        this.Estado = MenEstado;
        this.MenDescripcion = MenDescripcion;
        this.MarId = MarId;
    }

    public MenuTab(int MenuId, String MenPortada, String MenSuperior, String MenLongitud, String MenCauchos, Boolean MenEstado, String MenDescripcion, int MarId) {
        this.MenuId = MenuId;
        this.MenPortada = MenPortada;
        this.MenSuperior = MenSuperior;
        this.MenLongitud = MenLongitud;
        this.MenCauchos = MenCauchos;
        this.Estado = MenEstado;
        this.MenDescripcion = MenDescripcion;
        this.MarId = MarId;
    }

    public MenuTab(String MenPortada, String MenSuperior, String MenLongitud, String MenCauchos, Boolean Estado, String MenDescripcion, int MarId, String Marcacion) {
        this.MenPortada = MenPortada;
        this.MenSuperior = MenSuperior;
        this.MenLongitud = MenLongitud;
        this.MenCauchos = MenCauchos;
        this.Estado = Estado;
        this.MenDescripcion = MenDescripcion;
        this.MarId = MarId;
        this.Marcacion = Marcacion;
    }

    public MenuTab(int Id, String portada, String superior, String longitud, String cauchos, String descripcion, boolean status) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    /**
     * @return the MenuId
     */
    public int getMenuId() {
        return MenuId;
    }

    /**
     * @param MenuId the MenuId to set
     */
    public void setMenuId(int MenuId) {
        this.MenuId = MenuId;
    }

    /**
     * @return the MenPortada
     */
    public String getMenPortada() {
        return MenPortada;
    }

    /**
     * @param MenPortada the MenPortada to set
     */
    public void setMenPortada(String MenPortada) {
        this.MenPortada = MenPortada;
    }

    /**
     * @return the MenSuperior
     */
    public String getMenSuperior() {
        return MenSuperior;
    }

    /**
     * @param MenSuperior the MenSuperior to set
     */
    public void setMenSuperior(String MenSuperior) {
        this.MenSuperior = MenSuperior;
    }

    /**
     * @return the MenLongitud
     */
    public String getMenLongitud() {
        return MenLongitud;
    }

    /**
     * @param MenLongitud the MenLongitud to set
     */
    public void setMenLongitud(String MenLongitud) {
        this.MenLongitud = MenLongitud;
    }

    /**
     * @return the MenCauchos
     */
    public String getMenCauchos() {
        return MenCauchos;
    }

    /**
     * @param MenCauchos the MenCauchos to set
     */
    public void setMenCauchos(String MenCauchos) {
        this.MenCauchos = MenCauchos;
    }

    /**
     * @param Estado the ArmEstado to set
     */
    public void setEstado(Boolean Estado) {
        this.Estado = Estado;
    }

    /**
     * @return the ArmEstado
     */
    public Boolean isEstado() {
        return Estado;
    }

    /**
     * @return the MenDescripcion
     */
    public String getMenDescripcion() {
        return MenDescripcion;
    }

    /**
     * @param MenDescripcion the MenDescripcion to set
     */
    public void setMenDescripcion(String MenDescripcion) {
        this.MenDescripcion = MenDescripcion;
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
     * @return the Marcacion
     */
    public String getMarcacion() {
        return Marcacion;
    }

    /**
     * @param Marcacion the Marcacion to set
     */
    public void setMarcacion(String Marcacion) {
        this.Marcacion = Marcacion;
    }

    @Override
    public String toString() {
        return "MenuTab{" + "MenuId=" + MenuId + ", MenPortada=" + MenPortada + ", MenSuperior=" + MenSuperior + ", MenLongitud=" + MenLongitud + ", MenCauchos=" + MenCauchos + ", Estado=" + Estado + ", MenDescripcion=" + MenDescripcion + ", MarId=" + MarId + ", Marcacion=" + Marcacion + '}';
    }

    }


   