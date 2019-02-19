package service;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Ticket {
	@Id @GeneratedValue
	 private int ticketId;
	 private int requestId;
	 private Date openTime;
	 private Date closeTime;
	 private String status;
	 private int issuedBy;
	 private int userId;
	public int getTicketId() {
		return ticketId;
	}
	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}
	public int getRequestId() {
		return requestId;
	}
	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}
	public Date getOpenTime() {
		return openTime;
	}
	public void setOpenTime(Date openTime) {
		this.openTime = openTime;
	}
	public Date getCloseTime() {
		return closeTime;
	}
	public void setCloseTime(Date closeTime) {
		this.closeTime = closeTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getIssuedBy() {
		return issuedBy;
	}
	public void setIssuedBy(int issuedBy) {
		this.issuedBy = issuedBy;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Ticket(int ticketId, int requestId, Date openTime, Date closeTime,
			String status, int issuedBy, int userId) {
		super();
		this.ticketId = ticketId;
		this.requestId = requestId;
		this.openTime = openTime;
		this.closeTime = closeTime;
		this.status = status;
		this.issuedBy = issuedBy;
		this.userId = userId;
	}
	 
	 
}
