package service;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.UniqueConstraint;

@Entity
public class ItemController{
@Id @GeneratedValue
	private int itemControllerId;
	private int itemId;
	private int quantity;
	private int userId;
	private String status;
	
	
	
	
	
	public int getItemControllerId() {
		return itemControllerId;
	}
	public void setItemControllerId(int itemControllerId) {
		this.itemControllerId = itemControllerId;
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

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public ItemController(int itemId, int quantity, int userId,
			String status) {
		super();
		this.itemId = itemId;
		this.quantity = quantity;
		this.userId = userId;
		this.status = status;
	}
	
	public ItemController(){
		
	}
}
