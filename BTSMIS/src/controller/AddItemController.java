package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Item;

import model.ItemModel;

/**
 * Servlet implementation class AddItemController
 */
public class AddItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddItemController() {
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
	ItemModel im = new ItemModel();
	
		String name = request.getParameter("name");
		String units = request.getParameter("units");
		Item i = new Item(name,units,0);
		
		try{
			if(im.registerItem(i))
				request.setAttribute("success", "The Item is Added successfully!");
			else
				request.setAttribute("failed", "!");
			request.getRequestDispatcher("AddItem.jsp").forward(request, response);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
