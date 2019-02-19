package service;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


@Entity
public class RemainingFuel {

	
	   @Id @GeneratedValue
	    private int consumedId;
	    private String genSetId;
	    private int remainLitters;
	    private int userId;
	    private Date addDate;
	    private int runHours;
		public int getConsumedId() {
			return consumedId;
		}
		public void setConsumedId(int consumedId) {
			this.consumedId = consumedId;
		}
		public String getGenSetId() {
			return genSetId;
		}
		public void setGenSetId(String genSetId) {
			this.genSetId = genSetId;
		}
		public int getRemainLitters() {
			return remainLitters;
		}
		public void setRemainLitters(int remainLitters) {
			this.remainLitters = remainLitters;
		}
		public Date getAddDate() {
			return addDate;
		}
		public void setAddDate(Date addDate) {
			this.addDate = addDate;
		}
		public int getRunHours() {
			return runHours;
		}
		public void setRunHours(int runHours) {
	
			this.runHours = runHours;
		}
		

		
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		public RemainingFuel(String genSetId, int remainLitters, int userId,
				Date addDate, int runHours) {
			super();
			this.genSetId = genSetId;
			this.remainLitters = remainLitters;
			this.userId = userId;
			this.addDate = addDate;
			this.runHours = runHours;
		}
		public RemainingFuel(){
			
		}
	    
	    
	
}
