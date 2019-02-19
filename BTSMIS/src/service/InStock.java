/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 *
 * @author Bruno
 */
@Entity
public class InStock implements Serializable{
	@Id @GeneratedValue
    private int inStockId;
    private int itemId;
    private int quantity;
    private String supplier;
    
    private int category;
    private int system;
    private double ucost;
    private String type;
    private String brand;
    private int userId;
    private Date date;
    
    private String status;
    
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

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getSystem() {
		return system;
	}

	public void setSystem(int system) {
		this.system = system;
	}

	public double getUcost() {
		return ucost;
	}

	public void setUcost(double ucost) {
		this.ucost = ucost;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getInStockId() {
        return inStockId;
    }

    public void setInStockId(int inStockId) {
        this.inStockId = inStockId;
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

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	
	
public InStock(int inStockId, int itemId, int quantity, String supplier,
			int category, int system, double ucost, String type, String brand,
			int userId, Date date, String status) {
		super();
		this.inStockId = inStockId;
		this.itemId = itemId;
		this.quantity = quantity;
		this.supplier = supplier;
		this.category = category;
		this.system = system;
		this.ucost = ucost;
		this.type = type;
		this.brand = brand;
		this.userId = userId;
		this.date = date;
		this.status = status;
	}

public InStock(int itemId, int quantity, String supplier, int category,
			int system, double ucost, String type, String brand, int userId,
			Date date, String status) {
		super();
		this.itemId = itemId;
		this.quantity = quantity;
		this.supplier = supplier;
		this.category = category;
		this.system = system;
		this.ucost = ucost;
		this.type = type;
		this.brand = brand;
		this.userId = userId;
		this.date = date;
		this.status = status;
	}

public InStock(){
	   
   }
    
    
    
    
}
