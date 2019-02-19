package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Request;
import service.SendEmailService;
import service.User;

import service.Item;



import model.InStockModel;
import model.ItemModel;
import model.RequestModel;
import model.UserModel;

/**
 * Servlet implementation class RequestController
 */
public class RequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestController() {
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
	//	pr.println(request.getParameter("quantity"));
		
		ItemModel im = new ItemModel();
		InStockModel ism = new InStockModel();
		RequestModel rm = new RequestModel();
		UserModel um = new UserModel();
		User ur = new User();
		
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		Date requestDate = new Date();
		
		String userf = um.getUser(userId).getFname();
		String userl = um.getUser(userId).getLname();
		String ite = im.getItem(itemId).getItemName();
		
		
		String pds = request.getParameter("proposedDeliveryDate").toString();
		Date proposedDeliveryDate = null;
		System.out.println(request.getParameter("proposedDeliveryDate"));
		try{
			proposedDeliveryDate = new SimpleDateFormat("yyyy-MM-dd").parse(pds);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	
		//if(proposedDeliveryDate.before(requestDate))
			
		 String status = "Request";
		 int deliveredQuantity = 0;
		 Date actionDate = null;
		 int dumQuantity = 0;
		int stage = 2;
		String note = "";
		
		int reg = um.getUser(userId).getRegion();
		 
		String emailReceiver = um.getRegionManagerByRegion(reg).getEmail();
		
		
	int availableQuantity = im.getItemQuantity(itemId);
	int region = Integer.parseInt(request.getParameter("region"));
	Request r = new Request(itemId, quantity, requestDate, userId, proposedDeliveryDate,status,deliveredQuantity,actionDate,dumQuantity,stage,note,region);
	
	if(proposedDeliveryDate.before(requestDate)){
		request.setAttribute("date", "Proposed date is in the past, cannot be registered");
	}
	else if(availableQuantity<quantity){
		request.setAttribute("notavailable", "Quantity Not Available!");
	}else if(availableQuantity > quantity){
		if(rm.registerRequest(r)){ 
	//	im.updateItemQuantity(itemId, availableQuantity-quantity);
			
			// Send Notification
			
			
		 //   String host = "smtp.gmail.com";
	      //  String port = "587";
	       
	      //  String mailFrom = "orehoproject@gmail.com";
	      //  String password = "admin15630";
	        
			
			String host = "mail.bonlinelimited.com";
		    String port = "2525";
	        String mailFrom = "notification@btsmis.com";
	        String password = "n0tification";
	 
	        // outgoing message information
	        String mailTo = emailReceiver;
	        String subject = "Btsmis Notification";
	        String message = "Hi , Your receiced requests to confirm By "+userf +" "+userl +"  Click this Link: http://btsmis.com/RequestRegion.jsp";
	 
	        SendEmailService mailer = new SendEmailService();
	 
	        try {
	            mailer.sendPasswordEmail(host, port, mailFrom, password, mailTo, subject, message);
	            System.out.println("Email sent.");
	            
	        } catch (Exception ex) {
	            System.out.println("Failed to send email.");
	            ex.printStackTrace();         
	        }

			
			// Send Notification
			
			
		request.setAttribute("success", "The Request is Sent Successfully!");
	}
		else
			
			request.setAttribute("notinserted", "An Error Occured!");
	
	}
	request.getRequestDispatcher("RequestForm.jsp").forward(request, response);
}
	}
