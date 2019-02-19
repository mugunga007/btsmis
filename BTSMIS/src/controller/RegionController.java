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
import model.RegionModel;
import service.Region;
import service.SitesClass;

/**
 *
 * @author Bruno
 */
public class RegionController extends HttpServlet {

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
        
        RegionModel icm=new RegionModel();
        Region ic = new  Region();
        String delid = request.getParameter("delid");


    	
		if(delid!=null){
			int delidint = Integer.parseInt(delid);
			ic = icm.getRegion(delidint);
			icm.deleteRegion(ic);
			request.getRequestDispatcher("RegionForm.jsp").forward(request, response);
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
        RegionModel r=new RegionModel();
        Region rn = new  Region();
      String rname=request.getParameter("rname");
      String userId = request.getParameter("userId");
      Date date= new Date();
      String description = "No";
      
    
		 int id = Integer.parseInt(request.getParameter("id"));
		
			if(id==0)
				 rn=new Region(rname, userId, date, description);
			else
				 rn=new Region(id,rname, userId, date, description);
		
      
      
      
      
      
      
      
       try{
			if(r.register(rn))
				request.setAttribute("success", "The Region is Added successfully!");
			else
				request.setAttribute("failed", "!");
			request.getRequestDispatcher("RegionForm.jsp").forward(request, response);
			
			
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
