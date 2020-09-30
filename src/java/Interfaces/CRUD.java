package Interfaces;

import ModeloVO.Usuario;
import java.util.List;

public interface CRUD {
    public List listar();
    public Usuario list(int id);
    public boolean add (Usuario usu);
    public boolean edit (Usuario usu);
    public boolean eliminar (int id);
}
