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
    private String PreNombre;
    private String MarNombre;

    public AsignaMarcacionTab(int PreId, int MarId, int NoRamos, String PreNombre, String MarNombre) {
        this.PreId = PreId;
        this.MarId = MarId;
        this.NoRamos = NoRamos;
        this.PreNombre = PreNombre;
        this.MarNombre = MarNombre;
    }

    public AsignaMarcacionTab(int PreId, int MarId, int NoRamos) {
        this.PreId = PreId;
        this.MarId = MarId;
        this.NoRamos = NoRamos;
    }

    public AsignaMarcacionTab(int MarId,String MarNombre,int NoRamos) {
        this.MarId = MarId;
        this.MarNombre = MarNombre;
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

    /**
     * @return the PreNombre
     */
    public String getPreNombre() {
        return PreNombre;
    }

    /**
     * @param PreNombre the PreNombre to set
     */
    public void setPreNombre(String PreNombre) {
        this.PreNombre = PreNombre;
    }

    /**
     * @return the MarNombre
     */
    public String getMarNombre() {
        return MarNombre;
    }

    /**
     * @param MarNombre the MarNombre to set
     */
    public void setMarNombre(String MarNombre) {
        this.MarNombre = MarNombre;
    }

    @Override
    public String toString() {
        return "AsignaMarcacionTab{" + "PreId=" + PreId + ", MarId=" + MarId + ", NoRamos=" + NoRamos + ", PreNombre=" + PreNombre + ", MarNombre=" + MarNombre + '}';
    }
    
    
    
    
}
