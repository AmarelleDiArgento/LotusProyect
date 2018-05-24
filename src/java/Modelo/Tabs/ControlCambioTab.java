/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.Tabs;

import java.io.Serializable;

/**
 *
 * @author ale-j
 */
public class ControlCambioTab implements Serializable{
    private int CCId;
    private String CCAntes;
    private String CCDespues;
    private String CCUsuarios;

    public ControlCambioTab(int CCId, String CCAntes, String CCDespues, String CCUsuarios) {
        this.CCId = CCId;
        this.CCAntes = CCAntes;
        this.CCDespues = CCDespues;
        this.CCUsuarios = CCUsuarios;
    }

    public ControlCambioTab(String CCAntes, String CCDespues, String CCUsuarios) {
        this.CCAntes = CCAntes;
        this.CCDespues = CCDespues;
        this.CCUsuarios = CCUsuarios;
    }
    

    /**
     * @return the CCId
     */
    public int getCCId() {
        return CCId;
    }

    /**
     * @param CCId the CCId to set
     */
    public void setCCId(int CCId) {
        this.CCId = CCId;
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
        return "ControlCambioTab{" + "CCId=" + CCId + ", CCAntes=" + CCAntes + ", CCDespues=" + CCDespues + ", CCUsuarios=" + CCUsuarios + '}';
    }
}
