package ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

//URL mappings
@WebServlet("/ch03/exampleServlet01")
public class ExampleServlet01 extends HttpServlet {

	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		System.out.println("��Ĺ �ܼ� â ���");
		//html ����
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>��Ŭ������ ���� �����</h1>");
		out.println("</body>");
		out.println("</html>");
		
		//html ��
	}
}
