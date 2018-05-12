/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Tabs;

/**
 *
 * @author ale-j
 */
public class ControlCambioTab {
    private int CCID;
    private String CCAntes;
    private String CCDespues;
    private String CCUsuarios;

    public ControlCambioTab(int CCID, String CCAntes, String CCDespues, String CCUsuarios) {
        this.CCID = CCID;
        this.CCAntes = CCAntes;
        this.CCDespues = CCDespues;
        this.CCUsuarios = CCUsuarios;
    }

    /**
     * @return the CCID
     */
    public int getCCID() {
        return CCID;
    }

    /**
     * @param CCID the CCID to set
     */
    public void setCCID(int CCID) {
        this.CCID = CCID;
    }

    /**
     * @return the CCAntes
     */
    public String getCCAntes() {
        return CCAntes;
    }

    /**
     * @param CCAntes the CCAntes to set
     */
    public void setCCAntes(String CCAntes) {
        this.CCAntes = CCAntes;
    }

    /**
     * @return the CCDespues
     */
    public String getCCDespues() {
        return CCDespues;
    }

    /**
     * @param CCDespues the CCDespues to set
     */
    public void setCCDespues(String CCDespues) {
        this.CCDespues = CCDespues;
    }

    /**
     * @return the CCUsuarios
     */
    public String getCCUsuarios() {
        return CCUsuarios;
    }

    /**
     * @param CCUsuarios the CCUsuarios to set
     */
    public void setCCUsuarios(String CCUsuarios) {
        this.CCUsuarios = CCUsuarios;
    }

    @Override
    public String toString() {
        return "ControlCambioTab{" + "CCID=" + CCID + ", CCAntes=" + CCAntes + ", CCDespues=" + CCDespues + ", CCUsuarios=" + CCUsuarios + '}';
    }
    
    
    
}
