package service;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class AccessHandling {
	 @Id @GeneratedValue
	    private int accessHandlingId;
	    private int ticketId;
	    private Date reportingTime;
	    private String statusAtArrival;
	    private String actualIssue;
	    private String issueHandlingResult;
	    private String downtime;
	    private String downtimereason;
	    private int runningHours;
	    private String statusAtDeparture;
	    private int userId;
	    private String attachement;
	    private String status;
	   

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public String getAttachement() {
			return attachement;
		}

		public void setAttachement(String attachement) {
			this.attachement = attachement;
		}

		public int getAccessHandlingId() {
			return accessHandlingId;
		}
		
		public void setAccessHandlingId(int accessHandlingId) {
			this.accessHandlingId = accessHandlingId;
		}
		public int getTicketId() {
			return ticketId;
		}
		public void setTicketId(int ticketId) {
			this.ticketId = ticketId;
		}
		public Date getReportingTime() {
			return reportingTime;
		}
		public void setReportingTime(Date reportingTime) {
			this.reportingTime = reportingTime;
		}
		public String getStatusAtArrival() {
			return statusAtArrival;
		}
		public void setStatusAtArrival(String statusAtArrival) {
			this.statusAtArrival = statusAtArrival;
		}
		public String getActualIssue() {
			return actualIssue;
		}
		public void setActualIssue(String actualIssue) {
			this.actualIssue = actualIssue;
		}
		public String getIssueHandlingResult() {
			return issueHandlingResult;
		}
		public void setIssueHandlingResult(String issueHandlingResult) {
			this.issueHandlingResult = issueHandlingResult;
		}
		public String getDowntime() {
			return downtime;
		}
		public void setDowntime(String downtime) {
			this.downtime = downtime;
		}
		public String getDowntimereason() {
			return downtimereason;
		}
		public void setDowntimereason(String downtimereason) {
			this.downtimereason = downtimereason;
		}
		public int getRunningHours() {
			return runningHours;
		}
		public void setRunningHours(int runningHours) {
			this.runningHours = runningHours;
		}
		public String getStatusAtDeparture() {
			return statusAtDeparture;
		}
		public void setStatusAtDeparture(String statusAtDeparture) {
			this.statusAtDeparture = statusAtDeparture;
		}
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		public AccessHandling(int accessHandlingId, int ticketId,
				Date reportingTime, String statusAtArrival, String actualIssue,
				String issueHandlingResult, String downtime,
				String downtimereason, int runningHours,
				String statusAtDeparture, int userId) {
			super();
			this.accessHandlingId = accessHandlingId;
			this.ticketId = ticketId;
			this.reportingTime = reportingTime;
			this.statusAtArrival = statusAtArrival;
			this.actualIssue = actualIssue;
			this.issueHandlingResult = issueHandlingResult;
			this.downtime = downtime;
			this.downtimereason = downtimereason;
			this.runningHours = runningHours;
			this.statusAtDeparture = statusAtDeparture;
			this.userId = userId;
		}
		
		


		public AccessHandling( int ticketId,
				Date reportingTime, String statusAtArrival, String actualIssue,
				String issueHandlingResult, String downtime,
				String downtimereason, int runningHours,
				String statusAtDeparture, int userId, String attachement,
				String status) {
			super();
			this.ticketId = ticketId;
			this.reportingTime = reportingTime;
			this.statusAtArrival = statusAtArrival;
			this.actualIssue = actualIssue;
			this.issueHandlingResult = issueHandlingResult;
			this.downtime = downtime;
			this.downtimereason = downtimereason;
			this.runningHours = runningHours;
			this.statusAtDeparture = statusAtDeparture;
			this.userId = userId;
			this.attachement = attachement;
			this.status = status;
		}

		public AccessHandling(){
	    	
	    }
	    
}
