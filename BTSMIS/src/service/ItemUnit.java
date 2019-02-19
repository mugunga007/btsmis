package service;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class ItemUnit {
	@Id @GeneratedValue
	private int id;
	private String name;
	private String description;
	private String type;
	private Date date;
	private String userId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public ItemUnit(String name, String description, String type, Date date,
			String userId) {
		super();
		this.name = name;
		this.description = description;
		this.type = type;
		this.date = date;
		this.userId = userId;
	}
public ItemUnit(){
	
}
}
