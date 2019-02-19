package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AccessHandlingModel;
import model.AccessRequestModel;

import service.AccessHandling;

/**
 * Servlet implementation class AccessHandlingController
 */
public class AccessHandlingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccessHandlingController() {
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
		
		AccessHandling ah = new AccessHandling();
		
		AccessHandlingModel ahm = new AccessHandlingModel();
		AccessRequestModel arm = new AccessRequestModel();
	Date reportingTime = new Date();
	
	int ticketId = Integer.parseInt(request.getParameter("ticketId"));
	String statusAtArrival =  request.getParameter("statusAtArrival");
	String actualIssue =request.getParameter("actualIssue");
	String issueHandlingResult =request.getParameter("issueHandlingResult");
	String downtime = (request.getParameter("downtime"));
	String downtimereason = request.getParameter("downtimereason");
	int runningHours = Integer.parseInt(request.getParameter("runningHours"));
	String statusAtDeparture = request.getParameter("statusAtDeparture");
	int userId = Integer.parseInt(request.getParameter("userId"));
	String attachement = "No";
	String status = "No";
	

		
		
		ah = new AccessHandling(ticketId, reportingTime, statusAtArrival, actualIssue, issueHandlingResult, downtime, downtimereason, runningHours, statusAtDeparture, userId, attachement, status);
		
if(ahm.registerAccessHandling(ah)){
	request.setAttribute("success", "Reported Successfully");
	arm.updateReportedAccessRequest(ah.getTicketId());
	request.getSession().setAttribute("ahId", ah.getAccessHandlingId());
	request.getRequestDispatcher("AccessHandlingAttachement.jsp").forward(request, response);
}else{
		request.setAttribute("failed", "An Error Occured");
	
request.getRequestDispatcher("AccessHandlingForm.jsp").forward(request, response);
}
	
}
		
	}


