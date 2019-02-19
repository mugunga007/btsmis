package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserModel;

import service.User;

/**
 * Servlet implementation class UserController
 */
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
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
		
	
		UserModel um = new UserModel();
		
		int id = Integer.parseInt(request.getParameter("id"));
		String fname = request.getParameter("firstname");
		String lname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String status = request.getParameter("status");
		String description = request.getParameter("description");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		int region = Integer.parseInt(request.getParameter("region"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		
		Date date = null;
		  String datest = request.getParameter("date");
			try{
				date = new SimpleDateFormat("yyyy-MM-dd").parse(datest);
				
			}catch(Exception e){
				e.printStackTrace();
			}
	     
	     int level = Integer.parseInt(request.getParameter("level"));
		
	     /*
	     PrintWriter p = response.getWriter();
		p.println(id);
		p.println(fname);
		p.println(lname);
		p.println(email);
		p.println(tel);
		p.println(status);
		p.println(description);
		p.println(username);
		p.println(password);
		p.println(role);
		p.println(region);
		p.println(userId);
		p.println(date);
		p.println(level);
		
		*/
		
		
		User u = new User(id, fname, lname, email, tel, status, description, username, password, role, region, userId, date, level);
		
		try{
		if(um.registerUser(u)){
			
			request.setAttribute("success", "Profile Edited!");
			request.getRequestDispatcher("UserHome.jsp").forward(request, response);
		}else
			request.setAttribute("failed", "Failed");
		
		request.getRequestDispatcher("UserProfile.jsp").forward(request, response);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}















