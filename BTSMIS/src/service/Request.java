package service;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FieldResult;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.SqlResultSetMapping;

@Entity
public class Request {
@Id @GeneratedValue
	private int requestId;
	private int itemId;
	private int quantity;
	private Date requestDate;
	private int userId;
	private Date proposedDeliveryDate;
	
	private String status;
	private int deliveredQuantity;
	private Date actionDate;
	private int dumQuantity;
	private int stage;
	private String note;
	private int region;
	
	
	
	public int getRegion() {
		return region;
	}
	public void setRegion(int region) {
		this.region = region;
	}
	public int getStage() {
		return stage;
	}
	public void setStage(int stage) {
		this.stage = stage;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getRequestId() {
		return requestId;
	}
	public void setRequestId(int requestId) {
		this.requestId = requestId;
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
	public Date getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getProposedDeliveryDate() {
		return proposedDeliveryDate;
	}
	public void setProposedDeliveryDate(Date proposedDeliveryDate) {
		this.proposedDeliveryDate = proposedDeliveryDate;
	}
	
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getDeliveredQuantity() {
		return deliveredQuantity;
	}
	public void setDeliveredQuantity(int deliveredQuantity) {
		this.deliveredQuantity = deliveredQuantity;
	}
	public Date getActionDate() {
		return actionDate;
	}
	public void setActionDate(Date actionDate) {
		this.actionDate = actionDate;
	}
	public int getDumQuantity() {
		return dumQuantity;
	}
	public void setDumQuantity(int dumQuantity) {
		this.dumQuantity = dumQuantity;
	}
	
	
	
	

	public Request(int itemId, int quantity, Date requestDate, int userId,
			Date proposedDeliveryDate, String status, int deliveredQuantity,
			Date actionDate, int dumQuantity, int stage, String note, int region) {
		super();
		this.itemId = itemId;
		this.quantity = quantity;
		this.requestDate = requestDate;
		this.userId = userId;
		this.proposedDeliveryDate = proposedDeliveryDate;
		this.status = status;
		this.deliveredQuantity = deliveredQuantity;
		this.actionDate = actionDate;
		this.dumQuantity = dumQuantity;
		this.stage = stage;
		this.note = note;
		this.region = region;
	}
	public Request(){
		
	}
	public Request(int itemId, int quantity) {
		super();
		this.itemId = itemId;
		this.quantity = quantity;
	}
	public Request(int itemId, int quantity, int dumQuantity) {
		super();
		this.itemId = itemId;
		this.quantity = quantity;
		this.dumQuantity = dumQuantity;
	}
	
	


	
	
}
