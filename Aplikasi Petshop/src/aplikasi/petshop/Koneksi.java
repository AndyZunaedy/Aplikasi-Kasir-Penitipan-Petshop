package aplikasi.petshop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

    
/**
 *
 * @author SIMON
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

    
/**
 *
 * @author SIMON
 */
public class Koneksi {
    
    public Connection dbKoneksi;
    public Statement Statem;
    public PreparedStatement pst ; 
    private String url = "com.mysql.jdbc.Driver";
    private String database = "jdbc:mysql://localhost:3306/petshop";
    private String username = "root";
    private String password = "";
 
    public Koneksi() {
        this.dbKoneksi = null;
    }
 public static Connection getConnection(){
     try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection koneksi = DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop","root","");
            return koneksi;
            
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, e);
            return null;
        }
 }
    public boolean BukaKoneksi() {
        try {
            Class.forName(url);
            dbKoneksi = DriverManager.getConnection(database, username, password);
            return true;
        } catch (Exception E) {
            E.printStackTrace();
            return false;
        }
 
    }
 
    public boolean TutupKoneksi() {
        try {
            if (Statem != null) {
                Statem.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (dbKoneksi != null) {
                dbKoneksi.close();
            }
            return true;
        } catch (Exception E) {
            throw new RuntimeException(E.getMessage());
 
        }
 
    }
}


//public class Koneksi {
//    static Connection con;
//    public static Connection getConnection() throws SQLException{
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/petshop","root",""); 
//        } catch (Exception ex) {
//            System.out.println(""+ex);
//    }
//        return con;
//    }
//
//    static ResultSet getConnection(String sql) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//}