package ch03;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/ch03/getServlet")
public class GetServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=EUC-KR");
		//한글처리 : server.xml에 67라인쯤에 URIEncoding = "EUC-KR"세팅
		String msg = request.getParameter("msg");
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<body>");
		out.print("<h1>Get Servlet 방식</h1>");
		out.print("<h2>msg : "+msg +"</h2>");
		out.print("</body>");
		out.print("</html>");
	}
}

