package com.msproject.bean;

import java.io.Serializable;
import java.util.Date;

public class TaskView implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Integer level;
	private String name;
	private Date start;
	private Date finish;
	private Double percentageWorkComplete;
	private Integer delay;
	private String resourceText;
	private String predecessorsText;
	private String colorStatus;
	private boolean bold;
	
	public TaskView() {
	}

	public TaskView(Integer id, Integer level, String name, Date start, Date finish, Double percentageWorkComplete, Integer delay, String resourceText, String predecessorsText, String colorStatus, boolean bold) {
		this.id = id;
		this.level = level;
		this.name = name;
		this.start = start;
		this.finish = finish;
		this.percentageWorkComplete = percentageWorkComplete;
		this.delay = delay;
		this.resourceText = resourceText;
		this.predecessorsText = predecessorsText;
		this.colorStatus = colorStatus;
		this.bold = bold;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getFinish() {
		return finish;
	}

	public void setFinish(Date finish) {
		this.finish = finish;
	}

	public Double getPercentageWorkComplete() {
		return percentageWorkComplete;
	}

	public void setPercentageWorkComplete(Double percentageWorkComplete) {
		this.percentageWorkComplete = percentageWorkComplete;
	}

	public Integer getDelay() {
		return delay;
	}

	public void setDelay(Integer delay) {
		this.delay = delay;
	}

	public String getResourceText() {
		return resourceText;
	}

	public void setResourceText(String resourceText) {
		this.resourceText = resourceText;
	}

	public String getPredecessorsText() {
		return predecessorsText;
	}

	public void setPredecessorsText(String predecessorsText) {
		this.predecessorsText = predecessorsText;
	}

	public String getColorStatus() {
		return colorStatus;
	}

	public void setColorStatus(String colorStatus) {
		this.colorStatus = colorStatus;
	}

	public boolean isBold() {
		return bold;
	}

	public void setBold(boolean bold) {
		this.bold = bold;
	}

	@Override
	public String toString() {
		return "TaskView [id=" + id + ", level=" + level + ", name=" + name + ", start=" + start + ", finish=" + finish + ", percentageWorkComplete=" + percentageWorkComplete + ", delay=" + delay + ", resourceText=" + resourceText + ", predecessorsText=" + predecessorsText + ", colorStatus=" + colorStatus + ", bold=" + bold + "]";
	}

	
	
}
