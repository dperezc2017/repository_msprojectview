package com.msproject.dao;

import java.util.List;

import com.msproject.model.Tusuario;

public interface UsuariocrudDAO {
		public List mostrarUsuarios();    
	    public void nuevoUsuario (Tusuario Tusuario);
	    public void modificarUsuario (Tusuario Tusuario);
	    public void eliminarUsuario (Tusuario Tusuario);
	    
}
