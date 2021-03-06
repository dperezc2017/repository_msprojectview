package com.msproject.model;

// Generated 07/10/2017 08:52:22 PM by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * Ttarea generated by hbm2java
 */
public class Ttarea implements java.io.Serializable {

	private Integer codTarea;
	private Tusuario tusuario;
	private Tproyecto tproyecto;
	private String nombreTarea;
	private Date fechaInicio;
	private Date fechaFin;
	private String completado;
	private Integer retraso;
	private Integer predecesor;

	public Ttarea() {
	}

	public Ttarea(Tusuario tusuario, Tproyecto tproyecto) {
		this.tusuario = tusuario;
		this.tproyecto = tproyecto;
	}

	public Ttarea(Tusuario tusuario, Tproyecto tproyecto, String nombreTarea,
			Date fechaInicio, Date fechaFin, String completado,
			Integer retraso, Integer predecesor) {
		this.tusuario = tusuario;
		this.tproyecto = tproyecto;
		this.nombreTarea = nombreTarea;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.completado = completado;
		this.retraso = retraso;
		this.predecesor = predecesor;
	}

	public Integer getCodTarea() {
		return this.codTarea;
	}

	public void setCodTarea(Integer codTarea) {
		this.codTarea = codTarea;
	}

	public Tusuario getTusuario() {
		return this.tusuario;
	}

	public void setTusuario(Tusuario tusuario) {
		this.tusuario = tusuario;
	}

	public Tproyecto getTproyecto() {
		return this.tproyecto;
	}

	public void setTproyecto(Tproyecto tproyecto) {
		this.tproyecto = tproyecto;
	}

	public String getNombreTarea() {
		return this.nombreTarea;
	}

	public void setNombreTarea(String nombreTarea) {
		this.nombreTarea = nombreTarea;
	}

	public Date getFechaInicio() {
		return this.fechaInicio;
	}

	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public Date getFechaFin() {
		return this.fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

	public String getCompletado() {
		return this.completado;
	}

	public void setCompletado(String completado) {
		this.completado = completado;
	}

	public Integer getRetraso() {
		return this.retraso;
	}

	public void setRetraso(Integer retraso) {
		this.retraso = retraso;
	}

	public Integer getPredecesor() {
		return this.predecesor;
	}

	public void setPredecesor(Integer predecesor) {
		this.predecesor = predecesor;
	}

}
