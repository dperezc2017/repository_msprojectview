package com.msproject.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;

import org.primefaces.model.UploadedFile;

import com.msproject.util.Constants;

@ManagedBean(name = "mbUpload")
@ViewScoped
public class UploadController {

	private UploadedFile file;
	private Date date;

	public UploadController(){
		date = new Date();
	}

	public String upload() {
		String redirect="#";
		if (!file.getFileName().equals("") && date!=null) {
			System.out.println("file.getFileName() : " + file.getFileName());
			System.out.println("dateForStatus : " + date);
			FacesContext context = FacesContext.getCurrentInstance();
			context.getExternalContext().getSessionMap().put("fileName", file.getFileName());
			context.getExternalContext().getSessionMap().put("date", date);
			try {
	            copyFile(file.getFileName(), file.getInputstream());
	            redirect = "actividadesProject.xhtml?faces-redirect=true";
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		}else{
			System.out.println("No file selected && No input Date");
	        FacesContext.getCurrentInstance().addMessage(null,
	        		new FacesMessage(FacesMessage.SEVERITY_INFO, "Aviso", "No se seleccionó nungún archivo o no se ingresó correctamente la fecha"));
		}
		return redirect;
	}

	public void copyFile(String fileName, InputStream in) {
		try {
			// write the inputStream to a FileOutputStream
			OutputStream out = new FileOutputStream(
					new File(Constants.properties.getProperty("ruta.archivos.project") + fileName));

			int read = 0;
			byte[] bytes = new byte[1024];

			while ((read = in.read(bytes)) != -1) {
				out.write(bytes, 0, read);
			}

			in.close();
			out.flush();
			out.close();

			System.out.println("New file created!");
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}

	public UploadedFile getFile() {
		return file;
	}
	public void setFile(UploadedFile file) {
		this.file = file;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
}
