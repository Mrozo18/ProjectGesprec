package ModeloDAO;

import Util.conexion;
import Interfaces.CRUD;
import ModeloVO.Usuario;
import Util.CEncriptacion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO implements CRUD {

    conexion cn = new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs = null;
    Usuario usuario = new Usuario();
    private boolean sentencia = false;

    @Override
    public List listar() {
        ArrayList<Usuario> list = new ArrayList<>();
        String sql = "select * from usuarios";
        try {
            con = cn.obtenerConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usu = new Usuario();
                usu.setId(rs.getInt("id"));
                usu.setNombreUsu(rs.getString("nombreUsu"));
                usu.setContrasena(rs.getString("contrasena"));
                usu.setId_rol(rs.getString("id_rol"));
                list.add(usu);
            }

        } catch (Exception e) {

        }
        return list;
    }

    public Usuario validarCorreo(String user) {
        try {
            con = cn.obtenerConexion();
            CallableStatement valida = con.prepareCall("CALL validacorreo (?)");
            valida.setString(1, user);
            rs = valida.executeQuery();

            if (rs.next()) {
                usuario.setId(rs.getInt(1));
                usuario.setNombreUsu(rs.getString(2));
            } else {
                usuario.setId(0);
            }

        } catch (Exception e) {
            System.out.println("");
        }
        return usuario;
    }

    public boolean updatePassword(String password, int usuario) {
        sentencia = false;
        try {

            con = cn.obtenerConexion();
            CallableStatement update = con.prepareCall("CALL actualizarclave (?,?)");
            update.setInt(1, usuario);
            update.setString(2, CEncriptacion.encriptar(password));
            update.executeUpdate();

            sentencia = true;

        } catch (Exception e) {
            System.out.println("");
        }
        return sentencia;
    }

    @Override
    public Usuario list(int id) {
        String sql = "select * from usuarios where id=" + id;
        try {
            con = cn.obtenerConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                usuario.setId(rs.getInt("id"));
                usuario.setNombreUsu(rs.getString("nombreUsu"));
                usuario.setContrasena(rs.getString("contrasena"));
            }

        } catch (Exception e) {

        }
        return usuario;
    }

    @Override
    public boolean add(Usuario usu) {
        String sql = "insert into usuarios (nombreUsu, contrasena, id_rol) values ('" + usu.getNombreUsu() + "','" + CEncriptacion.encriptar(usu.getContrasena()) + "','" + usu.getId_rol() + "')";
        try {
            con = cn.obtenerConexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean edit(Usuario usu) {
        String sql = "update usuarios set nombreUsu='" + usu.getNombreUsu() + "',contrasena='" + usu.getContrasena() + "'where id=" + usu.getId();
        try {
            con = cn.obtenerConexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "delete from usuarios where id=" + id;
        try {
            con = cn.obtenerConexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {

        }
        return false;
    }

}
