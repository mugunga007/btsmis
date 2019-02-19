package controller;

import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.print.CancelablePrintJob;
import javax.print.attribute.standard.DateTimeAtCompleted;

import service.Request;
import service.User;
import model.ItemModel;
import model.RequestModel;
import model.UserModel;

public class TestMain {
public static void main(String[]age){
	String ds1 = "2016-12-31";
	String ds2 = "2017-01-01";
	Date d1 = null;
	Date d2 = null;
	try{
		d1 = new SimpleDateFormat("yyyy-MM-dd").parse(ds1);
		d2 = new SimpleDateFormat("yyyy-MM-dd").parse(ds2);
		
	}catch(Exception e){
		e.printStackTrace();
	}
System.out.println(daysBetween(d1, d2));	

}

public static int daysBetween(Date d1, Date d2){
	
	Calendar ca1 = new GregorianCalendar();
	Calendar ca2 = new GregorianCalendar();
	Calendar caf = new GregorianCalendar();
	int days = 0;
	ca1.setTime(d1);
	ca2.setTime(d2);
	
	Date dumd = null;
	String cafs = ca1.YEAR+"-12-31";
	try{
		dumd = new SimpleDateFormat("yyyy-MM-dd").parse(cafs);
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	caf.setTime(dumd);
	
int daysca1 = ca1.get(Calendar.DAY_OF_YEAR);
int daysca2 = ca2.get(Calendar.DAY_OF_YEAR);
int dayscaf = caf.get(Calendar.DAY_OF_YEAR);

if(ca2.after(ca1))
if(ca1.get(Calendar.YEAR) == ca2.get(Calendar.YEAR))
	days = daysca2 - daysca1;
else
	days = (dayscaf - daysca1) + daysca2 + 1;


return days;

}

}


