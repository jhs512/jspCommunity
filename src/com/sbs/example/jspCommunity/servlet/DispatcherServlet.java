package com.sbs.example.jspCommunity.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sbs.example.jspCommunity.container.Container;
import com.sbs.example.jspCommunity.dto.Member;
import com.sbs.example.mysqlutil.MysqlUtil;

public abstract class DispatcherServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		run(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	public void run(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Map<String, Object> doBeforeActionRs = doBeforeAction(req, resp);

		if (doBeforeActionRs == null) {
			return;
		}

		String jspPath = doAction(req, resp, (String) doBeforeActionRs.get("controllerName"), (String) doBeforeActionRs.get("actionMethodName"));

		if (jspPath == null) {
			resp.getWriter().append("jsp 정보가 없습니다.");
			return;
		}

		doAfterAction(req, resp, jspPath);
	}

	private Map<String, Object> doBeforeAction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");

		String requestUri = req.getRequestURI();
		String[] requestUriBits = requestUri.split("/");

		if (requestUriBits.length < 5) {
			resp.getWriter().append("올바른 요청이 아닙니다.");
			return null;
		}

		MysqlUtil.setDBInfo("127.0.0.1", "sbsst", "sbs123414", "jspCommunity");

		String controllerName = requestUriBits[3];
		String actionMethodName = requestUriBits[4];
		
		boolean isLogined = false;
		int loginedMemberId = 0;
		Member loginedMember = null;
		
		HttpSession session = req.getSession();
		
		if ( session.getAttribute("loginedMemberId") != null ) {
			isLogined = true;
			loginedMemberId = (int)session.getAttribute("loginedMemberId");
			loginedMember = Container.memberService.getMemberById(loginedMemberId);
		}
		
		req.setAttribute("isLogined", isLogined);
		req.setAttribute("loginedMemberId", loginedMemberId);
		req.setAttribute("loginedMember", loginedMember);

		Map<String, Object> rs = new HashMap<>();
		rs.put("controllerName", controllerName);
		rs.put("actionMethodName", actionMethodName);

		return rs;
	}

	protected abstract String doAction(HttpServletRequest req, HttpServletResponse resp, String controllerName, String actionMethodName);

	private void doAfterAction(HttpServletRequest req, HttpServletResponse resp, String jspPath) throws ServletException, IOException {
		MysqlUtil.closeConnection();

		RequestDispatcher rd = req.getRequestDispatcher("/jsp/" + jspPath + ".jsp");
		rd.forward(req, resp);
	}
}
