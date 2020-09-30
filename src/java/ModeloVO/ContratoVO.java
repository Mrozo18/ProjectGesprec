/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author Dell_1
 */
public class ContratoVO extends PersonasVO{

    private String idContrato;
    private String idPersona;
    private String fechainicio_Contrato;
    private String diasHabiles;
    private String estado;
    private String observacion;
    private String ultimaActualizacion;
    private String idtipoContrato;
    private String idModalidad;
    
    private String nombre_Modalidad;
    private String nombre_TipoContrato;

   

    public String getIdContrato() {
        return idContrato;
    }

    public void setIdContrato(String idContrato) {
        this.idContrato = idContrato;
    }

    public String getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(String idPersona) {
        this.idPersona = idPersona;
    }

    public String getFechainicio_Contrato() {
        return fechainicio_Contrato;
    }

    public void setFechainicio_Contrato(String fechainicio_Contrato) {
        this.fechainicio_Contrato = fechainicio_Contrato;
    }

    public String getDiasHabiles() {
        return diasHabiles;
    }

    public void setDiasHabiles(String diasHabiles) {
        this.diasHabiles = diasHabiles;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public String getUltimaActualizacion() {
        return ultimaActualizacion;
    }

    public void setUltimaActualizacion(String ultimaActualizacion) {
        this.ultimaActualizacion = ultimaActualizacion;
    }

    public String getIdtipoContrato() {
        return idtipoContrato;
    }

    public void setIdtipoContrato(String idtipoContrato) {
        this.idtipoContrato = idtipoContrato;
    }

    public String getIdModalidad() {
        return idModalidad;
    }

    public void setIdModalidad(String idModalidad) {
        this.idModalidad = idModalidad;
    }

    public String getNombre_Modalidad() {
        return nombre_Modalidad;
    }

    public void setNombre_Modalidad(String nombre_Modalidad) {
        this.nombre_Modalidad = nombre_Modalidad;
    }

    public String getNombre_TipoContrato() {
        return nombre_TipoContrato;
    }

    public void setNombre_TipoContrato(String nombre_TipoContrato) {
        this.nombre_TipoContrato = nombre_TipoContrato;
    }
    
    
    
    
    public ContratoVO(String idcontrato, String idpersona, String fechainicio_contrato, String diashabiles, String Estado, String Observacion, String ultimaactualizacion, String idtipocontrato, String idmodalidad, String nombreM, String nombreT) {
        this.idContrato = idcontrato;
        this.idPersona = idpersona;
        this.fechainicio_Contrato = fechainicio_contrato;
        this.diasHabiles = diashabiles;
        this.estado = Estado;
        this.observacion = Observacion;
        this.ultimaActualizacion = ultimaactualizacion;
        this.idtipoContrato = idtipocontrato;
        this.idModalidad = idmodalidad;
        this.nombre_Modalidad = nombreM;
        this.nombre_TipoContrato = nombreT;
        
    }
    public ContratoVO()
    {}
    
    

    

}
