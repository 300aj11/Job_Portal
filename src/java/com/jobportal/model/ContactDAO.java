/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jobportal.model;

import com.jobportal.services.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Win-10
 */
public class ContactDAO {

    public boolean insert(ContactDTO contact) {
        boolean b = false;

        try {
            Connection con = DBConnection.myMethod();
            if (con != null) {
                String sql = "insert into contact(name,email,subject,message)values(?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(sql);

                ps.setString(1, contact.getName());
                ps.setString(2, contact.getEmail());
                ps.setString(3, contact.getSubject());
                ps.setString(4, contact.getMessage());

                int i = ps.executeUpdate();
                if (i > 0) {
                    b = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }
}
