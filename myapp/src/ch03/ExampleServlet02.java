package ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

//URL mappings
//@WebServlet("/ch03/exampleServlet02")
public class ExampleServlet02 extends HttpServlet {

	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		System.out.println("톰캣 콘솔 창 출력");
		//html 시작
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>URL mappings을 web.xml 세팅</h1>");
		out.println("</body>");
		out.println("</html>");
		
		//html 끝
	}
}
