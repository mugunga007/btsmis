/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BscModel;
import service.Bsc;

/**
 *
 * @author Bruno
 */
public class AddBSCController extends HttpServlet {

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

        
        BscModel icm=new BscModel();
        Bsc ic = new Bsc();
        String delid = request.getParameter("delid");


    	
		if(delid!=null){
			ic = icm.getBsc(delid);
			icm.deleteBsc(ic);
			request.getRequestDispatcher("AddBSC.jsp").forward(request, response);
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
        BscModel bs=new BscModel();
        String bcsId = request.getParameter("bscId");
        String bcsName = request.getParameter("bscName");
        int regionId = Integer.parseInt(request.getParameter("regionId"));
        int engineerId = Integer.parseInt(request.getParameter("engineerId"));
        String Longitude = request.getParameter("longitude");
        String latitude = request.getParameter("latitude");
        Bsc bc=new Bsc(bcsId, bcsName, latitude, Longitude, engineerId, regionId);
         try{
			if(bs.registerBsc(bc))
				request.setAttribute("success", "The BSC is Added successfully!");
			else
				request.setAttribute("failed", "!");
			request.getRequestDispatcher("AddBSC.jsp").forward(request, response);
			
			
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
