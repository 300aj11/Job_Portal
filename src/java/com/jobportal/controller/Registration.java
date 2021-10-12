/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jobportal.controller;

import com.jobportal.model.UserDAO;
import com.jobportal.model.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Win-10
 */
public class Registration extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String firstname = request.getParameter("first_name");
            String lastname = request.getParameter("last_name");
            String contactno = request.getParameter("contact_no");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String city = request.getParameter("city");
            String zip = request.getParameter("zip");
            String role = request.getParameter("role");

            UserDTO user = new UserDTO();
            user.setFristname(firstname);
            user.setLastname(lastname);
            user.setContact(contactno);
            user.setEmail(email);
            user.setPassword(password);
            user.setCity(city);
            user.setZip(zip);
            user.setRole(role);

            UserDAO jdto = new UserDAO();
            if(jdto.isEmailAlreadyExist(email)){
                response.sendRedirect("registration.jsp?error=Mail id already exist.");
            } else if(contactno.length()==9){ 
                response.sendRedirect("registration.jsp?error=Invalid Contact Number.");
            }else{
                boolean b = jdto.insert(user);

                if (b) {
                    switch (role) {
                        case "seeker":
                            response.sendRedirect("profile_complete_seeker.jsp?id=" + jdto.selectId(user));
                            break;
                        case "provider":
                            response.sendRedirect("profile_complete_provider.jsp?id=" + jdto.selectId(user));
                            break;
                    }

                } else {
                    response.sendRedirect("registration.jsp?error=Something Went Wrong During Registration, Please Try Again.");
                }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
