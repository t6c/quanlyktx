/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Tickets {
    private int TicketID;
    private String TicketName;

    public Tickets() {
    }

    public Tickets(int TicketID, String TicketName) {
        this.TicketID = TicketID;
        this.TicketName = TicketName;
    }

    public int getTicketID() {
        return TicketID;
    }

    public void setTicketID(int TicketID) {
        this.TicketID = TicketID;
    }

    public String getTicketName() {
        return TicketName;
    }

    public void setTicketName(String TicketName) {
        this.TicketName = TicketName;
    }
    
    
}
