package com.msproject.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

import com.msproject.bean.TaskView;
import com.msproject.service.ReadMSProject;
import com.msproject.util.Constants;
import com.msproject.util.Util;

@ManagedBean(name = "mbDemoProject")
@ViewScoped
public class Controller {

	private String fileName;
	private Date date;
	private String dateText;
	private ReadMSProject readMSProject;
	private List<TaskView> lstTaskViews;

	public void preRenderView(){
    	FacesContext context = FacesContext.getCurrentInstance();
    	if(context.getExternalContext().getSessionMap().get("fileName")!=null){
    		System.out.println("El parametro llegó a la vista");
    		this.fileName = (String) context.getExternalContext().getSessionMap().get("fileName");
    		System.out.println("Solo el nombre del archivo: "+fileName);
    		this.setDate((Date) context.getExternalContext().getSessionMap().get("date"));
    	}
    	cargarTareas();
    }

	public Controller(){
		initVariables();
	}

	private void initVariables() {
		readMSProject = new ReadMSProject();
		lstTaskViews = new ArrayList<TaskView>();
	}

	public void cargarTareas(){
		System.out.println("Loading tasks from the file: "+fileName);
		lstTaskViews = readMSProject.getGanttViewFromFile(
				Constants.properties.getProperty("ruta.archivos.project") + this.fileName, this.date);
		for (TaskView taskView : lstTaskViews) {
    		System.out.println(taskView.toString());
    	}
	}

	/*
	 * GETTERS AND SETTERS
	 */
	public List<TaskView> getLstTaskViews() {
		return lstTaskViews;
	}

	public void setLstTaskViews(List<TaskView> lstTaskViews) {
		this.lstTaskViews = lstTaskViews;
	}

	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
		try {
			this.dateText = Util.dateToString(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDateText() {
		return dateText;
	}

	public void setDateText(String dateText) {
		this.dateText = dateText;
	}

	public ReadMSProject getReadMSProject() {
		return readMSProject;
	}

	public void setReadMSProject(ReadMSProject readMSProject) {
		this.readMSProject = readMSProject;
	}


}
