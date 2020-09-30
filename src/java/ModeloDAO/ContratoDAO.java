/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.ContratoVO;
import ModeloVO.RequisitoCumplido;
import ModeloVO.RequisitoVO;
import Util.conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Dell_1
 */
public class ContratoDAO extends conexion {

    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;

    private String idContrato = "";
    private String idPersona = "";
    private String fechainicio_Contrato = "";
    private String diasHabiles = "";
    private String estado = "";
    private String observacion = "";
    private String ultimaActualizacion = "";
    private String idtipoContrato = "";
    private String idModalidad = "";
    private String nombreModalidad = "";
    private String nombreTipocontrato = "";

    private boolean operation = false;
    ContratoVO contratos = new ContratoVO();

    public ContratoDAO(ContratoVO contratoVO) throws SQLException {

        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();

            idPersona = contratoVO.getIdPersona();
            fechainicio_Contrato = contratoVO.getFechainicio_Contrato();
            diasHabiles = contratoVO.getDiasHabiles();
            estado = contratoVO.getEstado();
            observacion = contratoVO.getObservacion();
            ultimaActualizacion = contratoVO.getUltimaActualizacion();
            idtipoContrato = contratoVO.getIdtipoContrato();
            idModalidad = contratoVO.getIdModalidad();
            nombreModalidad = contratoVO.getNombre_Modalidad();
            nombreTipocontrato = contratoVO.getNombre_TipoContrato();

        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
    }

    public ContratoDAO() throws SQLException {
        try {

            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
    }

    public boolean AgregarRegistro() {

        try {

            puente.executeUpdate("CALL SP_INSERTCONTRATO ('" + idPersona + "','" + fechainicio_Contrato + "','" + diasHabiles + "','" + estado
                    + "','" + observacion + "','" + ultimaActualizacion + "','"
                    + idtipoContrato + "','" + idModalidad + "')");
            operation = true;

        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
        return operation;
    }

    public boolean ActualizarRegistro(int contrato) {
        try {

            conexion = this.obtenerConexion();
            CallableStatement update = conexion.prepareCall("CALL SP_UPDATECONTRATO (?,?,?,?,?,?)");
            update.setString(1, fechainicio_Contrato);
            update.setString(2, ultimaActualizacion);
            update.setString(3, diasHabiles);
            update.setString(4, estado);
            update.setString(5, observacion);
            update.setInt(6, contrato);

            update.executeUpdate();

            operation = true;

        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
        return operation;
    }

    public ArrayList<ContratoVO> listarc() {

        conexion conexion = new conexion();
        ArrayList<ContratoVO> listarc = new ArrayList<>();

        try {
            puente = conexion.obtenerConexion().createStatement();

            mensajero = puente.executeQuery("Select c.*, m.Nombre_Modalidad, t.Nombre_TipoContrato ,nombre_Persona from "
                    + "contrato as c inner join modalidad as m on m.Id_Modalidad = c.Id_Modalidad "
                    + "inner join tipo_contrato as t on t.Id_Tipo_Contrato = c.Id_TipoContrato INNER JOIN personas ON c.Id_Persona = personas.Id_Persona");

            while (mensajero.next()) {
                ContratoVO contratoVO = new ContratoVO();
                idContrato = mensajero.getString(1);
                idPersona = mensajero.getString(2);
                fechainicio_Contrato = mensajero.getString(3);
                diasHabiles = mensajero.getString(4);
                estado = mensajero.getString(5);
                observacion = mensajero.getString(6);
                ultimaActualizacion = mensajero.getString(7);
                idtipoContrato = mensajero.getString(8);
                idModalidad = mensajero.getString(9);
                String nombreM = mensajero.getString(10);
                String nombreT = mensajero.getString(11);

                contratoVO = new ContratoVO(idContrato, idPersona, fechainicio_Contrato, diasHabiles, estado, observacion, ultimaActualizacion, idtipoContrato, idModalidad, nombreM, nombreT);
                contratoVO.setNombrePersona(mensajero.getString(12));
                listarc.add(contratoVO);
            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
            return listarc = null;
        }
        return listarc;
    }

    public ArrayList<RequisitoVO> getRequisitos() {
        conexion conexion = new conexion();
        ArrayList<RequisitoVO> lista = new ArrayList<>();
        RequisitoVO requisito;
        try {
            puente = conexion.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("SELECT Id_Requisitos FROM det_requisitos Where Id_Modalidad = (SELECT Id_Modalidad FROM contrato where Id_Contrato = (SELECT MAX(Id_Contrato) FROM contrato))");
            while (mensajero.next()) {
                requisito = new RequisitoVO();
                requisito.setIdRequisito(mensajero.getInt("Id_Requisitos"));
                lista.add(requisito);
            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
            return lista = null;
        }
        return lista;
    }

    public void setRequisitosContrato() {
        conexion conexion = new conexion();
        ArrayList<RequisitoVO> listaRequisitos = this.getRequisitos();
        try {
            for (int i = 0; i < listaRequisitos.size(); i++) {
                puente.executeUpdate("INSERT INTO req_cumplidos(id_Contrato, id_Requisitos, cumplido) values((SELECT MAX(Id_Contrato) FROM contrato), " + listaRequisitos.get(i).getIdRequisito() + ", 0)");
            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
        }
    }

    public ArrayList<RequisitoCumplido> listaRequisitos(int id) {
        conexion conexion = new conexion();
        ArrayList<RequisitoCumplido> lista = new ArrayList<>();
        RequisitoCumplido requisito;
        try {
            puente = conexion.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("SELECT rc.*, r.Nombre_Requisitos FROM req_cumplidos as rc INNER JOIN requisitos as r on rc.id_Requisitos = r.Id_Requisitos where rc.id_Contrato = " + id);
            while (mensajero.next()) {
                requisito = new RequisitoCumplido();
                requisito.setIdRequisitoCumplido(mensajero.getInt("Id_req_Cumplidos"));
                requisito.setCumplido(mensajero.getInt("cumplido"));
                requisito.setNombreRequisito(mensajero.getString("Nombre_Requisitos"));
                lista.add(requisito);
            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
            return lista = null;
        }
        return lista;
    }

    public boolean UpdateRequisito(String id, String change) {
        boolean sentencia = false;
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
            puente.executeUpdate("update req_cumplidos set cumplido = " + change + " where Id_req_Cumplidos = " + id);
            sentencia = true;
        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
        return sentencia;
    }

    public ContratoVO consultarContrato(int contrato) {
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();
            mensajero = puente.executeQuery(" SELECT Id_Contrato, FechaInicio_Contrato,Observacion, DiasHabilesFirmaContrato,Estado, UltimaActualizacion FROM contrato WHERE Id_Contrato = " + contrato);
            if (mensajero.next()) {
                contratos.setIdContrato(mensajero.getString(1));
                contratos.setFechainicio_Contrato(mensajero.getString(2));
                contratos.setObservacion(mensajero.getString(3));
                contratos.setDiasHabiles(mensajero.getString(4));
                contratos.setEstado(mensajero.getString(5));
                contratos.setUltimaActualizacion(mensajero.getString(6));
            }
        } catch (Exception e) {

        }
        return contratos;
    }

}
