package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.SendEmailService;

import model.RequestModel;
import model.UserModel;

/**
 * Servlet implementation class ApproveRequestOperations
 */
public class ApproveRequestOperations extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApproveRequestOperations() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int requestId = Integer.parseInt(request.getParameter("requestId"));
		RequestModel rm = new RequestModel();
		rm.approveRequestOperations(requestId);
		
		UserModel um = new UserModel();
		String emailReceiver = um.getStoreKeeper().getEmail();
		
		String host = "mail.bonlinelimited.com";
	    String port = "2525";
        String mailFrom = "notification@btsmis.com";
        String password = "n0tification";
        
        // outgoing message information
        String mailTo = emailReceiver;
        String subject = "Btsmis Notification";
        String message = "Hi , Your receiced requests to confirm By Region Manager, Click this Link to Approve: http://btsmis.com/RequestRegion.jsp";
 
        SendEmailService mailer = new SendEmailService();
 
        try {
            mailer.sendPasswordEmail(host, port, mailFrom, password, mailTo, subject, message);
            System.out.println("Email sent.");
            
        } catch (Exception ex) {
            System.out.println("Failed to send email.");
            ex.printStackTrace();         
        }

		
		// Send Notification


		
		response.sendRedirect("RequestOperations.jsp"); 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
