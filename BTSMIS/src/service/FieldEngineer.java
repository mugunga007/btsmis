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
public class FieldEngineer {

    @Id @GeneratedValue
    private int engId;
    private String fname;
    private String lname;
    private String email;
    private String tel;
    private String description;
    private Date date;
    private String userID;
    private int region;
    private String status;
    
    
    
    
    public void setDate(Date date) {
		this.date = date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	 

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public int getEngId() {
        return engId;
    }

    public void setEngId(int engId) {
        this.engId = engId;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

  
   

	

	public int getRegion() {
		return region;
	}

	public void setRegion(int region) {
		this.region = region;
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public FieldEngineer(String fname, String lname, String email, String tel,
			String description, Date date, String userID, int region,
			String status) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.tel = tel;
		this.description = description;
		this.date = date;
		this.userID = userID;
		this.region = region;
		this.status = status;
	}

	public FieldEngineer() {
    }

}
