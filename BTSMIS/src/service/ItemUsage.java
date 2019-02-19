package service;

import java.io.File;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class ItemUsage {
@Id @GeneratedValue
private int usageId;
private int userId;
private int itemId;
private int quantity;
private String description;
private Date date;
private String status;
////////////////
private String btsId;
private double runHour;
private String note;
private String attachment;
///////////////



public String getBtsId() {
	return btsId;
}





public void setBtsId(String btsId) {
	this.btsId = btsId;
}





public double getRunHour() {
	return runHour;
}





public void setRunHour(double runHour) {
	this.runHour = runHour;
}





public String getNote() {
	return note;
}





public void setNote(String note) {
	this.note = note;
}





public String getAttachment() {
	return attachment;
}





public void setAttachment(String attachment) {
	this.attachment = attachment;
}





public int getUsageId() {
	return usageId;
}



public void setUsageId(int usageId) {
	this.usageId = usageId;
}







public int getUserId() {
	return userId;
}





public void setUserId(int userId) {
	this.userId = userId;
}





public int getItemId() {
	return itemId;
}



public void setItemId(int itemId) {
	this.itemId = itemId;
}



public int getQuantity() {
	return quantity;
}



public void setQuantity(int quantity) {
	this.quantity = quantity;
}



public String getDescription() {
	return description;
}



public void setDescription(String description) {
	this.description = description;
}



public Date getDate() {
	return date;
}



public void setDate(Date date) {
	this.date = date;
}



public String getStatus() {
	return status;
}



public void setStatus(String status) {
	this.status = status;
}



public ItemUsage(int userId, int itemId, int quantity, String description,
		Date date, String status, String btsId, double runHour, String note,
		String attachment) {
	super();
	this.userId = userId;
	this.itemId = itemId;
	this.quantity = quantity;
	this.description = description;
	this.date = date;
	this.status = status;
	this.btsId = btsId;
	this.runHour = runHour;
	this.note = note;
	this.attachment = attachment;
}


public ItemUsage(int usageId, int userId, int itemId, int quantity,
		String description, Date date, String status, String btsId,
		double runHour, String note, String attachment) {
	super();
	this.usageId = usageId;
	this.userId = userId;
	this.itemId = itemId;
	this.quantity = quantity;
	this.description = description;
	this.date = date;
	this.status = status;
	this.btsId = btsId;
	this.runHour = runHour;
	this.note = note;
	this.attachment = attachment;
}





public ItemUsage(){
	
}

}
