/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 *
 * @author Bruno
 */
@Entity
public class Region {
    @Id @GeneratedValue
    private int regionId;
    private String rname="";
    private String userId;
    private Date date;
    private String description;

    public int getRegionId() {
        return regionId;
    }

    public void setRegionId(int regionId) {
        this.regionId = regionId;
    } 
    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public Region(String rname) {
        this.rname = rname;
    }
    

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
	
	public Region(String rname, String userId, Date date, String description) {
		super();
		this.rname = rname;
		this.userId = userId;
		this.date = date;
		this.description = description;
	}

	public Region(int regionId, String rname, String userId, Date date,
			String description) {
		super();
		this.regionId = regionId;
		this.rname = rname;
		this.userId = userId;
		this.date = date;
		this.description = description;
	}

	public Region() {
    }
    
    
    
}
