package com.sbs.example.jspCommunity.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.example.jspCommunity.container.Container;
import com.sbs.example.jspCommunity.controller.UsrArticleController;
import com.sbs.example.jspCommunity.controller.UsrHomeController;
import com.sbs.example.jspCommunity.controller.UsrLikeController;
import com.sbs.example.jspCommunity.controller.UsrMemberController;
import com.sbs.example.jspCommunity.controller.UsrReplyController;

@WebServlet("/usr/*")
public class UsrDispatcherServlet extends DispatcherServlet {
	@Override
	protected String doAction(HttpServletRequest req, HttpServletResponse resp, String controllerName, String actionMethodName) {
		String jspPath = null;

		if (controllerName.equals("home")) {
			UsrHomeController homeController = Container.usrHomeController;

			if (actionMethodName.equals("main")) {
				jspPath = homeController.showMain(req, resp);
			}
		} else if (controllerName.equals("member")) {
			UsrMemberController memberController = Container.usrMemberController;

			if (actionMethodName.equals("list")) {
				jspPath = memberController.showList(req, resp);
			} else if (actionMethodName.equals("findLoginId")) {
				jspPath = memberController.showFindLoginId(req, resp);
			} else if (actionMethodName.equals("doFindLoginId")) {
				jspPath = memberController.doFindLoginId(req, resp);
			} else if (actionMethodName.equals("findLoginPw")) {
				jspPath = memberController.showFindLoginPw(req, resp);
			} else if (actionMethodName.equals("doFindLoginPw")) {
				jspPath = memberController.doFindLoginPw(req, resp);
			} else if (actionMethodName.equals("modify")) {
				jspPath = memberController.showModify(req, resp);
			} else if (actionMethodName.equals("doModify")) {
				jspPath = memberController.doModify(req, resp);
			} else if (actionMethodName.equals("join")) {
				jspPath = memberController.showJoin(req, resp);
			} else if (actionMethodName.equals("doJoin")) {
				jspPath = memberController.doJoin(req, resp);
			} else if (actionMethodName.equals("login")) {
				jspPath = memberController.showLogin(req, resp);
			} else if (actionMethodName.equals("doLogin")) {
				jspPath = memberController.doLogin(req, resp);
			} else if (actionMethodName.equals("doLogout")) {
				jspPath = memberController.doLogout(req, resp);
			} else if (actionMethodName.equals("getLoginIdDup")) {
				jspPath = memberController.getLoginIdDup(req, resp);
			}
		} else if (controllerName.equals("article")) {
			UsrArticleController articleController = Container.usrArticleController;

			if (actionMethodName.equals("list")) {
				jspPath = articleController.showList(req, resp);
			} else if (actionMethodName.equals("detail")) {
				jspPath = articleController.showDetail(req, resp);
			} else if (actionMethodName.equals("modify")) {
				jspPath = articleController.showModify(req, resp);
			} else if (actionMethodName.equals("doModify")) {
				jspPath = articleController.doModify(req, resp);
			} else if (actionMethodName.equals("write")) {
				jspPath = articleController.showWrite(req, resp);
			} else if (actionMethodName.equals("doWrite")) {
				jspPath = articleController.doWrite(req, resp);
			} else if (actionMethodName.equals("doDelete")) {
				jspPath = articleController.doDelete(req, resp);
			}
		} else if (controllerName.equals("like")) {
			UsrLikeController likeController = Container.usrLikeController;

			if (actionMethodName.equals("doLike")) {
				jspPath = likeController.doLike(req, resp);
			} else if (actionMethodName.equals("doCancelLike")) {
				jspPath = likeController.doCancelLike(req, resp);
			} else if (actionMethodName.equals("doDislike")) {
				jspPath = likeController.doDislike(req, resp);
			} else if (actionMethodName.equals("doCancelDislike")) {
				jspPath = likeController.doCancelDislike(req, resp);
			}
		} else if (controllerName.equals("reply")) {
			UsrReplyController replyController = Container.usrReplyController;

			if (actionMethodName.equals("doWrite")) {
				jspPath = replyController.doWrite(req, resp);
			} else if (actionMethodName.equals("doDelete")) {
				jspPath = replyController.doDelete(req, resp);
			} else if (actionMethodName.equals("doModify")) {
				jspPath = replyController.doModify(req, resp);
			}
		}

		return jspPath;
	}
}
