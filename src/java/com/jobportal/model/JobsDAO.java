package com.jobportal.model;

import com.jobportal.services.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JobsDAO {

    public boolean insert(JobsDTO job) {
        boolean b = false;

        try {
            Connection con = DBConnection.myMethod();
            if (con != null) {
                String sql = "insert into `jobs` (`category_id`, `name`, `wages`, `desc`, `mobile_num`, `address`, `author_id`) values (?,?,?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(sql);

                ps.setInt(1, job.getCategory_id());
                ps.setString(2, job.getName());
                ps.setString(3, job.getWages());
                ps.setString(4, job.getDesc());
                ps.setString(5, job.getMobile_num());
                ps.setString(6, job.getAddress());
                ps.setInt(7, job.getAuthor_id());

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

    public ResultSet selectByCategory(int category) {

        try {
            Connection con = DBConnection.myMethod();
            String sql = "select * from jobs where category_id =? and status = 'open'";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, category);
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

    public ResultSet selectById(int id) {

        try {
            Connection con = DBConnection.myMethod();

            String sql = "select * from jobs where id = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);
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
    
    public ResultSet selectByAuthor(int author_id) {

        try {
            Connection con = DBConnection.myMethod();
            String sql = "select * from jobs where author_id =? and status = 'open'";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, author_id);
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
    
    public ResultSet selectCompleted(int author_id) {
        try {
            Connection con = DBConnection.myMethod();
            String sql = "select * from jobs where author_id =? and status = 'close'";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, author_id);
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
    
    public boolean markClose(int id) throws SQLException {
        boolean b = false;

        try {
            Connection con = DBConnection.myMethod();
            if (con != null) {
                String sql = "UPDATE jobs SET status = 'close' WHERE id=?";
                PreparedStatement ps = con.prepareStatement(sql);

                ps.setInt(1, id);

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
