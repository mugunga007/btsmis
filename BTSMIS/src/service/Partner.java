package service;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Partner {
	
@Id
 int partnerId;
 String partnerName="";
 String email="";
 String phone="";
 int userId;
public int getPartnerId() {
	return partnerId;
}
public void setPartnerId(int partnerId) {
	this.partnerId = partnerId;
}
public String getPartnerName() {
	return partnerName;
}
public void setPartnerName(String partnerName) {
	this.partnerName = partnerName;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public Partner(int partnerId,String partnerName, String email, String phone, int userId) {
	super();
	this.partnerId = partnerId;
	this.partnerName = partnerName;
	this.email = email;
	this.phone = phone;
	this.userId = userId;
}
 


public Partner(){
	
}

}
