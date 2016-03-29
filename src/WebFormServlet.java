import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class WebFormServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		ServletContext context = request.getSession().getServletContext();
		InputStream inputStream = context.getResourceAsStream("/request_form.html");
		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
		String thisLine;

		while ((thisLine = reader.readLine()) != null) {
			out.println(thisLine);
		}
	}
}
