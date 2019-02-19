package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FieldEngineerModel;
import model.UserModel;
import service.FieldEngineer;
import service.User;

/**
 * Servlet implementation class RegionManagerController
 */
public class RegionManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegionManagerController() {
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
        UserModel fm=new UserModel();
      String fname=request.getParameter("fname");
      String lname=request.getParameter("lname");
      String tel=request.getParameter("tel");
      String email=request.getParameter("email");
      int region=Integer.parseInt(request.getParameter("regionId")); 
    int userId = Integer.parseInt(request.getParameter("userId"));
    Date date = new Date();
    String description = "No";
    String status = "No";
    String role = "Region Manager";
    int level = 2;
    
    
    User fe=new User();
    int id = Integer.parseInt(request.getParameter("id"));
	String type = "";
	if(id==0)
		fe=new User(fname, lname, email, tel, status, description, email, "", role, region, userId, date,level);

	else
		 fe=new User(id,fname, lname, email, tel, status, description, email, "", role, region, userId, date,level);


    
    
    try{
			if(fm.registerUser(fe))
				request.setAttribute("success", "Region Manager Added successfully!");
			else
				request.setAttribute("failed", "!");
			request.getRequestDispatcher("AddRegionManager.jsp").forward(request, response);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}

	}

}
