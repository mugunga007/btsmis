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
import model.BtsModel;
import service.Bts;

/**
 *
 * @author Bruno
 */
public class AddBtsController extends HttpServlet {

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
        
        BtsModel icm=new BtsModel();
        Bts ic=new Bts();
        String delid = request.getParameter("delid");


    	
		if(delid!=null){
			ic = icm.getBts(delid);
			icm.deleteBts(ic);
			request.getRequestDispatcher("AddBTS.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
           
        BtsModel b=new BtsModel();
        String btsId = request.getParameter("btsId");
        String btsName = request.getParameter("btsName");
        int regionId = Integer.parseInt(request.getParameter("regionId"));
        int engineerId = Integer.parseInt(request.getParameter("engineerId"));   
        int sitesclass = Integer.parseInt(request.getParameter("sitesclass"));
        int sitescategory = Integer.parseInt(request.getParameter("sitecategory"));
        String bscId = request.getParameter("bscId");
        String longitude = request.getParameter("longitude");
        String latitude = request.getParameter("latitude");
        String userId = request.getParameter("userId");
        Date date =new Date();
        String status = "active";
      //  Bts bt=new Bts(btsId, btsName, priority, topology, bscId, regionId, engineerId);
        //Bts bt=new Bts(btsId, btsName, priority, topology, bscId, regionId, engineerId,latitude,Longitude);
        Bts bt=new Bts(btsId, btsName, sitesclass, sitescategory, bscId, latitude, longitude, regionId, engineerId, userId, date, status);
         try{
			if(b.registerBts(bt))
				request.setAttribute("success", "Changes added successfully!");
			else
				request.setAttribute("failed", "!");
			request.getRequestDispatcher("AddBTS.jsp").forward(request, response);
			
			
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
