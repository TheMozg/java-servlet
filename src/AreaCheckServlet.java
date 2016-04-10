import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.lang.*;
import java.util.*;

public class AreaCheckServlet extends HttpServlet {

	private double x;
	private double y;
	private double r;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException
	{
		response.setContentType("text/html; charset=UTF-8");
		String x_str = request.getParameter("X");
		String y_str = request.getParameter("Y");
		String r_str = request.getParameter("R");
		if(x_str == null)
			x_str = "(empty)";
		if(y_str == null)
			y_str = "(empty)";
		if(r_str == null)
			r_str = "(empty)";
		String res = "WRONG INPUT";
		if(inputIsCorrect(x_str, y_str, r_str)){
			if(contains(x,y,r))
				res = "IN";
			else
				res = "OUT";
		}

		PrintWriter out = response.getWriter();
		ServletContext context = request.getSession().getServletContext();

		List<String[]> reqlist = (List<String[]>)context.getAttribute("reqlist");
		if(reqlist == null)
			reqlist = new ArrayList<String[]>();
		reqlist.add(new String[]{x_str,y_str,r_str,res});
		context.setAttribute("reqlist",reqlist);

		InputStream inputStream = context.getResourceAsStream("/response_form.html");
		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
		String thisLine;
		while ((thisLine = reader.readLine()) != null) {
			System.out.println(thisLine);
			thisLine = thisLine.replace("_XVALUE", x_str);
			thisLine = thisLine.replace("_YVALUE", y_str);
			thisLine = thisLine.replace("_RVALUE", r_str);
			thisLine = thisLine.replace("_RESVALUE", res);
			out.println(thisLine);
		}
	}

	public boolean inputIsCorrect(String x, String y, String r){
		try {
			this.x = Double.parseDouble(x);
			this.y = Double.parseDouble(y);
			this.r = Double.parseDouble(r);
		} catch (NumberFormatException e) {
			return false;
		}
		boolean ok_x = false;
		for (double i=-2; i <= 2; i+=0.5) {
			if(this.x == i) ok_x = true;
		}
		boolean ok_r = false;
		for (double i=1; i <= 5; i++) {
			if(this.r == i) ok_r = true;
		}

		if(this.y>=-5 && this.y<=5 && ok_x && ok_r)
			return true;
		return false;
	}

	public boolean contains(double x, double y, double r)
	{
		//rectangle
		if (x >= 0 &&
				x <= -r/2 &&
				y <= 0 &&
				y >= -r)
		return true;

		//triangle
		if (x >= 0 &&
				y >= 0 &&
				y <= -x+r/2)
		return true;

		//circle
		if (x <= 0 &&
				y <= 0 &&
				(x*x + y*y) <= r*r)
		return true;

		return false;
	}
}
