package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ItemController;

import model.ItemControllerModel;
import model.RequestModel;

/**
 * Servlet implementation class ConfirmServlet
 */
public class ConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ItemControllerModel icm = new ItemControllerModel();
		ItemController itc= new ItemController();
		RequestModel rm = new RequestModel();
		
		int requestId = Integer.parseInt(request.getParameter("requestId"));
		int requa = Integer.parseInt(request.getParameter("dequan"));
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		int itemcontquantity = 0;
		
		
		// pr.println("deny");
		
		// pr.println(requestId+"");
		
		//Date actionDate = new Date();
		
	
		
		
		 
		if(rm.updateRequestConfirmed(requestId)){

			if(icm.itemControllerExists(itemId, userId)){
				itc = icm.getItemController(itemId, userId);
				itemcontquantity = itc.getQuantity() + requa;
				icm.updateItemControllerQuantity(itc.getItemControllerId(), itemcontquantity);			
			}else{
		ItemController i = new ItemController(itemId,requa,userId,"confirmed");		
				icm.createItemController(i);
			}
			response.sendRedirect("DeliveredToUser.jsp");
		}
		else
			
			response.sendRedirect("DeliveredToUser.jsp"); 

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
