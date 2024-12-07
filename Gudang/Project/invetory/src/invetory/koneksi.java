/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package invetory;

/**
 *
 * @author ACER
 */
import java.sql.*;

public class koneksi {
    private static Connection mysqlconfig;
    public static Connection configDB()throws SQLException{
    try{
        String url="jdbc:mysql://localhost/invetory_barang";
        String user="root";
        String pass="";
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        mysqlconfig=DriverManager.getConnection(url,user,pass);
        System.out.println("Koneksi Berhasil!");
    }
    catch(Exception e){
        System.err.println("Koneksi Gagal" +e.getMessage());
    }
    return mysqlconfig;
}
}

