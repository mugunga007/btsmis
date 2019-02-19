package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AccessRequestModel;
import model.InStockModel;
import model.ItemCategoryModel;
import model.ItemModel;
import model.RequestModel;
import service.AccessRequest;
import service.ItemCategory;
import service.Request;

/**
 * Servlet implementation class AccessRequestController
 */
public class AccessRequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccessRequestController() {
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
		
		AccessRequestModel arm = new AccessRequestModel();
		
		  int partnerId = Integer.parseInt(request.getParameter("partnerId"));
		     String btsId = request.getParameter("btsId");
		     Date now = new Date();
		     Date accessDate = null;
		     String accessDatest = request.getParameter("accessDate");
				try{
					accessDate = new SimpleDateFormat("yyyy-MM-dd").parse(accessDatest);
					
				}catch(Exception e){
					e.printStackTrace();
				}
		     
		     
		     String staffId = request.getParameter("staffId");
		     String staffFname= request.getParameter("staffFname");
		     String staffLname= request.getParameter("staffLname");
		     String reason= request.getParameter("reason");
		     
		     
		     String timeReceiveInfost= request.getParameter("timeReceiveInfo");
		     
		     Date timeReceiveInfo = null;
		     
				try{
					timeReceiveInfo = new SimpleDateFormat("yyyy-MM-dd").parse(timeReceiveInfost);
					
				}catch(Exception e){
					e.printStackTrace();
				}
		     
		     String infoFrom= request.getParameter("infoFrom");
		     String reportedIssue= request.getParameter("reportedIssue");
		     String ticketSeverity= request.getParameter("ticketSeverity");
		     String status= "Waiting";
		     int userId= Integer.parseInt(request.getParameter("partnerId"));
		
		AccessRequest ac = new AccessRequest(partnerId, btsId, accessDate, staffId, staffFname, staffLname, reason, timeReceiveInfo, infoFrom, reportedIssue, ticketSeverity, status, userId,now);
		
		
		
		try{
			if(timeReceiveInfo.after(now)){
				request.setAttribute("futuredate", "This Date Can not be in the future" );
			}else{
			if(arm.registerAccessRequest(ac)){
				request.setAttribute("success", "Changes made successfully!");
			}
			else
				request.setAttribute("failed", "An Error Occured");
			request.getRequestDispatcher("AccessRequestForm.jsp").forward(request, response);
			
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	

}
