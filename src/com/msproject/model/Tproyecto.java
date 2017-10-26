package com.msproject.model;

// Generated 07/10/2017 08:52:22 PM by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

/**
 * Tproyecto generated by hbm2java
 */
public class Tproyecto implements java.io.Serializable {

	private Integer codProyecto;
	private String nombreProyecto;
	private String descripcionProyecto;
	private String encargado;
	private Set ttareas = new HashSet(0);

	public Tproyecto() {
	}

	public Tproyecto(String nombreProyecto, String descripcionProyecto,
			String encargado, Set ttareas) {
		this.nombreProyecto = nombreProyecto;
		this.descripcionProyecto = descripcionProyecto;
		this.encargado = encargado;
		this.ttareas = ttareas;
	}

	public Integer getCodProyecto() {
		return this.codProyecto;
	}

	public void setCodProyecto(Integer codProyecto) {
		this.codProyecto = codProyecto;
	}

	public String getNombreProyecto() {
		return this.nombreProyecto;
	}

	public void setNombreProyecto(String nombreProyecto) {
		this.nombreProyecto = nombreProyecto;
	}

	public String getDescripcionProyecto() {
		return this.descripcionProyecto;
	}

	public void setDescripcionProyecto(String descripcionProyecto) {
		this.descripcionProyecto = descripcionProyecto;
	}

	public String getEncargado() {
		return this.encargado;
	}

	public void setEncargado(String encargado) {
		this.encargado = encargado;
	}

	public Set getTtareas() {
		return this.ttareas;
	}

	public void setTtareas(Set ttareas) {
		this.ttareas = ttareas;
	}

}
