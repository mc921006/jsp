/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.8
 * Generated at: 2019-05-13 02:03:39 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.shop;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import shop.*;

public final class memberInsert_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/shop/bottom.jsp", Long.valueOf(1557709872076L));
    _jspx_dependants.put("/shop/top.jsp", Long.valueOf(1557709872122L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("shop");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
request.setCharacterEncoding("EUC-KR");
      out.write('\r');
      out.write('\n');
      shop.MemberBean mBean = null;
      mBean = (shop.MemberBean) _jspx_page_context.getAttribute("mBean", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (mBean == null){
        mBean = new shop.MemberBean();
        _jspx_page_context.setAttribute("mBean", mBean, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.introspect(_jspx_page_context.findAttribute("mBean"), request);
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>회원가입 확인</title>\r\n");
      out.write("<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script src=\"script.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body bgcolor=\"#996600\">\r\n");
      out.write("\t<br>\r\n");
      out.write("\r\n");
      out.write("\t");
      out.write('\r');
      out.write('\n');

	String id = (String)session.getAttribute("idKey");
	
	String log="";
	if(id == null) log ="<a href=login.jsp>로그인</a>";
	else log = "<a href=logout.jsp>로그아웃</a>";

	String reg="";
	if(id == null) reg ="<a href=member.jsp>회원가입</a>";
	else reg = "<a href=memberUpdate.jsp>회원수정</a>";

      out.write("\r\n");
      out.write("\r\n");
      out.write("<table width=\"75%\" align=\"center\" bgcolor=\"#FFFF99\">\r\n");
      out.write("  <tr bgcolor=\"#FFCC00\"> \r\n");
      out.write("    <th>");
      out.print(log);
      out.write("</th>\r\n");
      out.write("    <th>");
      out.print(reg);
      out.write("</th>\r\n");
      out.write("    <th><a href=\"productList.jsp\">상품목록</a></th>\r\n");
      out.write("    <th><a href=\"cartList.jsp\">장바구니</a></th>\r\n");
      out.write("    <th><a href=\"orderList.jsp\">구매목록</a></th>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<table width=\"75%\" align=\"center\" bgcolor=\"#FFFF99\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td align=\"center\" bgcolor=\"#FFFFCC\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<table width=\"95%\" align=\"center\" bgcolor=\"#FFFF99\" border=\"1\">\r\n");
      out.write("\t\t\t\t\t<form name=\"regForm\" method=\"post\" action=\"memberProc.jsp\">\r\n");
      out.write("\t\t\t\t\t\t<tr align=\"center\" bgcolor=\"#996600\">\r\n");
      out.write("\t\t\t\t\t\t\t<td colspan=\"3\"><font color=\"#FFFFFF\"><b> ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((shop.MemberBean)_jspx_page_context.findAttribute("mBean")).getName())));
      out.write(" 회원님이 작성하신 내용입니다. 확인해 주세요\r\n");
      out.write("\t\t\t\t\t\t\t\t</b></font></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>아이디</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input name=\"id\"\r\n");
      out.write("\t\t\t\t\t\t\t\tvalue=\"");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((shop.MemberBean)_jspx_page_context.findAttribute("mBean")).getId())));
      out.write("\"></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>패스워드</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input name=\"pwd\"\r\n");
      out.write("\t\t\t\t\t\t\t\tvalue=\"");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((shop.MemberBean)_jspx_page_context.findAttribute("mBean")).getPwd())));
      out.write("\"></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>이름</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input name=\"name\"\r\n");
      out.write("\t\t\t\t\t\t\t\tvalue=\"");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((shop.MemberBean)_jspx_page_context.findAttribute("mBean")).getName())));
      out.write("\"></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>성별</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td>남<input type=\"radio\" name=\"gender\" value=\"1\"\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(mBean.getGender().equals("1") ? "checked" : "");
      out.write("> 여<input\r\n");
      out.write("\t\t\t\t\t\t\t\ttype=\"radio\" name=\"gender\" value=\"2\"\r\n");
      out.write("\t\t\t\t\t\t\t\t");
      out.print(mBean.getGender().equals("2") ? "checked" : "");
      out.write(">\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td>생년월일</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input name=\"birthday\"\r\n");
      out.write("\t\t\t\t\t\t\t\tvalue=\"");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((shop.MemberBean)_jspx_page_context.findAttribute("mBean")).getBirthday())));
      out.write("\"></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>이메일</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input name=\"email\" size=\"30\"\r\n");
      out.write("\t\t\t\t\t\t\tvalue=\"");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((shop.MemberBean)_jspx_page_context.findAttribute("mBean")).getEmail())));
      out.write("\"></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>우편번호</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input name=\"zipcode\"\r\n");
      out.write("\t\t\t\t\t\t\tvalue=\"");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((shop.MemberBean)_jspx_page_context.findAttribute("mBean")).getZipcode())));
      out.write("\"></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>주소</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input name=\"address\" size=\"50\"\r\n");
      out.write("\t\t\t\t\t\t\tvalue=\"");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((shop.MemberBean)_jspx_page_context.findAttribute("mBean")).getAddress())));
      out.write("\"></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>직업</td>\r\n");
      out.write("\t\t\t\t\t\t<td><input name=\"job\"\r\n");
      out.write("\t\t\t\t\t\t\tvalue=\"");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((shop.MemberBean)_jspx_page_context.findAttribute("mBean")).getJob())));
      out.write("\"></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>취미</td>\r\n");
      out.write("\t\t\t\t\t\t<td>\r\n");
      out.write("\t");

								if (mBean.getHobby() != null) {
									String list[] = {"인터넷", "여행", "게임", "영화", "운동"}; 
									String hobbys[] = mBean.getHobby();

									for (int i = 0; i < hobbys.length; i++) {
										out.print("<input type=checkbox name=hobby" + " checked value=" + hobbys[i] + ">" + hobbys[i]);
									}
								} else {
									out.println("선택된 취미가 없습니다.");
								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"2\" align=\"center\"><input type=\"submit\"\r\n");
      out.write("\t\t\t\t\t\t\tvalue=\"확인완료\"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input\r\n");
      out.write("\t\t\t\t\t\t\ttype=\"button\" value=\"다시쓰기\" onClick=\"history.back()\"></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t");
      out.write("\r\n");
      out.write("<table width=\"75%\" align=\"center\" bgcolor=\"#FFFF99\">\r\n");
      out.write("  <tr bgcolor=\"#FFCC00\">\r\n");
      out.write("  <th width=\"90%\">\r\n");
      out.write("  Simple Shopping Mall 에 오신 것을 환영합니다.\r\n");
      out.write("  </th>\r\n");
      out.write("  <th><a href=\"admin/Index.jsp\">관리자</a></th>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
