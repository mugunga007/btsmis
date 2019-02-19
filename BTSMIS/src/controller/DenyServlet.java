package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.RequestModel;

/**
 * Servlet implementation class DenyServlet
 */
public class DenyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DenyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	PrintWriter pr = response.getWriter();
	
	int requestId = Integer.parseInt(request.getParameter("requestId"));
	int itemId = Integer.parseInt(request.getParameter("itemId"));
	// pr.println("deny");
	
	// pr.println(requestId+"");
	RequestModel rm = new RequestModel();
	Date actionDate = new Date();
	if(rm.updateRequestDeny(requestId, actionDate)){
		response.sendRedirect("DetailedRequestList.jsp?itemId="+itemId);
	}
	else
		
		response.sendRedirect("DetailedRequestList.jsp?itemId="+itemId);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
