package ch03;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/ch03/postServlet")
public class PostServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=EUC-KR");
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>Post Servlet ¹æ½Ä</h1>");
		out.println("<h3>id : "+ id + "</h3>");
		out.println("<h3>pwd : "+ pwd + "</h3>");
		out.println("<h3>email : "+ email + "</h3>");
		out.println("</body>");
		out.println("</html>");
	}
}
