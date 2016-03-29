import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ControllerServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");

		if (request.getParameter("X") != null && request.getParameter("Y") != null && request.getParameter("R") != null) {
			RequestDispatcher rd = request.getRequestDispatcher("area");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("form");
			rd.forward(request, response);
		}
	}
}
