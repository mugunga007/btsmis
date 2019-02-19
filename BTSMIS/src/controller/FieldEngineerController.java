/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FieldEngineerModel;
import model.UserModel;
import service.FieldEngineer;
import service.SitesCategory;
import service.User;

/**
 *
 * @author Bruno
 */
public class FieldEngineerController extends HttpServlet {

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
           
        //processRequest(request, response);
        //  FieldEngineerModel fm=new FieldEngineerModel();
    	  UserModel fm=new UserModel();
    	  User fe = new User();
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String tel=request.getParameter("tel");
        String email=request.getParameter("email");
        int region=Integer.parseInt(request.getParameter("regionId")); 
      int userId = Integer.parseInt(request.getParameter("userId"));
      Date date = new Date();
      String description = "No";
      String status = "No";
      String role = "Field Engineer";
      int level = 3;
      
      int id = Integer.parseInt(request.getParameter("id"));
		String type = "";
		if(id==0)
			 fe=new User(fname, lname, email, tel, status, description, email, "", role, region, userId, date,level);

		else
			 fe=new User(id,fname, lname, email, tel, status, description, email, "", role, region, userId, date,level);


      
      
     try{
			if(fm.registerUser(fe))
				request.setAttribute("success", "Change Made Successfully!");
			else
				request.setAttribute("failed", "!");
			request.getRequestDispatcher("AddFieldEngineer.jsp").forward(request, response);
			
			
		}catch(Exception e){
			e.printStackTrace();
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
