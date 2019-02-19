package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ItemModel;
import model.RequestModel;

import service.Item;
import service.Request;

/**
 * Servlet implementation class DeliverController
 */
public class DeliverController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeliverController() {
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
		
		PrintWriter pr = response.getWriter();
		
		
		Item i = new Item();
		ItemModel im = new ItemModel();
		Request r = new Request();
		RequestModel rm = new RequestModel();
		
		
		int deliveredQuantity = Integer.parseInt(request.getParameter("deliveredQuantity"));
		int requestId = Integer.parseInt(request.getParameter("requestId"));
		Date actionDate = new Date();
		r = rm.getRequest(requestId);
		i = im.getItem(r.getItemId());
		int itemId = i.getItemId();
		int rep = 0;
		String m = "";
		int availableQuantity = im.getItemQuantity(itemId);
	
		pr.println(""+deliveredQuantity);
		
		
		
		
		if(availableQuantity<deliveredQuantity)
		rep = 1;
		else if(r.getQuantity()< deliveredQuantity)
			rep = 2;
		else if(rm.updateRequestDelivery(requestId, deliveredQuantity, actionDate)){
			rep = 3;
		im.updateItemQuantity(itemId, (availableQuantity-deliveredQuantity));
		}
		else 
			rep = 4;
		
		if(rep==3)
			response.sendRedirect("DetailedRequestList.jsp?itemId="+itemId);
		else
		response.sendRedirect("DeliverForm.jsp?rep="+rep+"&requestId="+requestId+"&q="+deliveredQuantity);
		
		

		
		
		/*
		//m = "Quantity not Available in your stock!";
		//request.setAttribute("msg", m);
		//response.sendRedirect("DeliverForm.jsp?rep="+rep);
		}
		else if(r.getQuantity()>r.getDeliveredQuantity()){
			rep = 2;
		//m = "Delivery Quantity Should not exceed requested Quantity.";	
		//request.setAttribute("msg", m);
		//response.sendRedirect("DeliverForm.jsp?rep="+rep);
		}
		else if(rm.updateRequestDelivery(requestId, deliveredQuantity, actionDate)){
			rep = 3;
		//m = "Successfully Delivered!";	
		//request.setAttribute("msg", m);
		//response.sendRedirect("DetailedRequestList.jsp?itemId="+i.getItemId());
		//request.getRequestDispatcher("DetailedRequestList.jsp?itemId="+i.getItemId()).forward(request, response);
		}
		else {
			rep = 4;
		
		
}
		response.sendRedirect("DeliverForm.jsp?rep="+rep);
	
		*/
	}
	

}
