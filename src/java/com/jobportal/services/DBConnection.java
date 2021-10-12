/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jobportal.services;

/**
 *
 * @author Win-10
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection myMethod() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
