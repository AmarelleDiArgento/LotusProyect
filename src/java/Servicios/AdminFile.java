/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servicios;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.http.Part;

/**
 *
 * @author Amarelle
 */
public class AdminFile {

    public AdminFile() {
    }

    String SO = System.getProperty("os.name");
    InputStream in = null;
    FileOutputStream out = null;
    File arch = null;
    int pack;

    public String capetas() {
        File folder = null;
        SO = SO.substring(0, 4);
        if (SO.equals("Windo")) {
            folder = new File("x:\\devtroce\\java");
        } else if (SO.equals("Linux")) {
            folder = new File("/media/devtroce/java");
        }

        return SO;
    }

    public Mensajes subirImg(Part img, String url) {
        Mensajes msj = new Mensajes();
        try {
            in = img.getInputStream();
            arch = new File(url);
            out = new FileOutputStream(arch);
            pack = in.read();
            while (pack != -1) {
                out.write(pack);
                pack = in.read();
                System.err.println(pack);
            }
            out.close();
            in.close();
        } catch (IOException ex) {
            msj.setTipo("Error");
            msj.setMsj("IO Exception");
            msj.setDetalles(ex.getMessage());
        }

        msj.setTipo("Ok");
        msj.setMsj(img.getSubmittedFileName());
        msj.setDetalles("Subido exitosamente");
        return msj;
    }

//SO  = SO.substring(0, 3);
}
