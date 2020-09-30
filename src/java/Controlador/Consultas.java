package Controlador;

import ModeloVO.Usuario;
import Util.CEncriptacion;
import Util.conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Consultas extends conexion {

    Usuario user = new Usuario();
        ResultSet rs = null;
    public Usuario autenticacion(String usuario, String contrasena) {
        PreparedStatement pst = null;
        try {

           
            String consulta = "SELECT * FROM usuarios WHERE usuario = ? AND PASSWORD = ?";
            pst = obtenerConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, CEncriptacion.encriptar(contrasena));
            rs = pst.executeQuery();

            //Guarda el resultado, y si tiene un registo devuelve un true
            if (rs.next()) {
                user.setNombreUsu(rs.getString(2));
                user.setContrasena(CEncriptacion.desencriptar(rs.getString(3)));
                user.setId_rol(rs.getString(4));
            }
        } catch (Exception e) {
            System.err.println("Error" + e);
        } finally {
            try {

                pst.close();

            } catch (Exception e) {
                System.err.println("Error" + e);
            }
        }
        return user;
    }

//    public boolean registrar(int id_usuario, String usuario, String contrasena, int Id_Rol) {
//        PreparedStatement pst = null;
//
//        try {
//            String consulta = "insert into usuarios (id_usuario,usuario,password,Id_Rol) values (?,?,?,?)";
//            pst = obtenerConexion().prepareStatement(consulta);
//            pst.setInt(1, id_usuario);
//            pst.setString(2, usuario);
//            pst.setString(3, contrasena);
//            pst.setInt(4, Id_Rol);
//            
//            if(pst.executeUpdate() == 1){
//                return true;
//            }
//        } catch (Exception ex) {
//            System.err.println("Error" + ex);
//        }finally{
//            try{
//                if(obtenerConexion() != null) obtenerConexion().close();
//                if(pst!= null) pst.close();
//            }catch(Exception e){
//                System.err.println("Error" + e);
//            }
//        }
//
//        return false;
//    }
}
