package service;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class AddFuel {
    @Id @GeneratedValue
    private int addFuelId;
    private String genSetId;
    private int quantity;
    private Date addFuelDate;
    

    public Date getAddFuelDate() {
        return addFuelDate;
    }

    public void setAddFuelDate(Date addFuelDate) {
        this.addFuelDate = addFuelDate;
    }
    
    
          

    public int getAddFuelId() {
        return addFuelId;
    }

    public void setAddFuelId(int addFuelId) {
        this.addFuelId = addFuelId;
    }

    public String getGenSetId() {
        return genSetId;
    }

    public void setGenSetId(String genSetId) {
        this.genSetId = genSetId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public AddFuel(String genSetId, int quantity, Date addFuelDate) {
        super();      
        this.genSetId = genSetId;
        this.quantity = quantity;
        this.addFuelDate = addFuelDate;
    }

    
   

    public AddFuel() {
    }
    

}
