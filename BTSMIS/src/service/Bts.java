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
public class Bts {
   
    @Id
 private String btsId;
 private String btsName;
 private int sitesclass; // class
 private int sitescategory; // category
 private String bscId;
 private String latitude;
 private String longitude;
 private int regionId;
 private int engineerId;
 private String userId;
 private Date date;
 private String status;

  
    public String getUserId() {
	return userId;
}

public void setUserId(String userId) {
	this.userId = userId;
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

	public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

 
    public String getBtsId() {
        return btsId;
    }

    public void setBtsId(String btsId) {
        this.btsId = btsId;
    }

    public String getBtsName() {
        return btsName;
    }

    public void setBtsName(String btsName) {
        this.btsName = btsName;
    }

  
    public String getBscId() {
        return bscId;
    }

   

	public int getSitesclass() {
		return sitesclass;
	}

	public void setSitesclass(int sitesclass) {
		this.sitesclass = sitesclass;
	}

	

	public int getSitescategory() {
		return sitescategory;
	}

	public void setSitescategory(int sitescategory) {
		this.sitescategory = sitescategory;
	}

	public void setBscId(String bscId) {
        this.bscId = bscId;
    }

    public int getRegionId() {
        return regionId;
    }

    public void setRegionId(int regionId) {
        this.regionId = regionId;
    }

    public int getEngineerId() {
        return engineerId;
    }

    public void setEngineerId(int engineerId) {
        this.engineerId = engineerId;
    }





	public Bts(String btsId, String btsName, int sitesclass, int sitescategory,
			String bscId, String latitude, String longitude, int regionId,
			int engineerId, String userId, Date date, String status) {
		super();
		this.btsId = btsId;
		this.btsName = btsName;
		this.sitesclass = sitesclass;
		this.sitescategory = sitescategory;
		this.bscId = bscId;
		this.latitude = latitude;
		this.longitude = longitude;
		this.regionId = regionId;
		this.engineerId = engineerId;
		this.userId = userId;
		this.date = date;
		this.status = status;
	}

	public Bts() {
    }
 
 
 
 
}
