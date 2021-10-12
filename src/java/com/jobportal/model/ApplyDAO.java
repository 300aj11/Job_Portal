package com.jobportal.model;

import com.jobportal.services.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ApplyDAO {

    public boolean insert(ApplyDTO apply) {
        boolean b = false;

        try {
            Connection con = DBConnection.myMethod();
            if (con != null) {
                String sql = "insert into apply (job_id, candidate_id, msg) values (?,?,?)";
                PreparedStatement ps = con.prepareStatement(sql);

                ps.setInt(1, apply.getJob_id());
                ps.setInt(2, apply.getCandidate_id());
                ps.setString(3, apply.getMsg());

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
    
    public ResultSet selectByJobId(int id) {

        try {
            Connection con = DBConnection.myMethod();

            String sql = "select * from apply where job_id = ?";
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
    
    public boolean isAlreadyApplied(int candidate_id, int job_id) {
        try {
            Connection con = DBConnection.myMethod();

            String sql = "select id from apply where candidate_id =? and job_id =?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, candidate_id);            
            ps.setInt(2, job_id);


            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                    return true;
            } else {
                System.out.print("Your connection not estabilshed......");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}    

