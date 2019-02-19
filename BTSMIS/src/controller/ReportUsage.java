package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ItemControllerModel;
import model.ItemUsageModel;

import service.ItemUsage;

/**
 * Servlet implementation class ReportUsage
 */
public class ReportUsage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportUsage() {
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
		
		ItemControllerModel ic = new ItemControllerModel();
		
		PrintWriter pr = response.getWriter();
		
		String lat = request.getParameter("lat");
		String lon = request.getParameter("lon");
		
		pr.println(lat);
		pr.println(lon);
		/*
		ItemUsageModel im = new ItemUsageModel();
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		int userId = Integer.parseInt((request.getParameter("userId")));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String description =  "description";
		int itemControllerId = Integer.parseInt(request.getParameter("itemC"));
		
		String btsId = request.getParameter("btsId");
		String note = request.getParameter("note");
		double runHour = Double.parseDouble(request.getParameter("runHour"));
		String attachment = "No";
		String status="reported";
		Date now = new Date();
		
		
		int maxquantity = ic.getItemController(itemControllerId).getQuantity();
		
		ItemUsage iu = new ItemUsage(userId, itemId, quantity, description, now, status, btsId, runHour, note, attachment);
		int usageId=0;
		
	pr.println(userId);
		pr.println(maxquantity);
	
	
		
		if(quantity > maxquantity){
			request.setAttribute("notavailable", "Quantity not available in your stock");
			request.getRequestDispatcher("ReportUsage.jsp?itemId="+itemId+"&itemC="+itemControllerId).forward(request, response);
		}else {
			if(!im.createItemUsage(iu)){
				request.getRequestDispatcher("ReportUsage.jsp?itemId="+itemId+"&itemC="+itemControllerId).forward(request, response);

			}
			else
				ic.updateItemControllerQuantity(itemControllerId, maxquantity-quantity);
			request.getSession().setAttribute("usageId", iu.getUsageId());
			response.sendRedirect("UploadAttachment.jsp");	
					}
		
		*/
		
		
	}

}
