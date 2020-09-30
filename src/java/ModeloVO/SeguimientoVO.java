/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author melis
 */
public class SeguimientoVO {
    private int idModalidad;
    private int idRequisitos;
    private String nombreModalidad;
    private String nombreRequisito;
    
    //Getters

    public int getIdModalidad() {
        return idModalidad;
    }

    public int getIdRequisitos() {
        return idRequisitos;
    }

    public String getNombreModalidad() {
        return nombreModalidad;
    }

    public String getNombreRequisito() {
        return nombreRequisito;
    }
    
    //Setters

    public void setIdModalidad(int idModalidad) {
        this.idModalidad = idModalidad;
    }

    public void setIdRequisitos(int idRequisitos) {
        this.idRequisitos = idRequisitos;
    }

    public void setNombreModalidad(String nombreModalidad) {
        this.nombreModalidad = nombreModalidad;
    }

    public void setNombreRequisito(String nombreRequisito) {
        this.nombreRequisito = nombreRequisito;
    }
    
    
    
}
