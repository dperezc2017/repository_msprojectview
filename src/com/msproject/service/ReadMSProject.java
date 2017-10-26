package com.msproject.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import net.sf.mpxj.ProjectFile;
import net.sf.mpxj.Relation;
import net.sf.mpxj.ResourceAssignment;
import net.sf.mpxj.Task;
import net.sf.mpxj.reader.ProjectReader;
import net.sf.mpxj.reader.ProjectReaderUtility;

import com.msproject.bean.TaskView;
import com.msproject.util.Constants;
import com.msproject.util.Util;

public class ReadMSProject {
	
	private String resourceText;
	private String predecessorsText;

	public List<TaskView> getGanttViewFromFile(String fileName, Date date){
		
		List<TaskView> lstTaskViews = new ArrayList<TaskView>();
		
		try {
			
			ProjectReader reader = ProjectReaderUtility.getProjectReader(fileName);
			ProjectFile projectFile = reader.read(fileName);
			
			for (Task task : projectFile.getAllTasks()){
				
				if(task.getID()>0){
					
					TaskView taskView = new TaskView();
					
					taskView.setId(task.getID());
					taskView.setLevel(task.getOutlineLevel());
					taskView.setName(Util.getMarginForLevel(task.getOutlineLevel()) + task.getName());
					taskView.setStart(task.getStart());
					taskView.setFinish(task.getFinish());
					taskView.setPercentageWorkComplete(task.getPercentageWorkComplete().doubleValue());
					
					if(task.getChildTasks().isEmpty()){
						taskView.setBold(false);
					}else{
						taskView.setBold(true);
					}
					
					if(taskView.getPercentageWorkComplete()<100){
						if(date!=null){
							if(date.after(task.getFinish())){
								taskView.setDelay((int)TimeUnit.DAYS.convert((date.getTime() - task.getFinish().getTime()), TimeUnit.MILLISECONDS));
								if(!taskView.isBold()){
									taskView.setColorStatus(Constants.properties.getProperty("task.status.color.delayed"));
								}
							}else{
								taskView.setDelay(0);
								if(!taskView.isBold()){
									taskView.setColorStatus(Constants.properties.getProperty("task.status.color.normal"));
								}
							}
						}
					}else{
						taskView.setDelay(0);
						if(!taskView.isBold()){
							taskView.setColorStatus(Constants.properties.getProperty("task.status.color.normal"));
						}
					}
					
					this.resourceText = "";
					List<ResourceAssignment> lstAssignments = task.getResourceAssignments();
					for (ResourceAssignment resourceAssignment : lstAssignments) {
						if(resourceText.isEmpty()) resourceText = resourceAssignment.getResource().getName();
						else resourceText = resourceText + ", " + resourceAssignment.getResource().getName(); 
					}
					taskView.setResourceText(resourceText);
					
					this.predecessorsText = "";
					List<Relation> predecessors = task.getPredecessors();					
					if (predecessors != null && predecessors.isEmpty() == false){
				      for (Relation relation : predecessors){				      	
				      	if(predecessorsText.isEmpty()) predecessorsText = Integer.toString(relation.getTargetTask().getID());
							else predecessorsText = predecessorsText + ", " + Integer.toString(relation.getTargetTask().getID());
				      }
				   }
					taskView.setPredecessorsText(predecessorsText);
					
					lstTaskViews.add(taskView);
					
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return lstTaskViews;
	}

}
