package controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.INewService;

/**
 * Servlet implementation class SearchControl
 */
@WebServlet("/SearchControl")
public class SearchControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private INewService newService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			String txt = request.getParameter("txtSearch");
			int count = newService.countNew(txt);
			int size = 3;
			int endPage = count / size;
			
			if(count % size != 0) {
				endPage++;
			}
			request.setAttribute("endPage", endPage); // totalPage
			RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
			rd.forward(request, response);	
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	

}
