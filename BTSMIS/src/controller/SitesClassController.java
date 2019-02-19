package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ItemCategoryModel;
import model.SitesClassModel;
import service.ItemCategory;
import service.SitesClass;
import service.User;

/**
 * Servlet implementation class SitesClassController
 */
public class SitesClassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SitesClassController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		SitesClassModel icm = new SitesClassModel();
		SitesClass ic = new SitesClass();
		
		String delid = request.getParameter("delid");


		
		if(delid!=null){
			int delidint = Integer.parseInt(delid);
			ic = icm.getSitesClass(delidint);
			icm.deleteSitesClass(ic);
			request.getRequestDispatcher("AddSitesClass.jsp").forward(request, response);
		}
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		SitesClassModel icm = new SitesClassModel();
		SitesClass ic = new SitesClass();
		
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String userId = request.getParameter("userId");
		Date date = new Date();
		String type = "";
		
		 int id = Integer.parseInt(request.getParameter("id"));
		
			if(id==0)
				 ic = new SitesClass(name, description, type, date, userId);
			else
				 ic = new SitesClass(id,name, description, type, date, userId);
		
		
		try{
			if(icm.registerSitesClass(ic))
				request.setAttribute("success", "Changes made successfully!");
			else
				request.setAttribute("failed", "An Error Occured");
			request.getRequestDispatcher("AddSitesClass.jsp").forward(request, response);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}


		
	}

