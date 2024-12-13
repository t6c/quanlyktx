package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.thread;

public class threaDAO  extends DBContext{
    PreparedStatement stm;
    public List<thread> getAll() {      
        ResultSet rs;
        List<thread> list = new ArrayList<>();
        try {
            String strSelect = "select * from tbthread";
            stm = connection.prepareStatement(strSelect);
            rs = stm.executeQuery();
            while (rs.next()) {
                thread t = new thread(rs.getInt("tid"), rs.getString("tcontent"));
                list.add(t);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args){
        threaDAO o = new threaDAO();
        List<thread> list = o.getAll();
        System.out.println(list.get(0).getTcontent());
    }
}
