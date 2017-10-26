package com.msproject.util;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Properties;

import com.msproject.util.Constants;

public class Constants {

	public static final String PROPERTIES_NAME_CONFIG = "config.properties";
	public static Properties properties;
	public static InputStream propertiesInputStream;
	
   static
   {
       try
       {
      	 properties = new Properties(); 
      	 propertiesInputStream = Constants.class.getClassLoader().getResourceAsStream(PROPERTIES_NAME_CONFIG);
      	 
      	 if(propertiesInputStream != null){
      		 properties.load(propertiesInputStream);
      	 }else{
      		 throw new FileNotFoundException("property file '" + PROPERTIES_NAME_CONFIG + "' not found in the classpath");
      	 }

       }
       catch (Exception e){
           e.printStackTrace();
       }
   }
}
