package service;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.UniqueConstraint;

@Entity
public class User {
	
@Id @GeneratedValue
private int id;

private String fname="";
private String lname="";
private String email="";
private String tel="";
private String status;
private String description;
private String username;
private String password;
private String role;
private int region;
private int userId;
private Date date;
private int level;

public int getLevel() {
	return level;
}
public void setLevel(int level) {
	this.level = level;
}
public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
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
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getRole() {
	return role;
}
public void setRole(String role) {
	this.role = role;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}



public int getRegion() {
	return region;
}
public void setRegion(int region) {
	this.region = region;
}


public User(String fname, String lname, String email, String tel,
		String status, String description, String username, String password,
		String role, int region, int userId, Date date, int level) {
	super();
	this.fname = fname;
	this.lname = lname;
	this.email = email;
	this.tel = tel;
	this.status = status;
	this.description = description;
	this.username = username;
	this.password = password;
	this.role = role;
	this.region = region;
	this.userId = userId;
	this.date = date;
	this.level = level;
}




public User(int id, String fname, String lname, String email, String tel,
		String status, String description, String username, String password,
		String role, int region, int userId, Date date, int level) {
	super();
	this.id = id;
	this.fname = fname;
	this.lname = lname;
	this.email = email;
	this.tel = tel;
	this.status = status;
	this.description = description;
	this.username = username;
	this.password = password;
	this.role = role;
	this.region = region;
	this.userId = userId;
	this.date = date;
	this.level = level;
}
public User(){

}

}
