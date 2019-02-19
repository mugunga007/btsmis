package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BtsModel;

/**
 * Servlet implementation class AssignBtsController
 */
public class AssignBtsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignBtsController() {
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
		BtsModel bt = new BtsModel();
		String id = request.getParameter("bts");
		int engId = Integer.parseInt(request.getParameter("engId"));
		int region = Integer.parseInt(request.getParameter("rg"));
		try{
			if(bt.updateBtsEngineer(id, engId))
				request.setAttribute("success", "Updated successfully!");
			else
				request.setAttribute("failed", "An Error Occured");
			request.getRequestDispatcher("AssignBTS.jsp?eng="+engId+"&rg="+region+"").forward(request, response);
			System.out.print(engId+"!!");
			System.out.print(region+"!!");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
