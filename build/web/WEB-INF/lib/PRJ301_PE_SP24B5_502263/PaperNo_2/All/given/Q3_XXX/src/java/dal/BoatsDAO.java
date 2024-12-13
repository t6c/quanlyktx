/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Boats;
import java.sql.*;

/**
 *
 * @author ADMIN
 */
public class BoatsDAO extends DBContext {

    public List<Boats> getAllBoats() {
        List<Boats> ls = new ArrayList<>();
        String sql = "SELECT * FROM Boats";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Boats b = new Boats(rs.getString("BoatID"),
                        rs.getString("BoatName"),
                        rs.getInt("Seat"),
                        rs.getInt("Booked"),
                        rs.getInt("DepartPlaceID"),
                        rs.getInt("TicketID"));
                ls.add(b);
            }
        } catch (Exception e) {
        }
        return ls;
    }
    
    public String getDepartNameById(int id){
        String name = "";
        String sql = "SELECT * FROM DepartPlaces WHERE DepartPlaceID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                name = rs.getString("DepartPlaceName");
            }
        } catch (Exception e) {
        }
        return name;
    }
    
    public String getTicketNameById(int id){
        String name = "";
        String sql = "SELECT * FROM Tickets WHERE TicketID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                name = rs.getString("TicketName");
            }
        } catch (Exception e) {
        }
        return name;
    }
}
