/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Payment;
import model.Room;
import model.Users;


public class PaymentDAO extends DBConnect {

    public ArrayList<Payment> getList() {
        ArrayList<Payment> list = new ArrayList<>();
        String query = "select * from Payment";
        try {

            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Users u1 = new Users();
                u1.setUsersId(rs.getInt(2));
                Users u2 = new UserDAO().getListTaiKhoanUsersById(u1);
                Room r1 = new Room();
                r1.setRoomId(rs.getInt(3));
                Room r2 = new RoomDAO().getListRoomById(r1);
                list.add(new Payment(rs.getInt(1), u2, r2, rs.getString(4), rs.getInt(5), rs.getString(6)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Payment> getListByUser(int usersId) {
        ArrayList<Payment> list = new ArrayList<>();

        try {

            String query = "select * from Payment where [userId]=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, usersId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Users u1 = new Users();
                u1.setUsersId(rs.getInt(2));
                Users u2 = new UserDAO().getListTaiKhoanUsersById(u1);
                Room r1 = new Room();
                r1.setRoomId(rs.getInt(3));
                Room r2 = new RoomDAO().getListRoomById(r1);
                list.add(new Payment(rs.getInt(1), u2, r2, rs.getString(4), rs.getInt(5), rs.getString(6)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public Payment getPaymentDetail(int paymentId) {
        Payment list = null;

        try {

            String query = "select * from Payment where paymentId=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, paymentId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Users u1 = new Users();
                u1.setUsersId(rs.getInt(2));
                Users u2 = new UserDAO().getListTaiKhoanUsersById(u1);
                Room r1 = new Room();
                r1.setRoomId(rs.getInt(3));
                Room r2 = new RoomDAO().getListRoomById(r1);
                list = (new Payment(rs.getInt(1), u2, r2, rs.getString(4), rs.getInt(5), rs.getString(6)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public int delete(String t) {
        int ketQua = 0;
        try {
            final String sql = "DELETE from Payment  WHERE paymentId=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t);
            System.out.println(sql);
            ketQua = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public int insert(Payment t) {
        int ketQua = 0;
        try {
            final String sql = "INSERT INTO Payment (paymentId, usersId, roomId, semester, total, statuses)  VALUES (?,?,?,?,?,?)";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, t.getPaymentId());
            st.setInt(2, t.getUserId().getUsersId());
            st.setInt(3, t.getRoomId().getRoomId());

            st.setString(4, t.getSemester());
            st.setInt(5, t.getTotal());
            st.setString(6, t.getStatus());
            ketQua = st.executeUpdate();
            System.out.println("B\u1ea1n \u0111\u00e3 th\u1ef1c thi: " + sql);
            System.out.println("C\u00f3 " + ketQua + " d\u00f2ng b\u1ecb thay \u0111\u1ed5i!");
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public int updatePay(Payment t) {
        int ketQua = 0;
        try {
            String sql = "UPDATE Payment  SET  [status]=? WHERE paymentId=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getStatus());

            st.setInt(2, t.getPaymentId());

            System.out.println(sql);
            ketQua = st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

  
}
