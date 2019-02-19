package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ItemCategoryModel;
import model.SitesCategoryModel;
import service.ItemCategory;
import service.SitesCategory;

/**
 * Servlet implementation class SitesCategoryController
 */
public class SitesCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SitesCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		SitesCategory ic = new SitesCategory();
		SitesCategoryModel icm = new SitesCategoryModel();
		String delid = request.getParameter("delid");


		
		if(delid!=null){
			int delidint = Integer.parseInt(delid);
			ic = icm.getSitesCategory(delidint);
			icm.deleteSitesCategory(ic);
			request.getRequestDispatcher("SitesCategory.jsp").forward(request, response);
		}
		

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SitesCategory ic = new SitesCategory();
		SitesCategoryModel icm = new SitesCategoryModel();
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String userId = request.getParameter("userId");
		Date date = new Date();
		
		
		
		int id = Integer.parseInt(request.getParameter("id"));
		String type = "";
		if(id==0)
		 ic = new SitesCategory(name, description, type, date, userId);
		else
			ic = new SitesCategory(id,name, description, type, date, userId);
		try{
			if(icm.registerSitesCategory(ic))
				request.setAttribute("success", "Changes made successfully!");
			else
				request.setAttribute("failed", "An Error Occured");
			request.getRequestDispatcher("SitesCategory.jsp").forward(request, response);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
		

}
