package ModeloVO;

public class Usuario {

    int id;
    String nombreUsu;
    String contrasena;
    String id_rol;

    public Usuario() {

    }

    public Usuario(String nombreUsu, String contrasena,String id_rol) {
        this.nombreUsu = nombreUsu;
        this.contrasena = contrasena;
        this.id_rol = id_rol;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreUsu() {
        return nombreUsu;
    }

    public void setNombreUsu(String nombreUsu) {
        this.nombreUsu = nombreUsu;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getId_rol() {
        return id_rol;
    }

    public void setId_rol(String id_rol) {
        this.id_rol = id_rol;
    }
}
