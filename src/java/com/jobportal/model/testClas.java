/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jobportal.model;

import com.sun.org.apache.xerces.internal.xs.PSVIProvider;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Win-10
 */
public class testClas {
    public static void main(String[] args) throws SQLException {
         ApplyDAO applyHandle = new ApplyDAO();
         ResultSet applicants = applyHandle.selectByJobId(1);
         while(applicants.next()){
             System.out.print(applicants.getString("msg"));
         }
    }
          
}
