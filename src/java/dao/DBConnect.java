/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnect {
    public Connection con=null;
    public DBConnect(String url,String userName,String password){
        try {
            //drive
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //connection
            con=DriverManager.getConnection(url,userName, password);
            System.out.println("connected");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }        
    }
    
    public DBConnect(){
        this("jdbc:sqlserver://localhost:1433;databaseName=QLKTX","sa","123");
    }
    public ResultSet getData(String sql){
        ResultSet rs =null;
        Statement state;
        try {
            state = con.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            rs = state.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public static void main(String[] args){
        new DBConnect();
    }


}
