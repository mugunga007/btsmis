package service;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class AccessRequest {

	 @Id @GeneratedValue
	    private int requestId;
	    private int partnerId;
	    private String btsId;
	    private Date accessDate;
	    private String staffId;
	    private String staffFname;
	    private String staffLname;
	    private String reason;
	    private Date timeReceiveInfo;
	    private String infoFrom;
	    private String reportedIssue;
	    private String ticketSeverity;
	    private String status;
	    private int userId;
	    private Date date;
	    
	    
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		public int getRequestId() {
			return requestId;
		}
		public void setRequestId(int requestId) {
			this.requestId = requestId;
		}
		public int getPartnerId() {
			return partnerId;
		}
		public void setPartnerId(int partnerId) {
			this.partnerId = partnerId;
		}
		public String getBtsId() {
			return btsId;
		}
		public void setBtsId(String btsId) {
			this.btsId = btsId;
		}
		public Date getAccessDate() {
			return accessDate;
		}
		public void setAccessDate(Date accessDate) {
			this.accessDate = accessDate;
		}
		public String getStaffId() {
			return staffId;
		}
		public void setStaffId(String staffId) {
			this.staffId = staffId;
		}
		public String getStaffFname() {
			return staffFname;
		}
		public void setStaffFname(String staffFname) {
			this.staffFname = staffFname;
		}
		public String getStaffLname() {
			return staffLname;
		}
		public void setStaffLname(String staffLname) {
			this.staffLname = staffLname;
		}
		public String getReason() {
			return reason;
		}
		public void setReason(String reason) {
			this.reason = reason;
		}
		public Date getTimeReceiveInfo() {
			return timeReceiveInfo;
		}
		public void setTimeReceiveInfo(Date timeReceiveInfo) {
			this.timeReceiveInfo = timeReceiveInfo;
		}
		public String getInfoFrom() {
			return infoFrom;
		}
		public void setInfoFrom(String infoFrom) {
			this.infoFrom = infoFrom;
		}
		public String getReportedIssue() {
			return reportedIssue;
		}
		public void setReportedIssue(String reportedIssue) {
			this.reportedIssue = reportedIssue;
		}
		public String getTicketSeverity() {
			return ticketSeverity;
		}
		public void setTicketSeverity(String ticketSeverity) {
			this.ticketSeverity = ticketSeverity;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		
		
		
		
public AccessRequest(int partnerId, String btsId, Date accessDate,
				String staffId, String staffFname, String staffLname,
				String reason, Date timeReceiveInfo, String infoFrom,
				String reportedIssue, String ticketSeverity, String status,
				int userId, Date date) {
			super();
			this.partnerId = partnerId;
			this.btsId = btsId;
			this.accessDate = accessDate;
			this.staffId = staffId;
			this.staffFname = staffFname;
			this.staffLname = staffLname;
			this.reason = reason;
			this.timeReceiveInfo = timeReceiveInfo;
			this.infoFrom = infoFrom;
			this.reportedIssue = reportedIssue;
			this.ticketSeverity = ticketSeverity;
			this.status = status;
			this.userId = userId;
			this.date = date;
		}
public AccessRequest(){
	
}
	    
}
