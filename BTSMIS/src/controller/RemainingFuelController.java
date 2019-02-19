package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AddFuelModel;
import model.GenFuelTrackingModel;
import model.GenSetModel;
import model.ItemControllerModel;
import model.ItemModel;
import model.ItemUsageModel;
import model.RemainingFuelModel;
import service.AddFuel;
import service.GenFuelTracking;
import service.ItemUsage;
import service.RemainingFuel;

/**
 * Servlet implementation class RemainingFuelController
 */
public class RemainingFuelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemainingFuelController() {
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
		
		PrintWriter pr = response.getWriter();
		
	//	ItemControllerModel ic = new ItemControllerModel();
	//	ItemModel itm = new ItemModel();
	//	int maxquantity = ic.getItemControllerByItemId(itm.getFuelItem().getItemId()).getQuantity();
	
		RemainingFuelModel rm = new RemainingFuelModel();
		
		 AddFuelModel ad=new AddFuelModel();
		 GenSetModel gn = new GenSetModel();
	       String genSetId=request.getParameter("genSetId");
	       int userId= Integer.parseInt(request.getParameter("userId"));
	       String btsId=request.getParameter("bts");
	       double runHours = Double.parseDouble(request.getParameter("hours"));
	        int quantity=Integer.parseInt(request.getParameter("quantity"));
	        Date ds=new Date();
	        
	        int remHours = Integer.parseInt(request.getParameter("hours"));
	    	RemainingFuel rf = new RemainingFuel(genSetId, quantity,userId, ds, remHours);
	    	
	    	
	    /*    
	        pr.println(genSetId);
	        pr.println(userId);
	        pr.println(btsId);
	        pr.println(quantity+"");
	        pr.println(hours+"");
	        pr.println(ds);
	      */  
	        
	       // AddFuelModel ads=new AddFuelModel(quantity, genSetId, quantity,da);
	        //AddFuel af=new AddFuel(genSetId, quantity, ds);
	        //ItemUsage iu = new ItemUsage(userId, itm.getFuelItem().getItemId(), quantity, "GenSet "+genSetId, ds, "Added");
	        //ItemUsageModel im = new ItemUsageModel();
	        
	       //int genCurrentQuantity = gn.getGenSetById(genSetId).getQuantity();
	    	GenFuelTrackingModel gtm= new GenFuelTrackingModel();
		     //  GenFuelTracking gt = new GenFuelTracking(genSetId, userId, quantity, "Remaining", ds, hours+"");
	       
	    	
		   //    GenFuelTracking gt = new GenFuelTracking(genSetId, userId, quantity, "Remaining", ds, hours, hours, quantity, 0);
	    
	//    	double latestRunHours = gtm.getLatestGenFuelTrackingRemaining(userId, genSetId).getRunHours();
	    	
	    	String action = "Remaining";
	        double progressiveQuantity = 0;
	        double perHour = 0;
	 //       double hours = runHours - latestRunHours;
	        
	        
	        
	        
	        PrintWriter p = response.getWriter();
	        p.println("runHours: "+runHours);
	    //    p.println("latestHours: "+latestRunHours);
	    //    p.println("Ran Hours: "+hours);
	        
	        
	        /*
	    	GenFuelTracking gt = new GenFuelTracking(genSetId, userId, quantity, action, ds, runHours, hours,progressiveQuantity , perHour);
	    	
	        try{
				if(rm.registerRemainingFuel(rf)){
					gn.updateFuelQuantity(genSetId, quantity, ds,"Remaining");
					gn.updateGenDate(genSetId, ds);
					response.sendRedirect("BtsList.jsp");
					gtm.registerGenFuelTracking(gt);
				}	
				else
					request.setAttribute("failed", "An error Occured");
				request.getRequestDispatcher("RemainingFuel.jsp?btsId='"+btsId+"'").forward(request, response);
				
				
			}catch(Exception e){
				e.printStackTrace();
			}

		
*/
	}

}
