/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author Bruno
 */
@Entity
public class Bsc {
    @Id
    private String bscId;
    private String bscName;
    private String latitude;
    private String longitude;
    private int engineerId;
    private int regionId;

    public String getBscId() {
        return bscId;
    }

    public void setBscId(String bscId) {
        this.bscId = bscId;
    }

    public String getBscName() {
        return bscName;
    }

    public void setBscName(String bscName) {
        this.bscName = bscName;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public int getEngineerId() {
        return engineerId;
    }

    public void setEngineerId(int engineerId) {
        this.engineerId = engineerId;
    }

    public int getRegionId() {
        return regionId;
    }

    public void setRegionId(int regionId) {
        this.regionId = regionId;
    }

    public Bsc(String bscId, String bscName, String latitude, String longitude, int engineerId, int regionId) {
        super();
        this.bscId = bscId;
        this.bscName = bscName;
        this.latitude = latitude;
        this.longitude = longitude;
        this.engineerId = engineerId;
        this.regionId = regionId;
    }

    
    public Bsc() {
    }
  
    
    
}
