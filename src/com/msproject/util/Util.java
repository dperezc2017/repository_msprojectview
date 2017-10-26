package com.msproject.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.w3c.dom.*;

import com.msproject.util.Util;

public class Util {

	public static final int LONGITUD_DECIMAL = 2;
	
	public static Date getDateDefault() {
		return new GregorianCalendar(2999, 11, 31).getTime();
	}
	
	public static String getMarginForLevel(Integer level) {
		String margin = "";
		for (int i = 0; i < level; i++) {
			margin = margin + "\t";
		}
		
		return margin;
	}

	public static Date getDateTimeDefault() {
		return new GregorianCalendar(2999, 11, 31, 0, 0, 0).getTime();
	}

	public static Date getCurrentDate() {
		Calendar calendar = Calendar.getInstance();
		return new GregorianCalendar(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH)).getTime();
	}

	public static Date getCurrentDateTime() {
		Calendar calendar = Calendar.getInstance();
		return new GregorianCalendar(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH), calendar.get(Calendar.HOUR_OF_DAY), calendar.get(Calendar.MINUTE), calendar.get(Calendar.SECOND)).getTime();
	}

	public static Date stringToDate(String date) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.parse(date);
	}

	public static String dateToString(Date date) throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
		return format.format(date);
	}

	public static Double stringToDouble(String value) {
		if(Util.validateString(value)){
			try {
				NumberFormat nf = new DecimalFormat("#,##0.##", new DecimalFormatSymbols(Locale.ENGLISH));
				return nf.parse(value).doubleValue();		
			}
			catch(Exception e) {
				return null;
			}
		}else return null;
	}
	
	public static Integer stringToInteger(String value) {
		if(Util.validateString(value)){
			try {
				NumberFormat nf = new DecimalFormat("#,##0.##", new DecimalFormatSymbols(Locale.ENGLISH));
				return nf.parse(value).intValue();
			}
			catch(Exception e) {
				return null;
			}
		}else return null;
	}
	
	public static String formatDouble(Double value){
		return String.format("%1$,.2f", value);
	}
	
	public static boolean validateString(String data){
		if((data == null) || data.trim().isEmpty() || data.equals("-")) return false;
		else return true;
	}
	
	public static boolean validateDate(Date data){
		if(data == null) return false;
		else return true;
	}
	
	public static boolean validateInteger(Integer data){
		if((data == null) || (data.intValue() < 0)) return false;
		else return true;
	}
	
	public static boolean validateDouble(Double data){
		if((data == null)  || (data.intValue() < 0)) return false;
		else return true;
	}
	
	public static boolean validateCharacter(Character data){
		if((data == null) || (data == ' ') || (data == '-')) return false;
		else return true;
	}
	
	public static Integer converterDefaultInteger(Integer data){
		if((data == null) || (data.intValue() < 0)) return null;
		else return data;
	}
	
	public static Double converterDefaultDouble(Double data){
		if((data == null)  || (data.intValue() < 0)) return null;
		else return data;
	}
	
	public static BigDecimal toBigDecimal(Object obj) {
		
		if(obj != null){
			try {
				BigDecimal bigDecimal = null;
				if(obj instanceof BigDecimal) {
					bigDecimal = (BigDecimal)obj;
				}
				else if(obj instanceof String) {
					NumberFormat nf = new DecimalFormat("#,##0.##", new DecimalFormatSymbols(Locale.ENGLISH));
					bigDecimal = new BigDecimal(nf.parse((String)obj).doubleValue());
				}
				else if(obj instanceof Double) {
					NumberFormat nf = new DecimalFormat("#,##0.##", new DecimalFormatSymbols(Locale.ENGLISH));
					bigDecimal = new BigDecimal(nf.parse(obj.toString()).doubleValue());
				}
				else return null;
		
				bigDecimal = bigDecimal.setScale(LONGITUD_DECIMAL, BigDecimal.ROUND_HALF_UP);
				return bigDecimal;
			}
			catch(Exception e) {
				return null;
			}
		}else return null;
	}

	public static boolean stringToBoolean(String valor){
		return valor.equalsIgnoreCase("true");
	}
}
