/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.PersonasVO;
import ModeloVO.SeguimientoVO;
import Util.conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author melis
 */
public class SeguimientoDAO extends conexion {

    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;

    public ArrayList<SeguimientoVO> listar() {

        conexion conexion = new conexion();
        ArrayList<SeguimientoVO> listarSeguimiento = new ArrayList<>();
        SeguimientoVO seguimiento;
        try {
            puente = conexion.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("SELECT m.Id_Modalidad, m.Nombre_Modalidad, "
                    + "r.Nombre_Requisitos FROM det_requisitos AS D "
                    + "INNER JOIN Modalidad AS m ON d.Id_Modalidad = m.Id_Modalidad "
                    + "INNER JOIN requisitos AS r on d.Id_Requisitos = r.Id_Requisitos");

            while (mensajero.next()) {
                seguimiento = new SeguimientoVO();
                seguimiento.setIdModalidad(mensajero.getInt("Id_Modalidad"));
                seguimiento.setNombreModalidad(mensajero.getString("Nombre_Modalidad"));
                seguimiento.setNombreRequisito(mensajero.getString("Nombre_Requisitos"));
                listarSeguimiento.add(seguimiento);

            }
        } catch (Exception e) {

            System.out.println("¡Error!" + e.toString());
        }
        return listarSeguimiento;

    }

    public List consultarRequisitos(String solicitud) {
        List requisitos = new ArrayList<>();

        try {
            conexion con = new conexion();
            conexion = con.obtenerConexion();
            CallableStatement consultar = conexion.prepareCall("call consultarRequisitos (?)");
            consultar.setString(1, solicitud);
            
            mensajero = consultar.executeQuery();

            while (mensajero.next()) {
                SeguimientoVO vo = new SeguimientoVO();
                vo.setIdRequisitos(mensajero.getInt(1));
                vo.setNombreRequisito(mensajero.getString(2));
                requisitos.add(vo);

            }

        } catch (Exception e) {
            System.out.println("Error " + e);
        }

        return requisitos;

    }

}
