package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PartnerModel;
import model.SitesClassModel;
import model.UserModel;
import service.Partner;
import service.SitesClass;
import service.User;

/**
 * Servlet implementation class PartnerController
 */
public class PartnerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartnerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PartnerModel icm = new PartnerModel();
		UserModel um = new UserModel();
		Partner ic = new Partner();
		
		String delid = request.getParameter("delid");
		
		if(delid!=null){
			int delidint = Integer.parseInt(delid);
			ic = icm.getPatner(delidint);
			icm.deletePatner(ic);
		}
		
		String partnerName = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		int userId = Integer.parseInt(request.getParameter("userId"));
		Date date = new Date();
		User u= new User();
		
		// Edit Control
		int id = Integer.parseInt(request.getParameter("id"));
		if(id==0)
		 u = new User("", "", email, phone, "No", "", email, "No", "Partner", 0, userId, date, 10);
		else
			u = new User(id,"", "", email, phone, "No", "", email, "No", "Partner", 0, userId, date, 10);
		
		// Edit Control
		try{
			if(um.registerUser(u)){
			ic = new Partner(u.getId(),partnerName, email, phone, userId); 
			icm.registerPatner(ic);
				request.setAttribute("success", "Changes made successfully!");
			}
			else
				request.setAttribute("failed", "An Error Occured");
			request.getRequestDispatcher("AddPatner.jsp").forward(request, response);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
			

	}

}
