package com.msproject.bean;

import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

import com.msproject.dao.UsuarioDAO;
import com.msproject.dao.UsuariocrudDAO;
import com.msproject.dao.UsuariocrudDaoImp;
import com.msproject.model.Tusuario;

@ManagedBean
@RequestScoped
@ViewScoped
public class UsuarioBean {

	private Tusuario tusuario = new Tusuario();
	private UsuarioDAO usuarioDAO = new UsuarioDAO();
	private List<Tusuario> lstTusuario;

	public Tusuario getTusuario() {
		return tusuario;
	}

	public void setTusuario(Tusuario tusuario) {
		this.tusuario = tusuario;
	}

	public UsuarioDAO getUsuarioDAO() {
		return usuarioDAO;
	}

	public void setUsuarioDAO(UsuarioDAO usuarioDAO) {
		this.usuarioDAO = usuarioDAO;
	}

	public List<Tusuario> getLstTusuario() {
		return lstTusuario;
	}

	public void setLstTusuario(List<Tusuario> lstTusuario) {
		this.lstTusuario = lstTusuario;
	}

	public String verificarDatos() throws Exception {
		UsuarioDAO usuDAO = new UsuarioDAO();
		Tusuario us = new Tusuario();
		String resultado = "";
		try {
			us = usuDAO.verificarDatos(this.tusuario);
			System.out.println("tusuario.getNombreUsuario():  "+tusuario.getNombreUsuario());
			if (us != null) {
				if (tusuario.getNombreUsuario().equals("dperezc") || tusuario.getNombreUsuario().equals("DPEREZC") ) {
					FacesContext.getCurrentInstance().getExternalContext()
							.getSessionMap().put("Tusuario", us);
					FacesContext.getCurrentInstance().addMessage(
							null,
							new FacesMessage(FacesMessage.SEVERITY_INFO,
									"Aviso", "Sesion Iniciada"));
					resultado = "exitoAdministrador";
				} else {
					FacesContext.getCurrentInstance().getExternalContext()
							.getSessionMap().put("Tusuario", us);
					FacesContext.getCurrentInstance().addMessage(
							null,
							new FacesMessage(FacesMessage.SEVERITY_INFO,
									"Aviso", "Sesion Iniciada"));
					resultado = "exito";
					System.out.println("EXITO EN VERIFICAR DATOS");
				}

			} else {

				resultado = "error";
				System.out.println("ERROR EN VERIFICAR DATOS");
				FacesContext.getCurrentInstance().addMessage(
						null,
						new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error",
								"Error al Iniciar Sesion"));
			}

		} catch (Exception e) {
			throw e;
		}

		return resultado;
	}

	public boolean verificarSesion() {
		boolean estado;
		if (FacesContext.getCurrentInstance().getExternalContext()
				.getSessionMap().get("Tusuario") == null) {
			estado = false;
		} else {
			estado = true;
		}
		return estado;
	}

	public String cerrarSesion() {
		FacesContext.getCurrentInstance().getExternalContext()
				.invalidateSession();
		return "index";
	}

	private List<Tusuario> listar;

	public void setListar(List<Tusuario> listar) {
		this.listar = listar;
	}

	public List<Tusuario> getListar() {
		UsuariocrudDAO eDao = new UsuariocrudDaoImp();
		listar = eDao.mostrarUsuarios();
		return listar;
	}

	public void nuevoUsuario() {
		try {
			UsuariocrudDAO eDao = new UsuariocrudDaoImp();
			eDao.nuevoUsuario(tusuario);
			tusuario = new Tusuario();
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, "Aviso",
							"Registro Satisfactorio"));
		} catch (Exception e) {
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error",
							"Error al Registrar Datos del Usuario"));
		}

	}

	public void modificarUsuario() {
		try {
			UsuariocrudDAO eDao = new UsuariocrudDaoImp();
			eDao.modificarUsuario(tusuario);
			tusuario = new Tusuario();
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, "Aviso",
							"Usuario Modificado"));
		} catch (Exception e) {
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error",
							"Error al Modificar Datos del Usuario"));
		}

	}

	public void eliminarUsuario() {
		try {
			UsuariocrudDAO eDao = new UsuariocrudDaoImp();
			eDao.eliminarUsuario(tusuario);
			tusuario = new Tusuario();
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, "Aviso",
							"Usuario Eliminado"));
		} catch (Exception e) {
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error",
							"Error al Eliminar Datos del Usuario"));
		}

	}

}
