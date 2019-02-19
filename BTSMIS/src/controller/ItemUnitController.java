package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ItemCategoryModel;
import model.ItemUnitModel;
import service.ItemCategory;
import service.ItemUnit;

/**
 * Servlet implementation class ItemUnitController
 */
public class ItemUnitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemUnitController() {
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
		ItemUnitModel icm = new ItemUnitModel();
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String userId = request.getParameter("userId");
		Date date = new Date();
		String type = "";
		
		ItemUnit ic = new ItemUnit(name, description, type, date, userId);
		
		try{
			if(icm.registerItemUnit(ic))
				request.setAttribute("success", "The Item Class is Added successfully!");
			else
				request.setAttribute("failed", "An Error Occured");
			request.getRequestDispatcher("AddItemUnit.jsp").forward(request, response);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
