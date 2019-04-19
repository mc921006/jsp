package ch03;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import ch08.RegisterMgr2;

@WebServlet("/ch03/loginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		RegisterMgr2 mgr = new RegisterMgr2();
		boolean result = mgr.loginRegister2(id, pwd);
		HttpSession session = request.getSession();
		if (result) { //�α��� ����
			session.setAttribute("idKey", id);
		}else { //�α��� ����
			session.setAttribute("msg", "id�� pwd �ٽ� �Է��ϼ���.");
		}
		response.sendRedirect("login.jsp");
	}
}
