package com.msproject.model;

// Generated 07/10/2017 08:52:22 PM by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

/**
 * Tusuario generated by hbm2java
 */
public class Tusuario implements java.io.Serializable {

	private Integer codUsuario;
	private String nombreUsuario;
	private String clave;
	private String nombre;
	private String apellidoPaterno;
	private String apellidoMaterno;
	private int celular;
	private String correo;
	private String rol;
	private Set ttareas = new HashSet(0);

	public Tusuario() {
	}

	public Tusuario(String nombreUsuario, String clave, String nombre,
			String apellidoPaterno, String apellidoMaterno, int celular,
			String correo, String rol) {
		this.nombreUsuario = nombreUsuario;
		this.clave = clave;
		this.nombre = nombre;
		this.apellidoPaterno = apellidoPaterno;
		this.apellidoMaterno = apellidoMaterno;
		this.celular = celular;
		this.correo = correo;
		this.rol = rol;
	}

	public Tusuario(String nombreUsuario, String clave, String nombre,
			String apellidoPaterno, String apellidoMaterno, int celular,
			String correo, String rol, Set ttareas) {
		this.nombreUsuario = nombreUsuario;
		this.clave = clave;
		this.nombre = nombre;
		this.apellidoPaterno = apellidoPaterno;
		this.apellidoMaterno = apellidoMaterno;
		this.celular = celular;
		this.correo = correo;
		this.rol = rol;
		this.ttareas = ttareas;
	}

	public Integer getCodUsuario() {
		return this.codUsuario;
	}

	public void setCodUsuario(Integer codUsuario) {
		this.codUsuario = codUsuario;
	}

	public String getNombreUsuario() {
		return this.nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	public String getClave() {
		return this.clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidoPaterno() {
		return this.apellidoPaterno;
	}

	public void setApellidoPaterno(String apellidoPaterno) {
		this.apellidoPaterno = apellidoPaterno;
	}

	public String getApellidoMaterno() {
		return this.apellidoMaterno;
	}

	public void setApellidoMaterno(String apellidoMaterno) {
		this.apellidoMaterno = apellidoMaterno;
	}

	public int getCelular() {
		return this.celular;
	}

	public void setCelular(int celular) {
		this.celular = celular;
	}

	public String getCorreo() {
		return this.correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getRol() {
		return this.rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public Set getTtareas() {
		return this.ttareas;
	}

	public void setTtareas(Set ttareas) {
		this.ttareas = ttareas;
	}

}
