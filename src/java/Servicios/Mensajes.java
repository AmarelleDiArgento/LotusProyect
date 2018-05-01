/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servicios;

/**
 *
 * @author Amarelle
 */
public class Mensajes {

    private String tipo;
    private String msj;
    private String detalles;

    public Mensajes() {
    }

    public Mensajes(String tipo, String msj, String detalles) {
        this.tipo = tipo;
        this.msj = msj;
        this.detalles = detalles;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the msj
     */
    public String getMsj() {
        return msj;
    }

    /**
     * @param msj the msj to set
     */
    public void setMsj(String msj) {
        this.msj = msj;
    }

    /**
     * @return the detalles
     */
    public String getDetalles() {
        return detalles;
    }

    /**
     * @param detalles the detalles to set
     */
    public void setDetalles(String detalles) {
        this.detalles = detalles;
    }

    /**
     * @return the body
     */
    public String getBody() {
        String body;

        if (tipo.equals("Mod")) {
            body = "<body onload=\"modalMod()\">";
        } else if (tipo.equals("Error")) {
            body = "<body onload=\"msjError()\">";
        } else if (tipo.equals("Msj")) {
            body = "<body onload=\"msjMsj()\">";
        } else if (tipo.equals("Ok")) {
            body = "<body onload=\"msjOk()\">   ";
        } else {
            body = "<body>";
        }
        System.out.println(tipo);
        return body;
    }

}
