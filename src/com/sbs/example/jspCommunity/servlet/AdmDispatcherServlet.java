package com.sbs.example.jspCommunity.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.example.jspCommunity.container.Container;
import com.sbs.example.jspCommunity.controller.AdmMemberController;
import com.sbs.example.mysqlutil.MysqlUtil;

@WebServlet("/adm/*")
public class AdmDispatcherServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");

		String requestUri = req.getRequestURI();
		String[] requestUriBits = requestUri.split("/");

		if (requestUriBits.length < 5) {
			resp.getWriter().append("올바른 요청이 아닙니다.");
			return;
		}

		String controllerName = requestUriBits[3];
		String actionMethodName = requestUriBits[4];

		MysqlUtil.setDBInfo("127.0.0.1", "sbsst", "sbs123414", "jspCommunity");

		String jspPath = null;

		if (controllerName.equals("member")) {
			AdmMemberController memberController = Container.admMemberController;

			if (actionMethodName.equals("list")) {
				jspPath = memberController.showList(req, resp);
			}
		}

		MysqlUtil.closeConnection();

		RequestDispatcher rd = req.getRequestDispatcher("/jsp/" + jspPath + ".jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
