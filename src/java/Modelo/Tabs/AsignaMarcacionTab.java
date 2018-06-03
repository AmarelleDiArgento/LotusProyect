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
public class AsignaMarcacionTab implements Serializable{
    private int PreId;
    private int MarId;
    private int NoRamos;

    public AsignaMarcacionTab(int PreId, int MarId, int NoRamos) {
        this.PreId = PreId;
        this.MarId = MarId;
        this.NoRamos = NoRamos;
    }

    /**
     * @return the PreId
     */
    public int getPreId() {
        return PreId;
    }

    /**
     * @param PreId the PreId to set
     */
    public void setPreId(int PreId) {
        this.PreId = PreId;
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
     * @return the NoRamos
     */
    public int getNoRamos() {
        return NoRamos;
    }

    /**
     * @param NoRamos the NoRamos to set
     */
    public void setNoRamos(int NoRamos) {
        this.NoRamos = NoRamos;
    }
    
    
}
