package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.User;

import model.UserModel;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
		User user = new User();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		user = um.userLogin(username, password);
		if(user==null){
			request.setAttribute("wrong", "incorrect");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
		else{
			request.getSession().setAttribute("user", user);
			if(!user.getRole().equals("Store Keeper"))
		response.sendRedirect("UserHome.jsp");
			else
				response.sendRedirect("StockHome.jsp");
		}
		
		
		
	}

}

