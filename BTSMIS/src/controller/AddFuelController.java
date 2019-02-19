package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AddFuel;
import service.GenFuelTracking;
import service.ItemUsage;

import model.AddFuelModel;
import model.GenFuelTrackingModel;
import model.GenSetModel;
import model.ItemControllerModel;
import model.ItemModel;
import model.ItemUsageModel;
import model.RequestModel;

/**
 * Servlet implementation class AddFuelController
 */
public class AddFuelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFuelController() {
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
		RequestModel rm = new RequestModel();
		int time = 0;
		ItemControllerModel ic = new ItemControllerModel();
		ItemModel itm = new ItemModel();
		int maxquantity = ic.getItemControllerByItemId(itm.getFuelItem().getItemId()).getQuantity();
		GenFuelTracking gf = new GenFuelTracking();
		int itemId = itm.getFuelItem().getItemId();
		
		 AddFuelModel ad=new AddFuelModel();
		 GenSetModel gn = new GenSetModel();
		 
	       String genSetId=request.getParameter("genSetId");
	       int remainingQuantity = Integer.parseInt(request.getParameter("remQuantity"));
	       double runHours = Double.parseDouble(request.getParameter("runHours"));
	       int addedQuantity=Integer.parseInt(request.getParameter("quantity"));
	       
	       int userId= Integer.parseInt(request.getParameter("userId"));
	       String btsId=request.getParameter("bts");
	        double longitude = Double.parseDouble(request.getParameter("longitude"));
	        double latitude = Double.parseDouble(request.getParameter("latitude")); 
	        Date date=new Date();
	        
	   
	      
	        AddFuel af=new AddFuel(genSetId, addedQuantity, date);
	       
	        String description = "Added Fuel";
	        String status = "No";
	       String action = "Check";
	        String note = "No";
	        String attachment = "No";
	        
	        
	        ItemUsage iu = new ItemUsage(userId, itemId, addedQuantity, description, date, status, btsId, 0, note, attachment);
	        
	        ItemUsageModel im = new ItemUsageModel();
	        
	       int currentQuantity = addedQuantity + remainingQuantity;
	       
	       GenFuelTrackingModel gtm= new GenFuelTrackingModel();
	       
	       gf = gtm.getLatestGenFuelTrackingCurrent(userId, genSetId);
	       
	      
	       
	       
	       int usedQuantity = 0;
	       double hours=0;
	       double perHour = 0;
	       if(gf==null){
	       usedQuantity = 0;
	       hours = 0;
	       }
	       else{
	    	   time = rm.daysBetween(gf.getDate(), date);   
	       hours = runHours - gf.getRunHours();
	       usedQuantity = gf.getCurrentQuantity() - remainingQuantity;
	      perHour = usedQuantity/ hours;
	       }
	       
	       
	       
	       
	  //    double latestRunHours = 0;
	      
	      
	     // double hours = 0;
	      
	      /*
	      PrintWriter p = response.getWriter();
	      p.println("Remaining quantity: "+remainingQuantity);
	      p.println("Added Quantity: "+addedQuantity);
	      p.println("Current Quantity: "+currentQuantity);
	      
	      p.println("used Quantity: "+usedQuantity);
	     p.println();
	      */
	      
	      GenFuelTracking gt= new GenFuelTracking(genSetId, userId, remainingQuantity, action, date, runHours, hours, addedQuantity, perHour, currentQuantity, usedQuantity,time, longitude, latitude);
	      
	      
	      
	      // GenFuelTracking gt = new GenFuelTracking(genSetId, userId, quantity, "Added", ds, runHours, hours, genCurrentQuantity, 0);
	       
	        
	        try{
				if(ad.registerFuel(af)){
					gn.updateFuelQuantity(genSetId, currentQuantity, date,"Added");
					gn.updateGenDate(genSetId, date);
					ic.updateItemControllerQuantity(ic.getItemControllerByItemId(itm.getFuelItem().getItemId()).getItemControllerId(), maxquantity-addedQuantity);
					im.createItemUsage(iu);
					gtm.registerGenFuelTracking(gt);
					response.sendRedirect("BtsList.jsp");
					
				}	
				else
					request.setAttribute("failed", "!");
				request.getRequestDispatcher("AddFuel.jsp?btsId='"+btsId+"'").forward(request, response);
				
				
			}catch(Exception e){
				e.printStackTrace();
			}


	}

}
