package ch01;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

@WebServlet("/helloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
		HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>MyServlet</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>º≠∫Ì∏¥¿Œ∞°?</h1>");
		out.println("</body>");
		out.println("</html>");
	}
}
