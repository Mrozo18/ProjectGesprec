package ModeloDAO;

import Util.conexion;
import ModeloVO.Modalidad;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ModalidadDAO {

    private conexion con = new conexion();
    private Connection connection;

    public ArrayList<Modalidad> getAll() {
        ArrayList<Modalidad> listaModalidad = new ArrayList<>();
        try {
            String query = "Select * from modalidad";
            con.obtenerConexion();
            connection = con.getJDBC();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                Modalidad modalidad = new Modalidad();
                modalidad.setIdModalidad(rs.getInt("Id_Modalidad"));
                modalidad.setNombre_Modalidad(rs.getString("Nombre_Modalidad"));
                listaModalidad.add(modalidad);
            }
            statement.close();
            con.cerrarConexion();
        } catch (SQLException e) {
            Logger.getLogger(ModalidadDAO.class.getName()).log(Level.SEVERE, null, e);
            listaModalidad = null;
        }
        return listaModalidad;
    }

    public ArrayList<Modalidad> getBy(String Strwhere) {
        ArrayList<Modalidad> listaModalidad = new ArrayList<>();
        try {
            String query = "Select * from modalidad where " + Strwhere;
            con.obtenerConexion();
            connection = con.getJDBC();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                Modalidad modalidad = new Modalidad();
                modalidad.setIdModalidad(rs.getInt("Id_Modalidad"));
                modalidad.setNombre_Modalidad(rs.getString("Nombre_Modalidad"));
                listaModalidad.add(modalidad);
            }
            statement.close();
            con.cerrarConexion();
        } catch (SQLException e) {
            Logger.getLogger(ModalidadDAO.class.getName()).log(Level.SEVERE, null, e);
            listaModalidad = null;
        }
        return listaModalidad;
    }

    public boolean crearModalidad(Modalidad modalidad) {
        boolean rowInserted = false;
        try {
            String query = String.format("Insert into modalidad(Nombre_Modalidad) values('%1$s')", modalidad.getNombre_Modalidad());
            con.obtenerConexion();
            connection = con.getJDBC();
            PreparedStatement statement = connection.prepareStatement(query);

            rowInserted = statement.executeUpdate() > 0;

            statement.close();
            con.cerrarConexion();
        } catch (SQLException e) {
            Logger.getLogger(ModalidadDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return rowInserted;
    }

    public boolean actualizarModalidad(Modalidad modalidad) {
        boolean rowUpdated = false;
        try {
            String query = String.format("Update modalidad set Nombre_Modalidad = '%1$s' where Id_Modalidad = '%2$s'",
                    modalidad.getNombre_Modalidad(), modalidad.getIdModalidad());
            con.obtenerConexion();
            connection = con.getJDBC();
            PreparedStatement statement = connection.prepareStatement(query);

            rowUpdated = statement.executeUpdate() > 0;

            statement.close();
            con.cerrarConexion();
        } catch (SQLException e) {
            Logger.getLogger(ModalidadDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return rowUpdated;
    }

    public boolean delete(Modalidad modalidad) {
        boolean rowDelete = false;
        try {
            String query = String.format("Delete modalidad set Nombre_Modalidad = '%1$s' where Id_Modalidad = '%2$s'", modalidad.getNombre_Modalidad(), modalidad.getIdModalidad());
            con.obtenerConexion();
            connection = con.getJDBC();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, modalidad.getIdModalidad());

            rowDelete = statement.executeUpdate() > 0;

            statement.close();
            con.cerrarConexion();
        } catch (SQLException e) {
            Logger.getLogger(ModalidadDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return rowDelete;
    }

}
