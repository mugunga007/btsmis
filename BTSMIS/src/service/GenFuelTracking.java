package service;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class GenFuelTracking {
	@Id @GeneratedValue
private int genFuelTrackingId;
private String genSetId;
private int userId;
private int remainingQuantity;
private String action;
private Date date;
private double runHours;
private double hours;
private int addedQuantity;
private double perHour; 
private int currentQuantity;
private int usedQuantity;
private int time;
private double longitude;
private double latitude;





public double getLongitude() {
	return longitude;
}
public void setLongitude(double longitude) {
	this.longitude = longitude;
}
public double getLatitude() {
	return latitude;
}
public void setLatitude(double latitude) {
	this.latitude = latitude;
}
public int getTime() {
	return time;
}
public void setTime(int time) {
	this.time = time;
}

public int getUsedQuantity() {
	return usedQuantity;
}
public void setUsedQuantity(int usedQuantity) {
	this.usedQuantity = usedQuantity;
}
public int getCurrentQuantity() {
	return currentQuantity;
}
public void setCurrentQuantity(int currentQuantity) {
	this.currentQuantity = currentQuantity;
}
public int getGenFuelTrackingId() {
	return genFuelTrackingId;
}
public void setGenFuelTrackingId(int genFuelTrackingId) {
	this.genFuelTrackingId = genFuelTrackingId;
}
public String getGenSetId() {
	return genSetId;
}
public void setGenSetId(String genSetId) {
	this.genSetId = genSetId;
}
public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}

public String getAction() {
	return action;
}
public void setAction(String action) {
	this.action = action;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}


public double getRunHours() {
	return runHours;
}
public void setRunHours(double runHours) {
	this.runHours = runHours;
}
public double getHours() {
	return hours;
}
public void setHours(double hours) {
	this.hours = hours;
}

public int getRemainingQuantity() {
	return remainingQuantity;
}
public void setRemainingQuantity(int remainingQuantity) {
	this.remainingQuantity = remainingQuantity;
}
public int getAddedQuantity() {
	return addedQuantity;
}
public void setAddedQuantity(int addedQuantity) {
	this.addedQuantity = addedQuantity;
}
public double getPerHour() {
	return perHour;
}
public void setPerHour(double perHour) {
	this.perHour = perHour;
}
public GenFuelTracking(){
	
}
public GenFuelTracking(int genFuelTrackingId, String genSetId, int userId,
		int remainingQuantity, String action, Date date, double runHours,
		double hours, int addedQuantity, double perHour, int currentQuantity,
		int usedQuantity, int time, double longitude, double latitude) {
	super();
	this.genFuelTrackingId = genFuelTrackingId;
	this.genSetId = genSetId;
	this.userId = userId;
	this.remainingQuantity = remainingQuantity;
	this.action = action;
	this.date = date;
	this.runHours = runHours;
	this.hours = hours;
	this.addedQuantity = addedQuantity;
	this.perHour = perHour;
	this.currentQuantity = currentQuantity;
	this.usedQuantity = usedQuantity;
	this.time = time;
	this.longitude = longitude;
	this.latitude = latitude;
}
public GenFuelTracking(String genSetId, int userId, int remainingQuantity,
		String action, Date date, double runHours, double hours,
		int addedQuantity, double perHour, int currentQuantity,
		int usedQuantity, int time, double longitude, double latitude) {
	super();
	this.genSetId = genSetId;
	this.userId = userId;
	this.remainingQuantity = remainingQuantity;
	this.action = action;
	this.date = date;
	this.runHours = runHours;
	this.hours = hours;
	this.addedQuantity = addedQuantity;
	this.perHour = perHour;
	this.currentQuantity = currentQuantity;
	this.usedQuantity = usedQuantity;
	this.time = time;
	this.longitude = longitude;
	this.latitude = latitude;
}




}
