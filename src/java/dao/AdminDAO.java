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
import java.util.List;
import model.Admin;


public class AdminDAO extends DBConnect {

    public ArrayList<Admin> getListTaiKhoanAdmin() {
        ArrayList<Admin> list = new ArrayList<>();
        String query = "select * from admin";
        try {

            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                list.add(new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8)));
            }

        } catch (Exception e) {
        }
        return list;
    }

    public Admin getListTaiKhoanAdminById(Admin t) {
        Admin ketQua = null;
        try {
            final String sql = "SELECT * FROM admin WHERE adminId=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, t.getAdminId());
            System.out.println(sql);
            final ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ketQua = new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            }

        } catch (Exception e) {
        }
        return ketQua;
    }

    public Admin getListTaiKhoanAdminByIdString(String t) {
        Admin ketQua = null;
        try {
             String sql = "SELECT * FROM admin WHERE adminId=?";
             PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t);
            System.out.println(sql);
             ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ketQua = new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            }

        } catch (Exception e) {
        }
        return ketQua;
    }

    public int delete(String t) {
        int ketQua = 0;
        try {
             String sql = "DELETE from admin  WHERE adminId=?";
             PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t);
            System.out.println(sql);
            ketQua = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

 
    public int insert(Admin t) {
        int ketQua = 0;
        try {
            String sql = "INSERT INTO admin (adminId, username, password, name, email, role, phone, avatar) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, t.getAdminId());
            st.setString(2, t.getUsername());
            st.setString(3, t.getPassword());
            st.setString(4, t.getName());
            st.setString(5, t.getEmail());
            st.setString(6, t.getRole());
            st.setString(7, t.getPhone());
            st.setString(8, t.getAvatar());
            ketQua = st.executeUpdate();
            System.out.println("You have executed: " + sql);
            System.out.println(ketQua + " row(s) affected!");

            con.close(); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }


    public int update(Admin t) {
        int ketQua = 0;
        try {
             String sql = "UPDATE admin  SET  name=?, email=?,role=?,phone=? WHERE adminId=?";
             PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getName());
            st.setString(2, t.getEmail());
            st.setString(3, t.getRole());
            st.setString(4, t.getPhone());
            st.setInt(5, t.getAdminId());
            System.out.println(sql);
            ketQua = st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public Admin selectByUserAndPassword(Admin t) {
        Admin ketQua = null;
        try {
            final String sql = "SELECT * FROM admin WHERE username=? and password=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getUsername());
            st.setString(2, t.getPassword());
            System.out.println(sql);
            final ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ketQua = new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            }

        } catch (Exception e) {
        }
        return ketQua;
    }

    public Admin selectByEmail(Admin t) {
        Admin ketQua = null;
        try {
             String sql = "SELECT * FROM admin WHERE email=?";
             PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getEmail());
            System.out.println(sql);
            final ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ketQua = new Admin(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            }

        } catch (Exception e) {
        }
        return ketQua;
    }

    public boolean kiemTraTenDangNhap(final String username) {
        boolean ketQua = false;
        try {
            final String sql = "SELECT * FROM admin WHERE username=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, username);
            System.out.println(sql);
            final ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ketQua = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

    public int changePassword(Admin t) {
        int ketQua = 0;
        try {
            final String sql = "UPDATE admin  SET  password=? WHERE adminId=?";
            final PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getPassword());
            st.setInt(2, t.getAdminId());
            System.out.println(sql);
            ketQua = st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ketQua;
    }

}
