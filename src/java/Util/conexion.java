package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexion {

    private String driver, url, BD, user, password;
    private Connection conexion;

    public conexion() {
        driver = "com.mysql.jdbc.Driver";
        BD = "gesprec";
        user = "root";
        password = "";
        url = "jdbc:mysql://localhost:3306/" + BD;

        try {
            Class.forName(driver).newInstance();
            conexion = (Connection) DriverManager.getConnection(url, user, password);
            System.out.println(" La conexion fue exitosa");
        } catch (Exception e) {
            System.out.println("Error de conexion a la base da datos" + e.toString());

        }

    }

    public Connection obtenerConexion() {
        return conexion;
    }

    public Connection cerrarConexion() throws SQLException {
        conexion.close();
        conexion = null;
        return conexion;
    }

    public java.sql.Connection getJDBC() {
        return conexion;
    }

    public static void main(String[] args) {
        new conexion();
    }

}
