/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.comment;

/**
 *
 * @author Administrator
 */
public class commentDAO  extends DBContext{
    PreparedStatement stm;
    public List<comment> getbyidthread(int tid) {
        ResultSet rs;
        List<comment> list = new ArrayList<>();
        try {
            String strSelect = "select * from tbcomment where tid = " + tid + "";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                comment c = new comment(rs.getInt("cid"), rs.getString("ctitle"),rs.getInt("tid"), rs.getInt("idAccount"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args){
        commentDAO c = new commentDAO();
        
        List<comment> list = c.getbyidthread(1);
        System.out.println(list.get(0).getCtitle());
    }
    
}
