/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jobportal.model;

import com.jobportal.services.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Win-10
 */
public class ProviderDAO {

    public boolean insert(ProviderDTO provider) {
        boolean b = false;

        try {
            Connection con = DBConnection.myMethod();
            if (con != null) {
                String sql = "insert into providerdetail (id,provider_type,aadhar_num,about)values(?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(sql);

                ps.setInt(1, provider.getId());
                ps.setString(2, provider.getProvider_type());
                ps.setString(3, provider.getAadhar_num());
                ps.setString(4, provider.getAbout());

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
    
    public ResultSet select(int id) {
        try {
            Connection con = DBConnection.myMethod();

            String sql = "SELECT * FROM providerdetail WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            return rs;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
      public boolean update(ProviderDTO edit) throws SQLException {
        boolean b = false;

        try {
            Connection con = DBConnection.myMethod();
            if (con != null) {
                String sql = "UPDATE providerdetail SET aadhar_num,provider_type,about WHERE id=?";
                PreparedStatement ps = con.prepareStatement(sql);

                ps.setString(1,edit.getAadhar_num());
                ps.setString(2,edit.getProvider_type());
                ps.setString(3,edit.getAbout());
               
                int i = ps.executeUpdate();

                if (i > 0) {
                    b = true;
                }
            } else {
                System.out.println("Connection not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }
}
