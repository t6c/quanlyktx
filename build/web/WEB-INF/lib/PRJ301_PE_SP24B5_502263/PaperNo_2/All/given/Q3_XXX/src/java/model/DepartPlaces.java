/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class DepartPlaces {
    private int DepartPlaceID;
    private String DepartPlaceName;

    public DepartPlaces() {
    }

    public DepartPlaces(int DepartPlaceID, String DepartPlaceName) {
        this.DepartPlaceID = DepartPlaceID;
        this.DepartPlaceName = DepartPlaceName;
    }

    public int getDepartPlaceID() {
        return DepartPlaceID;
    }

    public void setDepartPlaceID(int DepartPlaceID) {
        this.DepartPlaceID = DepartPlaceID;
    }

    public String getDepartPlaceName() {
        return DepartPlaceName;
    }

    public void setDepartPlaceName(String DepartPlaceName) {
        this.DepartPlaceName = DepartPlaceName;
    }
    
    
}
