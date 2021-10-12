package com.jobportal.model;

import com.jobportal.services.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CategoriesDAO {

    public boolean insert(CategoriesDTO cat) {
        boolean b = false;
        try {
            Connection con = DBConnection.myMethod();
            if (con != null) {
                String sql = "insert into jobcategory(id,name)values(?,?))";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, cat.getId());
                ps.setString(2, cat.getName());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    public ResultSet select() {
        try {
            Connection con = DBConnection.myMethod();
            String sql = "select * from jobcategory ";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs;
            } else {
                System.out.print("Your connection not estabilshed......");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public String selectName(int id) {
        try {
            Connection con = DBConnection.myMethod();
            String sql = "select name from jobcategory where id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("name");
            } else {
                System.out.print("Your connection not estabilshed......");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
