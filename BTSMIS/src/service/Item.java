package service;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Item implements Serializable {
    @Id @GeneratedValue
    private int itemId;
    
    private String itemName;
    
   
    private String units;
    
    private int quantity;
    
    
    public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getUnits() {
		return units;
	}

	public void setUnits(String units) {
		this.units = units;
	}

	public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public Item(int itemId, String itemName) {
        this.itemId = itemId;
        this.itemName = itemName;
    }

  
    public Item(){
        
    }

	public Item(String itemName, String units, int quantity) {
		super();
		this.itemName = itemName;
		this.units = units;
		this.quantity = quantity;
	}

    

    
    
    

}
