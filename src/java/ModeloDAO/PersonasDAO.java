/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.PersonasVO;
import Util.CEncriptacion;
import Util.conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author melis
 */
public class PersonasDAO extends conexion {

    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;

    private String idPersona = "";//Estos tambien?
    private String nombrePersona = "";
    private String apellidoPersona = "";
    private String emailPersona = "";
    private String telefonoPersona = "";
    private String idUsuario = "";
    private String estadoPersona = "";
    private String usuario = "";
    private String clave = "";
    private String rol = "";

    private boolean operation = false;

    public PersonasDAO(PersonasVO PersonVO) {

        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();

            idPersona = PersonVO.getIdPersona();
            nombrePersona = PersonVO.getNombrePersona();
            apellidoPersona = PersonVO.getApellidoPersona();
            emailPersona = PersonVO.getEmailPersona();
            telefonoPersona = PersonVO.getTelefonoPersona();
            idUsuario = PersonVO.getIdUsuario();
            estadoPersona = PersonVO.getEstadoPersona();
            usuario = PersonVO.getUsuario();
            clave = PersonVO.getContrasena();
            rol = PersonVO.getId_rol();

        } catch (Exception e) {
            System.out.println("Error" + e.toString());

        }
    }

    public PersonasDAO() {

    }

    public boolean AgregarRegistro() {
        operation = false;
        try {
            conexion = this.obtenerConexion();

            CallableStatement addusuario = conexion.prepareCall("CALL addPersona (?,?,?,?,?,?,?,?)");
            addusuario.setString(1, nombrePersona);
            addusuario.setString(2, apellidoPersona);
            addusuario.setString(3, emailPersona);
            addusuario.setString(4, telefonoPersona);
            addusuario.setString(5, estadoPersona);
            addusuario.setString(6, usuario);
            addusuario.setString(7, clave);
            addusuario.setString(8, rol);

            addusuario.executeUpdate();

            operation = true;

        } catch (SQLException e) {
            System.out.println("¡Error!" + e.toString());
        }
        return operation;
    }

    public boolean ActualizarRegistro() {
        try {
            conexion = this.obtenerConexion();

            CallableStatement upd = conexion.prepareCall("CALL SP_UPDATEPERSONA (?,?,?,?,?,?)");
            upd.setString(1, nombrePersona);
            upd.setString(2, apellidoPersona);
            upd.setString(3, emailPersona);
            upd.setString(4, telefonoPersona);
            upd.setString(5, estadoPersona);
            upd.setString(6, usuario);

            upd.executeUpdate();
            operation = true;

        } catch (SQLException e) {
            System.out.println("¡Error!" + e.toString());
        }
        return operation;
    }

    public boolean ConsultarRegistro() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public boolean EliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public ArrayList<PersonasVO> listar() {

        conexion conexion = new conexion();
        ArrayList<PersonasVO> listarPersonas = new ArrayList<>();

        try {
            puente = conexion.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("CALL SP_SELECTPERSONAS");

            while (mensajero.next()) {

                idPersona = mensajero.getString(1);
                nombrePersona = mensajero.getString(2);
                apellidoPersona = mensajero.getString(3);
                telefonoPersona = mensajero.getString(4);
                emailPersona = mensajero.getString(5);
                idUsuario = mensajero.getString(6);
                estadoPersona = mensajero.getString(7);

                PersonasVO PersonVO = new PersonasVO(idPersona, nombrePersona, apellidoPersona, telefonoPersona, emailPersona, idUsuario, estadoPersona);

                listarPersonas.add(PersonVO);

            }
        } catch (Exception e) {

            System.out.println("¡Error!" + e.toString());
        }
        return listarPersonas;

    }

    public PersonasVO list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ArrayList<PersonasVO> listarId(String Id_Persona) {

        conexion conexion = new conexion();
        ArrayList<PersonasVO> listaPersonasA = new ArrayList<>();

        try {
            puente = conexion.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("CALL `SP_PERSONA`(" + idPersona + ");");

            while (mensajero.next()) {
                idPersona = mensajero.getString(1);
                nombrePersona = mensajero.getString(2);
                apellidoPersona = mensajero.getString(3);
                telefonoPersona = mensajero.getString(4);
                emailPersona = mensajero.getString(5);
                idUsuario = mensajero.getString(6);
                estadoPersona = mensajero.getString(7);

                PersonasVO PersonVO = new PersonasVO(idPersona, nombrePersona, apellidoPersona, telefonoPersona, emailPersona, idUsuario, estadoPersona);

                listaPersonasA.add(PersonVO);

            }
        } catch (Exception e) {

            System.out.println("¡Error!" + e.toString());
        }
        return listaPersonasA;

    }

    public static PersonasVO consultarId(String idPersona) {

        PersonasVO PersonVO = null;

        try {

            conexion Conexion = new conexion();
            Connection conexion = Conexion.obtenerConexion();
            Statement puente = conexion.createStatement();
            ResultSet mensajero = puente.executeQuery("select * from personas where IdPersona='" + idPersona + "'");
            while (mensajero.next()) {

                PersonVO = new PersonasVO(idPersona, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7));

            }
            mensajero.close();
            puente.close();

        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
        return PersonVO;
    }

    public ArrayList<PersonasVO> listarPersonas() {
        conexion conexion = new conexion();
        ArrayList<PersonasVO> listPersonas = new ArrayList<>();

        try {
            puente = conexion.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("SELECT  Id_Persona,nombre_persona,apellido_persona from personas");

            while (mensajero.next()) {
                PersonasVO persona = new PersonasVO();
                persona.setIdPersona(mensajero.getString(1));
                persona.setNombrePersona(mensajero.getString(2));
                persona.setApellidoPersona(mensajero.getString(3));

                listPersonas.add(persona);
            }
        } catch (Exception e) {
            System.out.println("Error!" + e.toString());
        }
        return listPersonas;
    }
}
