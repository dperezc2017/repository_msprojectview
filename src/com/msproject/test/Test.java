package com.msproject.test;


import java.util.List;

import com.msproject.bean.TaskView;
import com.msproject.service.ReadMSProject;

public class Test {

	public static void main(String[] args) {

		ReadMSProject readMSProject = new ReadMSProject();
		
		List<TaskView> lstTaskViews = readMSProject.getGanttViewFromFile("D:\\Factura Electronica\\Desarrollo\\ReadMSProject\\fileTest\\INDECOPI-RIS-Cronograma-V1.0-Feb-16.mpp", (new java.util.Date()));
		
		for (TaskView taskView : lstTaskViews) {
			System.out.println(taskView.toString());
		}

	}

}
