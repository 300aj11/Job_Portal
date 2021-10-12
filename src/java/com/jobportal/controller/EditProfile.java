/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jobportal.controller;

import com.jobportal.model.ProviderDTO;
import com.jobportal.model.SeekerDTO;
import com.jobportal.model.UserDAO;
import com.jobportal.model.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Win-10
 */
public class EditProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            UserDTO userData = new UserDTO();
            userData.setId(Integer.parseInt(request.getParameter("id")));
            userData.setFristname(request.getParameter("first_name"));
            userData.setLastname(request.getParameter("last_name"));
            userData.setContact(request.getParameter("contact_number"));
            userData.setEmail(request.getParameter("email"));
            userData.setState(request.getParameter("state"));
            userData.setStreet(request.getParameter("street"));
            userData.setCity(request.getParameter("city"));
            userData.setZip(request.getParameter("zip"));
            userData.setCountry(request.getParameter("country"));
            UserDAO userhandler = new UserDAO();
            
            if(request.getParameter("role")=="seeker"){
                SeekerDTO seekerData = new SeekerDTO();
                seekerData.setId(Integer.parseInt(request.getParameter("id")));
                seekerData.setAadhar_num(request.getParameter("aadhar_num"));
                seekerData.setHigher_que(request.getParameter("higher_que")); 
                seekerData.setSkill(request.getParameter("skill"));
            }
            else{
                ProviderDTO providerData = new ProviderDTO();
                providerData.setId(Integer.parseInt(request.getParameter("id")));
                providerData.setAadhar_num(request.getParameter("aadhar_num"));
                providerData.setProvider_type(request.getParameter("provider_type"));
                providerData.setAbout(request.getParameter("about"));
            }
            boolean b = userhandler.update(userData);
            if(b){
                response.sendRedirect("edit_profile.jsp?msg=Your Details Has been Updated Successfully.&type=success");
            }else{
                response.sendRedirect("edit_profile.jsp?msg=Sorry, Something Went Wrong While Updating Your Data. Please Try Again.&type=danger");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
