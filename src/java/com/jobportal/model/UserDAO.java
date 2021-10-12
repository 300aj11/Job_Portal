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
public class UserDAO {

    public boolean insert(UserDTO user) {
        boolean b = false;

        try {
            Connection con = DBConnection.myMethod();
            if (con != null) {
                String sql = "insert into user(first_name,last_name,contact_no,email,password,city,zip,role)values(?,?,?,?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(sql);

                ps.setString(1, user.getFristname());
                ps.setString(2, user.getLastname());
                ps.setString(3, user.getContact());
                ps.setString(4, user.getEmail());
                ps.setString(5, user.getPassword());
                ps.setString(6, user.getCity());
                ps.setString(7, user.getZip());
                ps.setString(8, user.getRole());

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

    public boolean select(UserDTO user) {
        boolean b = false;
        try {
            Connection con = DBConnection.myMethod();
            String sql = "select * from user where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                b = true;
                user.setRs(rs);
            } else {
                System.out.print("Your connection not estabilshed......");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }
    
    public ResultSet selectProfileData(int id) {
        try {
            Connection con = DBConnection.myMethod();

            String sql = "SELECT first_name, last_name, contact_no, email, zip, city, state, street, country, role FROM user WHERE id=?";
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
    
    public ResultSet selectName(int id) {
        try {
            Connection con = DBConnection.myMethod();

            String sql = "SELECT first_name, last_name FROM user WHERE id=?";
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
    
    public String selectRole(int id) {
        try {
            Connection con = DBConnection.myMethod();

            String sql = "SELECT role FROM user WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
 
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getString("role");
            } else {
                System.out.print("Your connection not estabilshed......");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int selectId(UserDTO user) {
        try {
            Connection con = DBConnection.myMethod();

            String sql = "select id from user where email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getEmail());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("id");
            } else {
                System.out.print("Your connection not estabilshed......");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
   public boolean isPasswordCorrect(String pass, int id) {
        try {
            Connection con = DBConnection.myMethod();

            String sql = "select password from user where id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                if(rs.getString("password").trim()==pass.trim()){
                    
                    return true;
                }
                
            } else {
                System.out.print("Your connection not estabilshed......");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
   
   public boolean isEmailAlreadyExist(String email) {
        try {
            Connection con = DBConnection.myMethod();

            String sql = "select id from user where email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

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

    public boolean update(UserDTO edit) throws SQLException {
        boolean b = false;

        try {
            Connection con = DBConnection.myMethod();
            if (con != null) {
                String sql = "UPDATE `user` SET `first_name` = ?, `last_name` =?,`contact_no` = ?, `email` =?, `city` =?, `zip` =?, `street` =?, `state` =?, `country` =? WHERE `id` =?";
                PreparedStatement ps = con.prepareStatement(sql);

                ps.setString(1, edit.getFristname());
                ps.setString(2, edit.getLastname());
                ps.setString(3, edit.getContact());
                ps.setString(4, edit.getEmail());
                ps.setString(5, edit.getCity());
                ps.setString(6, edit.getZip());
                ps.setString(7, edit.getStreet());
                ps.setString(8, edit.getState());
                ps.setString(9, edit.getCountry());
                ps.setInt(10, edit.getId());

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
    
    public boolean updatePassword(UserDTO edit, String newPass) throws SQLException {
        boolean b = false;

        try {
            Connection con = DBConnection.myMethod();
            if (con != null) {
                String sql = "UPDATE user SET password=? WHERE id=?";
                PreparedStatement ps = con.prepareStatement(sql);

                ps.setString(1, newPass);
                ps.setInt(2, edit.getId());

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
