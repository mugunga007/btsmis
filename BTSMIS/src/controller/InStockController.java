package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.InStockModel;
import model.ItemModel;

import service.InStock;

/**
 * Servlet implementation class InStockController
 */
public class InStockController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InStockController() {
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
		
		ItemModel itm = new ItemModel();
		
		int itemid =Integer.parseInt(request.getParameter("itemid"));
		String supplier = request.getParameter("supplier");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		String brand = request.getParameter("brand");
		String type = request.getParameter("type");
		int category = Integer.parseInt(request.getParameter("itemcategory"));
		int system = Integer.parseInt(request.getParameter("system"));
		double ucost = Double.parseDouble(request.getParameter("ucost"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		String status = request.getParameter("note");
		//String ds = request.getParameter("date");
		
		int newquantity = quantity + itm.getItemQuantity(itemid);
		
		Date date = new Date();
		
		InStock i = new InStock(itemid, newquantity, supplier, category, system, ucost, type, brand, userId, date, status);
		
		InStockModel im = new InStockModel();
		
		if(im.registerInStock(i)){
			request.setAttribute("success", "Changes made successfully!");
			itm.updateItemQuantity(itemid, newquantity);
		}else
			request.setAttribute("failed", "!");
		request.getRequestDispatcher("InStock.jsp").forward(request, response);
		
			
		
	}

}
