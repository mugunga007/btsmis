/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author Bruno
 */
@Entity
public class GenSet {
    @Id
    private String genSetId;
    private String btsId;
    private String manufacturer;
    private int capacity;
    private int quantity;
    private Date date;
    private String status;
    private Date lastUpdate;
    
    
    public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getGenSetId() {
        return genSetId;
    }

    public void setGenSetId(String genSetId) {
        this.genSetId = genSetId;
    }

    public String getBtsId() {
        return btsId;
    }

    public void setBtsId(String btsId) {
        this.btsId = btsId;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

   

    public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}


	public Date getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public GenSet(String genSetId, String btsId, String manufacturer,
			int capacity, int quantity, Date date,String status, Date lastUpdate) {
		super();
		this.genSetId = genSetId;
		this.btsId = btsId;
		this.manufacturer = manufacturer;
		this.capacity = capacity;
		this.quantity = quantity;
		this.date = date;
		this.status = status;
		this.lastUpdate = lastUpdate;
	}

	public GenSet() {
    }
    
    
    
}
